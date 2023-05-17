    ```yaml
        - task: ALOpsAppCopy@1
          displayName: 'ALOps App Copy'
          inputs:
            nav_computername: localhost           # Target Business Central Server running service tier. $(nav_computername)
            nav_serverinstance_source: BC140      # Source Business Central service tier to copy from. $(nav_serverinstance_source)
            nav_serverinstance_target: BC140      # Target Business Central service tier to copy to. $(nav_serverinstance_target)
            nav_app_storage:                      # Path used for temporary extension storage. $(nav_app_storage)
    ```

