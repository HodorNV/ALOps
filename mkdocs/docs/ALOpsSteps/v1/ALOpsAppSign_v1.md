    ```yaml
        - task: ALOpsAppSign@1
          displayName: 'ALOps App Sign'
          inputs:
            usedocker: False                      # Run task in Docker container. $(usedocker)
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            batchsigncompiledapps: False          # Batch Sign Apps taged by ALOpsAppCompile task. $(batchsigncompiledapps)
            artifact_path:                        # Path for storing App Artifact. $(artifact_path)
            nav_artifact_app_filter: *.app        # Path of the App to Codesign. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(nav_artifact_app_filter)
            pfx_path:                             # Path or Url of the PFX file. $(pfx_path)
            timestamp_uri:                        # Uri of the timestamp service used during signing. $(timestamp_uri)
            publish_artifact: True                # Publish generated App Artifact to DevOps. $(publish_artifact)
            pfx_password:                         # Password for the PFX File. Recommended to use Azure-KeyVault secrets. $(pfx_password)
    ```

