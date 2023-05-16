    ```yaml
        - task: ALOpsDockerExec@1
          displayName: 'ALOps Docker Execute'
          inputs:
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            scriptsource: InLine                  # Set type for requiring the script. $(scriptsource)
            script_location:                      # Location of the script to fetch. $(script_location)
            inline_script: # Write your powershell commands here.
    Write-Host "Hello World"
    # Inline Powershell Script. $(inline_script)
    ```

