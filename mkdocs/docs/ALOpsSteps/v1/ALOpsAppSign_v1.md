```yaml
    - task: ALOpsAppSign@1
      displayName: 'ALOps App Sign'
      inputs:
        signmethod: PFX                       # Code-signing method to use. PFX uses a local certificate file (legacy approach). HSM uses a hardware security module via Azure Key Vault or Azure Trusted Signing (recommended for production). $(signmethod)
        usedocker: False                      # Run code signing inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
        fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
        batchsigncompiledapps: False          # Sign all .app files tagged as compiled output by the ALOps App Compiler task in this pipeline run, instead of filtering by artifact_path and nav_artifact_app_filter. $(batchsigncompiledapps)
        artifact_path:                        # Folder containing the .app files to sign. Supports pipeline variables such as $(System.ArtifactsDirectory). $(artifact_path)
        nav_artifact_app_filter: *.app        # Glob filter applied inside artifact_path to select which .app files to sign, for example *.app. $(nav_artifact_app_filter)
        publish_artifact: True                # Upload the signed .app file as a build artifact in Azure DevOps, replacing the unsigned artifact from the compiler task. $(publish_artifact)
        timestamp_uri:                        # URL of the time-stamping authority (TSA) service to include a trusted timestamp in the signature, for example http://timestamp.digicert.com. $(timestamp_uri)
        pfx_path:                             # Path or URL of the PFX certificate file used for signing. Only used when signmethod is PFX. $(pfx_path)
        pfx_password:                         # Password for the PFX certificate file. Store this in a pipeline secret variable. Only used when signmethod is PFX. $(pfx_password)
        hsmmethod: KEYVAULT                   # HSM signing provider to use. KEYVAULT signs using a certificate stored in Azure Key Vault. TRUSTED uses the Azure Trusted Signing managed service. $(hsmmethod)
        hsm_description:                      # Description text embedded in the Authenticode signature, typically the app or company name. Used when signmethod is HSM. $(hsm_description)
        hsm_description_url:                  # URL embedded in the Authenticode signature pointing to the publisher or product information page. Used when signmethod is HSM. $(hsm_description_url)
        hsm_digestalgorithm: sha256           # Digest algorithm used to compute the file hash for signing. The default and recommended value is sha256. Used when signmethod is HSM. $(hsm_digestalgorithm)
        hsm_signing_endpoint:                 # Endpoint URL of the Azure Trusted Signing account, for example https://eus.codesigning.azure.net. Required when hsmmethod is TRUSTED. $(hsm_signing_endpoint)
        hsm_signing_account:                  # Name of the Azure Trusted Signing account. Required when hsmmethod is TRUSTED. $(hsm_signing_account)
        hsm_trusted_certificateprofile:       # Name of the certificate profile within the Azure Trusted Signing account to use for signing. Required when hsmmethod is TRUSTED. $(hsm_trusted_certificateprofile)
        hsm_keyvault_name:                    # Name of the Azure Key Vault containing the signing certificate. Required when hsmmethod is KEYVAULT. $(hsm_keyvault_name)
        hsm_keyvault_certificate_name:        # Name of the certificate stored in Azure Key Vault to use for signing. Required when hsmmethod is KEYVAULT. $(hsm_keyvault_certificate_name)
        hsm_tenantid:                         # Azure AD tenant ID that owns the Key Vault. Required when hsmmethod is KEYVAULT. $(hsm_tenantid)
        hsm_clientid:                         # Application (client) ID of the Azure AD service principal with access to the Key Vault. Required when hsmmethod is KEYVAULT. $(hsm_clientid)
        hsm_client_secret:                    # Client secret of the Azure AD service principal. Store this in a pipeline secret variable. Required when hsmmethod is KEYVAULT. $(hsm_client_secret)
```

