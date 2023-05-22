```yaml
    - task: ALOpsAppClean@1
      displayName: 'ALOps App Cleaner'
      inputs:
        usedocker: False                      # Run task in Docker container. $(usedocker)
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
        nav_computername: localhost           # Target Business Central Server running service tier. $(nav_computername)
        nav_serverinstance: BC140             # Business Central Server Instance Name. $(nav_serverinstance)
        sync_mode: Add                        # Mode for synchronizing Business Central extensions. $(sync_mode)
        includemicrosoftapps: False           # Include Microsoft Apps. $(includemicrosoftapps)
```

