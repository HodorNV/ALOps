```yaml
    - task: ALOpsAppSign@3
      displayName: 'ALOps App Sign'
      inputs:
        signmethod: PFX                       # Signing method: PFX for file-based certificate signing, HSM for hardware security module signing (Azure Key Vault or Trusted Signing). $(signmethod) $(signmethod) $(signmethod)
        usedocker: false                      # Run signing inside a Docker container. The app and PFX are copied into the container, signed, and copied back. $(usedocker) $(usedocker) $(usedocker)
        fixed_tag:                            # Fixed container label. When set, uses this value to locate the Docker container instead of the build ID. $(fixed_tag) $(fixed_tag) $(fixed_tag)
        timestamp_uri:                        # Time-stamping authority URL. Defaults to http://timestamp.digicert.com if empty. $(timestamp_uri) $(timestamp_uri) $(timestamp_uri)
        hsmmethod: KEYVAULT                   # HSM signing method: KEYVAULT for Azure Key Vault, TRUSTED for Azure Trusted Signing. $(hsmmethod) $(hsmmethod) $(hsmmethod)
        hsm_description:                      # Description text embedded in the digital signature. $(hsm_description) $(hsm_description) $(hsm_description)
        hsm_description_url:                  # URL embedded in the digital signature description. $(hsm_description_url) $(hsm_description_url) $(hsm_description_url)
        hsm_digestalgorithm: sha256           # Hash algorithm for digest and timestamp. Default: sha256. $(hsm_digestalgorithm) $(hsm_digestalgorithm) $(hsm_digestalgorithm)
        batchsigncompiledapps: false          # Sign all apps from the ALOPS_COMPILE_ARTIFACT_ARRAY variable (set by ALOpsAppCompiler). $(batchsigncompiledapps) $(batchsigncompiledapps) $(batchsigncompiledapps)
        artifact_path:                        # Path to the folder containing .app files to sign. Leave empty to scan the workspace directory. $(artifact_path) $(artifact_path) $(artifact_path)
        nav_artifact_app_filter: *.app        # Glob filter for .app files to sign. $(nav_artifact_app_filter) $(nav_artifact_app_filter) $(nav_artifact_app_filter)
        publish_artifact: true                # Upload signed .app files as build artifacts. $(publish_artifact) $(publish_artifact) $(publish_artifact)
        pfx_path:                             # Path or URL to the PFX certificate file. If a URL is provided, the file is downloaded automatically. $(pfx_path) $(pfx_path) $(pfx_path)
        pfx_password:                         # Password for the PFX certificate. Store this in a pipeline secret variable. $(pfx_password) $(pfx_password) $(pfx_password)
        hsm_signing_endpoint:                 # Azure Trusted Signing endpoint URL. $(hsm_signing_endpoint) $(hsm_signing_endpoint) $(hsm_signing_endpoint)
        hsm_signing_account:                  # Azure Trusted Signing account name. $(hsm_signing_account) $(hsm_signing_account) $(hsm_signing_account)
        hsm_trusted_certificateprofile:       # Certificate profile name for Azure Trusted Signing. $(hsm_trusted_certificateprofile) $(hsm_trusted_certificateprofile) $(hsm_trusted_certificateprofile)
        hsm_keyvault_name:                    # Azure Key Vault name (just the name, not the full URL). $(hsm_keyvault_name) $(hsm_keyvault_name) $(hsm_keyvault_name)
        hsm_keyvault_certificate_name:        # Certificate name in the Azure Key Vault. $(hsm_keyvault_certificate_name) $(hsm_keyvault_certificate_name) $(hsm_keyvault_certificate_name)
        hsm_tenantid:                         # Azure AD tenant ID for service principal authentication. Leave empty for managed identity. $(hsm_tenantid) $(hsm_tenantid) $(hsm_tenantid)
        hsm_clientid:                         # Azure AD application (client) ID for service principal authentication. Leave empty for managed identity. $(hsm_clientid) $(hsm_clientid) $(hsm_clientid)
        hsm_client_secret:                    # Azure AD client secret for service principal authentication. Store this in a pipeline secret variable. $(hsm_client_secret) $(hsm_client_secret) $(hsm_client_secret)
```

