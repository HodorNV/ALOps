```yaml
    - task: ALOpsRepositoryPublish@1
      displayName: 'ALOps Repository Publish Extension'
      inputs:
        usedocker: False                      # Run the repository publish inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
        fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
        alops_repository_endpoint: api.businesscentral.dynamics.com# Hostname of the ALOps Repository API endpoint, for example api.businesscentral.dynamics.com. Used as the base address for all API calls. $(alops_repository_endpoint)
        alops_repository_username:            # Username for authenticating to the ALOps Repository API endpoint. $(alops_repository_username)
        alops_repository_password:            # Password for the ALOps Repository API endpoint user. Store this in a pipeline secret variable. $(alops_repository_password)
        artifact_path:                        # Folder containing the .app files to publish to the ALOps Repository. Supports pipeline variables such as $(System.ArtifactsDirectory). $(artifact_path)
        app_artifact_filter: *.app            # Glob filter applied inside artifact_path to select which .app files to publish, for example *.app. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(app_artifact_filter)
        upload_c_applications: False          # When enabled, upload the applications from the Business Central Applications folder inside the container to the repository. Only available when usedocker is enabled. $(upload_c_applications)
        pwsh: False                           # Run the task using PowerShell Core (pwsh) instead of Windows PowerShell. Required on Linux-hosted build agents. $(pwsh)
```

