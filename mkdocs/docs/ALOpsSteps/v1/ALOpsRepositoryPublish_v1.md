    ```yaml
        - task: ALOpsRepositoryPublish@1
          displayName: 'ALOps Repository Publish Extension'
          inputs:
            usedocker: False                      # Run task in Docker container. $(usedocker)
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            alops_repository_endpoint: api.businesscentral.dynamics.com# Azure API Endpoint. $(alops_repository_endpoint)
            alops_repository_username:            # Username for ALOps API Endpoint. $(alops_repository_username)
            alops_repository_password:            # Password for ALOps API Endpoint. $(alops_repository_password)
            artifact_path:                        # Path for App Artifact. $(artifact_path)
            app_artifact_filter: *.app            # Path of the App to publish. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(app_artifact_filter)
            upload_c_applications: False          # Upload Applications from Applications folder. $(upload_c_applications)
    ```

