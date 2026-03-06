```yaml
    - task: ALOpsAppClean@1
      displayName: 'ALOps App Cleaner'
      inputs:
        usedocker: False                      # Run this task inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
        fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
        nav_computername: localhost           # Hostname or IP address of the server running the Business Central service tier. Use localhost when the build agent runs on the same machine. $(nav_computername)
        nav_serverinstance: BC140             # Name of the Business Central Server instance from which all extensions will be removed, for example BC140 or BC230. $(nav_serverinstance)
        sync_mode: Add                        # Schema synchronization mode applied when removing extensions. Add preserves existing data. Clean removes extension tables and data. Development performs a lightweight sync for rapid iteration. forceSync pushes breaking schema changes, potentially deleting data. $(sync_mode)
        includemicrosoftapps: False           # When enabled, Microsoft-published system apps are also removed. Disable this to only remove custom and third-party extensions. $(includemicrosoftapps)
```

