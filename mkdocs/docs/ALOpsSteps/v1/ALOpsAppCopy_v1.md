```yaml
    - task: ALOpsAppCopy@1
      displayName: 'ALOps App Copy'
      inputs:
        nav_computername: localhost           # Hostname or IP address of the server running the Business Central service tier. Use localhost when the build agent runs on the same machine. $(nav_computername)
        nav_serverinstance_source: BC140      # Name of the Business Central Server instance to copy extensions from, for example BC140. Extensions published on this instance will be replicated to the target. $(nav_serverinstance_source)
        nav_serverinstance_target: BC140      # Name of the Business Central Server instance to copy extensions to, for example BC230. Extensions from the source instance will be published here. $(nav_serverinstance_target)
        nav_app_storage:                      # Temporary folder on disk used to stage .app files during the copy operation. Leave empty to use the default system temp folder. $(nav_app_storage)
```

