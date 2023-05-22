```yaml
    - task: ALOpsAppRuntimePackage@1
      displayName: 'ALOps App Runtime Package'
      inputs:
        usedocker: False                      # Run task in Docker container. $(usedocker)
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
        nav_serverinstance: BC140             # Specifies the name of a Business Central Server instance. $(nav_serverinstance)
        nav_tenant: default                   # Specifies the ID of a specific tenant that you want to act on, such as Tenant1. $(nav_tenant)
        targetproject: ./app.json             # Path of the project to export as RuntimePackage. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(targetproject)
        showmycode: False                     # Overwrites the ShowMyCode value in the manifest. $(showmycode)
        publish_artifact: True                # Publish generated Runtime-App Artifact to DevOps. $(publish_artifact)
```

