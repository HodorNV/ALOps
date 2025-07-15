```yaml
    - task: ALOpsAppSign@1
      displayName: 'ALOps App Sign'
      inputs:
        signmethod: PFX                       # Set Signmethod to use. PFX is legacy, HSM is the modern way $(signmethod)
        usedocker: False                      # Run task in Docker container. $(usedocker)
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
        batchsigncompiledapps: False          # Batch Sign Apps taged by ALOpsAppCompile task. $(batchsigncompiledapps)
        artifact_path:                        # Path for storing App Artifact. $(artifact_path)
        nav_artifact_app_filter: *.app        # Path of the App to Codesign. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(nav_artifact_app_filter)
        publish_artifact: True                # Publish generated App Artifact to DevOps. $(publish_artifact)
        timestamp_uri:                        # Uri of the timestamp service used during signing. $(timestamp_uri)
        pfx_path:                             # Path or Url of the PFX file. $(pfx_path)
        pfx_password:                         # Password for the PFX File. Recommended to use Azure-KeyVault secrets. $(pfx_password)
        hsmmethod: KEYVAULT                   # Set HSM Signmethod to use. $(hsmmethod)
        hsm_description:                      # Set the Description. $(hsm_description)
        hsm_description_url:                  # Set the Description Url. $(hsm_description_url)
        hsm_digestalgorithm: sha256           # Set the Digest Algorithm. $(hsm_digestalgorithm)
        hsm_signing_endpoint:                 # Set the Trusted Signing Endpoint. $(hsm_signing_endpoint)
        hsm_signing_account:                  # Set the Trusted Signing Account. $(hsm_signing_account)
        hsm_trusted_certificateprofile:       # Set the Trusted Certificate Profile. $(hsm_trusted_certificateprofile)
        hsm_keyvault_name:                    # Set the KeyVault Name. $(hsm_keyvault_name)
        hsm_keyvault_certificate_name:        # Set the KeyVault Certificate Name. $(hsm_keyvault_certificate_name)
        hsm_tenantid:                         # Set the Tenant ID. $(hsm_tenantid)
        hsm_clientid:                         # Set the Client ID. $(hsm_clientid)
        hsm_client_secret:                    # Set the Client Secret. $(hsm_client_secret)
```

