# App Signing with ALOps

This guide explains how to configure code signing for Business Central apps using ALOps, covering both traditional PFX certificates and modern HSM (Hardware Security Module) approaches with Azure Key Vault.

*Reference: [GitHub Issue #856](https://github.com/HodorNV/ALOps/issues/856) and [GitHub Issue #717](https://github.com/HodorNV/ALOps/issues/717)*

## Overview

ALOps supports multiple code signing methods through the `ALOpsAppSign@1` task:

- **PFX Method**: Traditional certificate file signing (legacy approach)
- **HSM Method**: Modern Hardware Security Module signing with Azure Key Vault
- **Trusted Signing**: Microsoft's managed code signing service

## Prerequisites

### For All Methods
- Valid code signing certificate from a trusted Certificate Authority
- Azure DevOps pipeline with appropriate permissions
- Business Central app compiled and ready for signing

### For HSM with Azure Key Vault
- Azure subscription with Key Vault Premium (for HSM requirements)
- Certificate imported into Azure Key Vault
- Azure AD App Registration with Key Vault permissions
- Build agents with .NET 8.0 SDK and Visual C++ Redistributable 2013

## Configuration Methods

### 1. PFX Certificate Signing (Traditional)

```yaml
- task: ALOpsAppSign@1
  displayName: 'ALOps App Sign'
  inputs:
    signmethod: PFX                          # Use traditional PFX signing
    usedocker: false                         # Set to true if using Docker
    artifact_path: $(System.ArtifactsDirectory) # Path to app files
    nav_artifact_app_filter: '*.app'         # Filter for app files
    pfx_path: 'https://yourblob.blob.core.windows.net/certificates/cert.pfx' # PFX file location
    pfx_password: '$(PfxPassword)'           # Store in Azure Key Vault or secure variable
    timestamp_uri: 'http://timestamp.digicert.com' # Timestamp server
    publish_artifact: true                   # Publish signed apps as artifacts
```

### 2. HSM with Azure Key Vault

```yaml
- task: ALOpsAppSign@1
  displayName: 'ALOps App Sign with HSM'
  inputs:
    signmethod: HSM                          # Use HSM signing method
    hsmmethod: KEYVAULT                      # Use Azure Key Vault HSM
    usedocker: false                         # HSM signing requires direct agent access
    artifact_path: $(System.ArtifactsDirectory)
    nav_artifact_app_filter: '*.app'
    
    # Azure Key Vault Configuration
    hsm_keyvault_name: 'your-keyvault-name' # Name of your Azure Key Vault
    hsm_keyvault_certificate_name: 'your-cert-name' # Certificate name in Key Vault
    hsm_tenantid: '$(AzureTenantId)'         # Azure AD Tenant ID
    hsm_clientid: '$(KeyVaultClientId)'      # App Registration Client ID
    hsm_client_secret: '$(KeyVaultClientSecret)' # App Registration Client Secret
    
    # Signing Configuration
    hsm_digestalgorithm: 'sha256'           # Digest algorithm (sha256 recommended)
    hsm_description: 'Business Central App' # Description embedded in signature
    hsm_description_url: 'https://www.yourcompany.com' # URL embedded in signature
    
    # Timestamp Configuration
    timestamp_uri: 'http://timestamp.digicert.com'
    publish_artifact: true
```

### 3. Trusted Signing (Microsoft Managed)

```yaml
- task: ALOpsAppSign@1
  displayName: 'ALOps App Sign with Trusted Signing'
  inputs:
    signmethod: HSM
    hsmmethod: TRUSTEDSIGNING                # Use Microsoft Trusted Signing
    usedocker: false
    artifact_path: $(System.ArtifactsDirectory)
    nav_artifact_app_filter: '*.app'
    
    # Trusted Signing Configuration
    hsm_signing_endpoint: 'https://your-region.codesigning.azure.net' # Trusted Signing endpoint
    hsm_signing_account: 'your-trusted-signing-account' # Account name
    hsm_trusted_certificateprofile: 'your-certificate-profile' # Certificate profile
    hsm_tenantid: '$(AzureTenantId)'
    hsm_clientid: '$(TrustedSigningClientId)'
    hsm_client_secret: '$(TrustedSigningClientSecret)'
    
    # Signing Configuration
    hsm_digestalgorithm: 'sha256'
    hsm_description: 'Business Central App'
    hsm_description_url: 'https://www.yourcompany.com'
    publish_artifact: true
```

## Parameter Explanations

### HSM Description Parameters

These parameters are embedded in the digital signature and are **descriptive only** - they don't need to match anything in Azure:

#### `hsm_description`
- **Purpose**: Human-readable description of what's being signed
- **Examples**: `'Business Central App'`, `'MyCompany AL Extension'`, `'Production Release v1.0'`
- **Recommendation**: Use a consistent description that identifies your organization or app

#### `hsm_description_url`
- **Purpose**: URL associated with the signature (often company website)
- **Examples**: `'https://www.yourcompany.com'`, `'https://github.com/yourorg/yourapp'`
- **Recommendation**: Use your main company website or app repository URL

### Azure Key Vault Parameters

#### `hsm_keyvault_name`
- **Purpose**: Name of your Azure Key Vault containing the certificate
- **Example**: `'contoso-codesigning-kv'`
- **Note**: Just the vault name, not the full URL

#### `hsm_keyvault_certificate_name`
- **Purpose**: Name of the certificate stored in Key Vault
- **Example**: `'codesigning-cert-2024'`
- **Note**: This is the certificate name as it appears in Key Vault

#### Authentication Parameters
- **`hsm_tenantid`**: Azure AD Tenant ID (GUID format)
- **`hsm_clientid`**: App Registration Client ID  
- **`hsm_client_secret`**: App Registration Client Secret (store securely)

## Setup Instructions

### Setting Up Azure Key Vault HSM Signing

#### 1. Create Azure Key Vault
```bash
# Create Resource Group (if needed)
az group create --name rg-codesigning --location westeurope

# Create Key Vault Premium (required for HSM)
az keyvault create --name your-keyvault-name \
  --resource-group rg-codesigning \
  --location westeurope \
  --sku premium
```

#### 2. Import Certificate to Key Vault
Follow your Certificate Authority's documentation for HSM certificate setup:
- **GlobalSign**: [Azure Key Vault Setup Guide](https://support.globalsign.com/code-signing/Code-Signing-certificate-setup-in-Azure-Key-vault)
- **DigiCert**: Check DigiCert's Azure Key Vault integration documentation

#### 3. Create App Registration
```bash
# Create App Registration
az ad app create --display-name "ALOps Code Signing"

# Create Service Principal
az ad sp create --id <app-id-from-previous-command>

# Create Client Secret (save the output securely)
az ad app credential reset --id <app-id> --append
```

#### 4. Configure Key Vault Permissions
```bash
# Grant App Registration access to certificates
az keyvault set-policy --name your-keyvault-name \
  --spn <client-id> \
  --certificate-permissions get list \
  --key-permissions get list sign \
  --secret-permissions get list
```

#### 5. Configure Pipeline Variables
Set these as secure variables in Azure DevOps:
- `AzureTenantId`: Your Azure AD Tenant ID
- `KeyVaultClientId`: App Registration Client ID
- `KeyVaultClientSecret`: App Registration Client Secret

### Build Agent Requirements for HSM

Your build agents need these prerequisites:

#### Required Software
- **.NET 8.0 SDK**: Required for AzureSignTool
- **Visual C++ Redistributable 2013**: Required for navsip.dll
- **Internet Access**: For accessing Azure Key Vault and timestamp servers

#### Install .NET 8.0 SDK
```powershell
# Download and install .NET 8.0 SDK
$tempFile = Join-Path $env:TEMP "dotnet-sdk-8.0.exe"
Invoke-WebRequest -Uri "https://download.visualstudio.microsoft.com/download/pr/ba3a1364-27d8-472e-a33b-5ce0937728aa/6f9495e5a587406c85af6f93b1c89295/dotnet-sdk-8.0.404-win-x64.exe" `
                  -UseBasicParsing `
                  -OutFile $tempFile
Start-Process -Wait -FilePath $tempFile -ArgumentList "/quiet"
Remove-Item $tempFile -Force
```

#### Register navsip.dll (if needed)
If you encounter signing errors, you may need to register navsip.dll:

```powershell
# Download and register navsip.dll for Business Central app signing
function Register-NavSip {
    $navSipPath = "C:\Windows\System32\navsip.dll"
    
    if (-not (Test-Path $navSipPath)) {
        # Download navsip.dll from BC artifacts
        # This requires BCContainerHelper or manual download
        Write-Host "navsip.dll not found. Please install from BC artifacts."
        return
    }
    
    # Unregister and re-register
    RegSvr32 /u /s $navSipPath
    RegSvr32 /s $navSipPath
    Write-Host "navsip.dll registered successfully"
}

Register-NavSip
```

## Examples

### Basic HSM Signing Example
```yaml
name: 'Build and Sign App'

trigger:
  branches:
    include:
    - main

pool: 'your-build-pool'

variables:
- group: 'CodeSigning-Variables' # Contains secure variables

steps:
- checkout: self
  clean: true

- task: ALOpsAppCompiler@2
  displayName: 'Compile App'
  inputs:
    artifacttype: 'Sandbox'
    appversiontemplate: '1.0.*.0'
    publishartifact: false

- task: ALOpsAppSign@1
  displayName: 'Sign App with HSM'
  inputs:
    signmethod: HSM
    hsmmethod: KEYVAULT
    usedocker: false
    artifact_path: $(ALOPS_COMPILE_ARTIFACT)
    hsm_keyvault_name: 'contoso-codesigning-kv'
    hsm_keyvault_certificate_name: 'codesigning-cert-2024'
    hsm_tenantid: '$(AzureTenantId)'
    hsm_clientid: '$(KeyVaultClientId)'
    hsm_client_secret: '$(KeyVaultClientSecret)'
    hsm_description: 'Contoso Business Central App'
    hsm_description_url: 'https://www.contoso.com'
    timestamp_uri: 'http://timestamp.digicert.com'
    publish_artifact: true

- task: ALOpsAppSignVerify@1
  displayName: 'Verify Signature'
  inputs:
    usedocker: false
    artifact_path: $(ALOPS_COMPILE_ARTIFACT)
```

### Multi-Environment Signing
```yaml
- task: ALOpsAppSign@1
  displayName: 'Sign App - $(Environment)'
  inputs:
    signmethod: HSM
    hsmmethod: KEYVAULT
    usedocker: false
    artifact_path: $(System.ArtifactsDirectory)
    hsm_keyvault_name: '$(KeyVaultName)' # Different per environment
    hsm_keyvault_certificate_name: '$(CertificateName)' # Different per environment
    hsm_tenantid: '$(AzureTenantId)'
    hsm_clientid: '$(KeyVaultClientId)'
    hsm_client_secret: '$(KeyVaultClientSecret)'
    hsm_description: 'BC App - $(Environment) - $(Build.BuildNumber)'
    hsm_description_url: 'https://www.yourcompany.com'
    timestamp_uri: 'http://timestamp.digicert.com'
    publish_artifact: true
```

## Best Practices

### Security
- **Store Secrets Securely**: Always use Azure Key Vault or Azure DevOps secure variables
- **Limit Permissions**: Grant minimal required permissions to Key Vault
- **Use Managed Identity**: Consider using managed identity instead of client secrets when possible
- **Regular Rotation**: Rotate client secrets and certificates regularly

### Certificate Management
- **Certificate Expiry**: Monitor certificate expiration dates
- **Backup Certificates**: Ensure certificates are properly backed up
- **Test Certificates**: Use test certificates in non-production environments
- **HSM Compliance**: Use Key Vault Premium for FIPS 140-2 Level 2 compliance

### Pipeline Configuration
- **Separate Variables**: Use different variable groups for different environments
- **Conditional Signing**: Consider conditional signing based on branch or environment
- **Artifact Management**: Properly organize signed and unsigned artifacts
- **Build Agent Management**: Ensure build agents have required prerequisites

### Performance
- **Cache Dependencies**: Cache .NET SDK and tools installation
- **Parallel Builds**: Configure parallel builds if signing multiple apps
- **Network Optimization**: Ensure reliable network connectivity to Azure services

## Troubleshooting

### Common Issues

#### "Certificate not found in Key Vault"
- **Cause**: Incorrect certificate name or insufficient permissions
- **Solution**: Verify certificate name in Key Vault and check App Registration permissions

#### "The file cannot be signed because it is not a recognized file type"
- **Cause**: Missing navsip.dll registration
- **Solution**: Register navsip.dll on build agents (see setup instructions above)

#### "Authentication failed to Key Vault"
- **Cause**: Incorrect client ID, secret, or tenant ID
- **Solution**: Verify App Registration credentials and Key Vault access policies

#### "Timestamp server unreachable"
- **Cause**: Network connectivity issues or timestamp server downtime
- **Solution**: Try alternative timestamp servers or check network configuration

### Alternative Timestamp Servers
If the default timestamp server is unavailable, try these alternatives:
- `http://timestamp.digicert.com`
- `http://timestamp.comodoca.com/authenticode`
- `http://rfc3161timestamp.globalsign.com/advanced`
- `http://timestamp.sectigo.com`

### Debug Tips
- **Enable Verbose Logging**: Add debug parameters to troubleshoot issues
- **Test Locally**: Test signing configuration on development machines first
- **Verify Permissions**: Use Azure CLI to verify Key Vault access
- **Check Network**: Ensure build agents can reach Azure services

### Error Messages and Solutions

| Error | Cause | Solution |
|-------|-------|----------|
| "Access denied to Key Vault" | Insufficient permissions | Update Key Vault access policies |
| "Certificate expired" | Certificate past expiry date | Renew certificate with CA |
| "Invalid client secret" | Expired or incorrect secret | Generate new client secret |
| "navsip.dll not registered" | Missing Business Central signing support | Register navsip.dll on build agent |
| "Network timeout" | Connectivity issues | Check network and firewall settings |

## Migration from PFX to HSM

### Planning the Migration
1. **Assess Current Setup**: Document existing PFX-based signing
2. **Choose HSM Method**: Select between Azure Key Vault or Trusted Signing
3. **Prepare Infrastructure**: Set up Key Vault and App Registration
4. **Test in Development**: Validate HSM signing with test certificates
5. **Update Build Agents**: Install required software and register navsip.dll
6. **Update Pipelines**: Migrate pipeline configurations
7. **Monitor and Validate**: Ensure successful signing and deployment

### Parallel Running
During migration, you can run both methods in parallel:

```yaml
- task: ALOpsAppSign@1
  displayName: 'Sign with PFX (Fallback)'
  condition: eq(variables['UseHSM'], 'false')
  inputs:
    signmethod: PFX
    # PFX configuration...

- task: ALOpsAppSign@1
  displayName: 'Sign with HSM'
  condition: eq(variables['UseHSM'], 'true')
  inputs:
    signmethod: HSM
    # HSM configuration...
```

## Related Resources

- [ALOpsAppSign@1 Task Reference](../ALOpsSteps/Buildstepsv1.md#alops-app-sign)
- [Azure Key Vault Documentation](https://docs.microsoft.com/en-us/azure/key-vault/)
- [Microsoft Trusted Signing](https://docs.microsoft.com/en-us/azure/trusted-signing/)
- [GlobalSign Azure Key Vault Setup](https://support.globalsign.com/code-signing/Code-Signing-certificate-setup-in-Azure-Key-vault)
- [GitHub Issue #717: HSM Feature Request](https://github.com/HodorNV/ALOps/issues/717)
- [GitHub Issue #856: HSM Configuration Question](https://github.com/HodorNV/ALOps/issues/856)
