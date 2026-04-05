```yaml
    - task: ALOpsDockerExec@3
      displayName: 'ALOps Docker Exec'
      inputs:
        fixed_tag:                            # Fixed container label. When set, the container is identified by this value instead of the build ID. $(fixed_tag) $(fixed_tag) $(fixed_tag)
        scriptsource: InLine                  # How to provide the script to execute. InLine: enter script text directly. Path: absolute or relative file path. Workfolder: search workspace recursively. Download: fetch from URL. $(scriptsource) $(scriptsource) $(scriptsource)
        script_location:                      # File path (for Path/Workfolder) or URL (for Download) of the script to execute. $(script_location) $(script_location) $(script_location)
        inline_script: Write-Host 'Hello World'# PowerShell script to execute inside the container. $(inline_script) $(inline_script) $(inline_script)
```

