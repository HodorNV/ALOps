```yaml
    - task: ALOpsAppRuntimePackage@1
      displayName: 'ALOps App Runtime Package'
      inputs:
        usedocker: False                      # Run this task inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
        fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
        nav_serverinstance: BC140             # Name of the Business Central Server instance that will generate the runtime package, for example BC140 or BC230. $(nav_serverinstance)
        nav_tenant: default                   # Tenant ID to act on when generating the runtime package. Use default for a single-tenant setup. $(nav_tenant)
        targetproject: ./app.json             # Path to the app.json of the AL project to export as a runtime package. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(targetproject)
        appfilenametemplate: %APP_PUBLISHER%_%APP_NAME%_%APP_VERSION%_runtime.app# Template for the output runtime package filename. Supported tokens: %APP_PUBLISHER%, %APP_NAME%, %APP_VERSION%. Example: %APP_PUBLISHER%_%APP_NAME%_%APP_VERSION%_runtime.app. $(appfilenametemplate)
        showmycode: False                     # When enabled, overwrites the ShowMyCode flag in the runtime package manifest to allow source-level debugging of the packaged app. $(showmycode)
        publish_artifact: True                # Upload the generated runtime .app file as a build artifact in Azure DevOps, making it available for download or use in downstream pipeline stages. $(publish_artifact)
        batchgeneratepackages: False          # Generate runtime packages for all apps in the solution in a single operation. The targetproject parameter is ignored when this is enabled. $(batchgeneratepackages)
```

