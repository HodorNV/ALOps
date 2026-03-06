```yaml
    - task: ALOpsDockerExec@2
      displayName: 'ALOps Docker Execute'
      inputs:
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag) $(fixed_tag)
        scriptsource: InLine                  # Set type for requiring the script. $(scriptsource) $(scriptsource)
        script_location:                      # Location of the script to fetch. $(script_location) $(script_location)
        inline_script: # Write your powershell commands here.
Write-Host "Hello World"
# Inline Powershell Script. $(inline_script) $(inline_script)
```

