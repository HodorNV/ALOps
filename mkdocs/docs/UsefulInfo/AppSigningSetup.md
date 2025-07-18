# ALOps App Signing Setup

This guide explains how to configure the `ALOpsAppSign@1` task to digitally sign your Business Central extensions. ALOps supports both traditional PFX certificates and modern HSM (Hardware Security Module) signing.

## ALOpsAppSign@1 Overview

The ALOpsAppSign task signs .app files and supports two signing methods:

- **PFX Method** (`signmethod: PFX`) - Uses traditional certificate files (.pfx)
- **HSM Method** (`signmethod: HSM`) - Uses Azure KeyVault or Microsoft Trusted Signing

## Basic Configuration

### Core Parameters

Every ALOpsAppSign configuration needs these basic parameters:

```yaml
- task: ALOpsAppSign@1
  displayName: 'Sign Business Central Apps'
  inputs:
    signmethod: PFX                    # PFX or HSM
    nav_artifact_app_filter: '*.app'   # Files to sign (default: *.app)
    publish_artifact: true             # Publish signed artifacts (default: true)
    usedocker: false                   # Set to false for HSM signing
```

## PFX Certificate Signing

For traditional certificate signing using .pfx files:

```yaml
- task: ALOpsAppSign@1
  inputs:
    signmethod: PFX
    pfx_path: '$(pfx_path)'                    # Path or URL to .pfx file
    pfx_password: '$(pfx_password)'            # PFX password (use secret variable)
    timestamp_uri: 'http://timestamp.digicert.com'  # Optional timestamp server
```

### Required Variables for PFX

| Variable | Description | Secret |
|----------|-------------|--------|
| `pfx_path` | Path or URL to your .pfx certificate file | No |
| `pfx_password` | Password for the .pfx file | **Yes** |

## HSM Signing with Azure KeyVault

For enterprise-grade HSM signing using Azure KeyVault:

```yaml
- task: ALOpsAppSign@1
  inputs:
    signmethod: HSM
    hsmmethod: KEYVAULT
    usedocker: false                           # HSM requires direct agent access
    
    # Azure KeyVault Authentication
    hsm_tenantid: '$(hsm_tenantid)'
    hsm_clientid: '$(hsm_clientid)'
    hsm_client_secret: '$(hsm_client_secret)'
    hsm_keyvault_name: '$(hsm_keyvault_name)'
    hsm_keyvault_certificate_name: '$(hsm_keyvault_certificate_name)'
    
    # Optional signing settings
    hsm_digestalgorithm: 'sha256'
    timestamp_uri: 'http://rfc3161timestamp.globalsign.com/advanced'
    
    # Custom signature metadata (GitHub issue #856)
    hsm_description: 'My Company Business Central Extensions'
    hsm_description_url: 'https://www.mycompany.com'
```

### Required Variables for HSM KeyVault

| Variable | Description | Secret |
|----------|-------------|--------|
| `hsm_tenantid` | Azure AD Tenant ID | No |
| `hsm_clientid` | App Registration Client ID | No |
| `hsm_client_secret` | App Registration Client Secret | **Yes** |
| `hsm_keyvault_name` | Name of your Azure KeyVault | No |
| `hsm_keyvault_certificate_name` | Certificate name in KeyVault | No |

## HSM Signing with Microsoft Trusted Signing

For Microsoft's cloud-native signing service:

```yaml
- task: ALOpsAppSign@1
  inputs:
    signmethod: HSM
    hsmmethod: TRUSTED_SIGNING
    usedocker: false
    
    # Trusted Signing Configuration
    hsm_signing_endpoint: 'https://eus.codesigning.azure.net/'
    hsm_signing_account: '$(hsm_signing_account)'
    hsm_trusted_certificateprofile: '$(hsm_trusted_certificateprofile)'
    
    # Optional settings
    hsm_digestalgorithm: 'sha256'
    hsm_description: 'My Company Business Central Extensions'
    hsm_description_url: 'https://www.mycompany.com'
```

### Required Variables for Trusted Signing

| Variable | Description | Secret |
|----------|-------------|--------|
| `hsm_signing_account` | Trusted Signing account name | No |
| `hsm_trusted_certificateprofile` | Certificate profile name | No |

## Complete Parameter Reference

### Common Parameters (All Methods)

| Parameter | Default | Description |
|-----------|---------|-------------|
| `signmethod` | - | `PFX` or `HSM` (required) |
| `usedocker` | `false` | Set to `false` for HSM signing |
| `nav_artifact_app_filter` | `*.app` | File pattern to sign |
| `publish_artifact` | `true` | Publish signed artifacts |
| `batchsigncompiledapps` | `false` | Batch sign apps from ALOpsAppCompile |
| `artifact_path` | Auto-detected | Custom artifact path |
| `timestamp_uri` | - | Timestamp server URL |

### PFX-Specific Parameters

| Parameter | Required | Description |
|-----------|----------|-------------|
| `pfx_path` | Yes | Path or URL to .pfx file |
| `pfx_password` | Yes | Password for .pfx file |

### HSM-Specific Parameters

| Parameter | Required | Description |
|-----------|----------|-------------|
| `hsmmethod` | Yes | `KEYVAULT` or `TRUSTED_SIGNING` |
| `hsm_digestalgorithm` | No | Hash algorithm (default: `sha256`) |
| `hsm_description` | No | Custom signature description |
| `hsm_description_url` | No | Custom signature URL |

### HSM KeyVault Parameters

| Parameter | Required | Description |
|-----------|----------|-------------|
| `hsm_tenantid` | Yes | Azure AD Tenant ID |
| `hsm_clientid` | Yes | App Registration Client ID |
| `hsm_client_secret` | Yes | App Registration Client Secret |
| `hsm_keyvault_name` | Yes | KeyVault name |
| `hsm_keyvault_certificate_name` | Yes | Certificate name in KeyVault |

### HSM Trusted Signing Parameters

| Parameter | Required | Description |
|-----------|----------|-------------|
| `hsm_signing_endpoint` | Yes | Trusted Signing service endpoint |
| `hsm_signing_account` | Yes | Trusted Signing account name |
| `hsm_trusted_certificateprofile` | Yes | Certificate profile name |

## Understanding hsm_description Parameters (GitHub Issue #856)

**Question from GitHub issue #856**: "What should I specify in `hsm_description` and `hsm_description_url`?"

**Answer**: These are **your custom values** that you choose to describe your digital signature:

### hsm_description
- **Purpose**: Free text description that appears in the signature metadata
- **Examples**: 
  - `"Contoso Business Central Extensions"`
  - `"My Company ERP Apps"`
  - `"ACME Corp BC Solutions"`
- **Not found in Azure**: This is a value YOU define

### hsm_description_url  
- **Purpose**: URL that appears in the signature metadata
- **Examples**:
  - `"https://www.contoso.com"`
  - `"https://appsource.microsoft.com/your-app"`
  - `"https://www.mycompany.com/products"`
- **Not found in Azure**: This is a URL YOU choose

These parameters are **optional** and help identify your signatures. They are not Azure configuration values - they are custom metadata you define.

## Complete Pipeline Examples

### PFX Signing Example

```yaml
variables:
  - group: 'CodeSigning-PFX'  # Contains pfx_password

steps:
- checkout: self

- task: ALOpsAppCompiler@2
  displayName: 'Compile Extension'
  inputs:
    artifacttype: 'Sandbox'
    appversiontemplate: '1.0.*.0'

- task: ALOpsAppSign@1
  displayName: 'Sign with PFX'
  inputs:
    signmethod: PFX
    pfx_path: '$(Agent.TempDirectory)/certificate.pfx'
    pfx_password: '$(pfx_password)'
    timestamp_uri: 'http://timestamp.digicert.com'
```

### HSM KeyVault Signing Example

```yaml
variables:
  - group: 'CodeSigning-HSM'  # Contains HSM secrets

steps:
- checkout: self

- task: ALOpsAppCompiler@2
  displayName: 'Compile Extension'
  inputs:
    artifacttype: 'Sandbox'
    appversiontemplate: '1.0.*.0'

- task: ALOpsAppSign@1
  displayName: 'Sign with HSM KeyVault'
  inputs:
    signmethod: HSM
    hsmmethod: KEYVAULT
    usedocker: false
    
    # Authentication
    hsm_tenantid: '$(hsm_tenantid)'
    hsm_clientid: '$(hsm_clientid)'
    hsm_client_secret: '$(hsm_client_secret)'
    hsm_keyvault_name: '$(hsm_keyvault_name)'
    hsm_keyvault_certificate_name: '$(hsm_keyvault_certificate_name)'
    
    # Signing settings
    hsm_digestalgorithm: 'sha256'
    timestamp_uri: 'http://rfc3161timestamp.globalsign.com/advanced'
    
    # Your custom signature info
    hsm_description: 'Contoso Business Central Extensions'
    hsm_description_url: 'https://www.contoso.com'
```

### HSM Trusted Signing Example

```yaml
variables:
  - group: 'CodeSigning-TrustedSigning'

steps:
- checkout: self

- task: ALOpsAppCompiler@2
  displayName: 'Compile Extension'
  inputs:
    artifacttype: 'Sandbox'
    appversiontemplate: '1.0.*.0'

- task: ALOpsAppSign@1
  displayName: 'Sign with Trusted Signing'
  inputs:
    signmethod: HSM
    hsmmethod: TRUSTED_SIGNING
    usedocker: false
    
    # Trusted Signing configuration
    hsm_signing_endpoint: 'https://eus.codesigning.azure.net/'
    hsm_signing_account: '$(hsm_signing_account)'
    hsm_trusted_certificateprofile: '$(hsm_trusted_certificateprofile)'
    
    # Custom signature info
    hsm_description: 'Contoso Business Central Extensions'
    hsm_description_url: 'https://www.contoso.com'
```

## Best Practices

### Variable Management
- Use **Azure DevOps Variable Groups** to organize signing variables
- Mark all passwords and secrets as **secret variables**
- Use descriptive variable group names like `CodeSigning-PFX` or `CodeSigning-HSM`

### Signing Configuration
- Always use `usedocker: false` for HSM signing methods
- Include timestamp servers for better signature validation
- Use `sha256` digest algorithm for HSM signing
- Test signing in development pipelines before production

### Migration from PFX to HSM
- Keep PFX pipeline as backup during HSM testing
- Update variable groups with HSM parameters
- Change `signmethod` from `PFX` to `HSM`
- Verify signed apps work correctly before removing PFX configuration

## Recommended Timestamp Servers

| Provider | URL |
|----------|-----|
| DigiCert | `http://timestamp.digicert.com` |
| GlobalSign | `http://rfc3161timestamp.globalsign.com/advanced` |
| Sectigo | `http://timestamp.sectigo.com` |

## Related ALOps Documentation

- [ALOps Build Steps v1](../ALOpsSteps/Buildstepsv1.md) - Complete ALOpsAppSign task reference
- [Global Variables](Globals.md) - Environment variables for ALOps
- [ALOps Examples](https://github.com/HodorNV/ALOps/tree/master/Examples) - Example pipeline configurations
