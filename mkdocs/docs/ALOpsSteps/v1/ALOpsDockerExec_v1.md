```yaml
    - task: ALOpsDockerExec@1
      displayName: 'ALOps Docker Execute'
      inputs:
        fixed_tag:                            # Fixed name tag of the running Docker container in which to execute the script. The container must have been started by ALOps Docker Start before this task runs. $(fixed_tag)
        scriptsource: InLine                  # Specifies how the PowerShell script is supplied. Path loads the script from a file path on the agent. Workfolder loads it relative to the working folder copied into the container. Download fetches it from a URL. InLine lets you write the script directly in the task. $(scriptsource)
        script_location:                      # Path or URL of the PowerShell script to execute in the container. Applies when scriptsource is Path, Workfolder, or Download. $(script_location)
        inline_script: # Write your powershell commands here.
Write-Host "Hello World"
# PowerShell commands to execute directly inside the running Business Central Docker container. Only used when scriptsource is set to InLine. $(inline_script)
```

