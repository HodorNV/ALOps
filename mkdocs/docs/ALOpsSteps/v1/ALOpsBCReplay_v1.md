```yaml
    - task: ALOpsBCReplay@1
      displayName: 'ALOps BC Replay'
      inputs:
        usedocker: False                      # Run BC Replay inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
        fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
        pwsh: True                            # Run the task using PowerShell Core (pwsh) instead of Windows PowerShell. Required on Linux-hosted build agents and enabled by default for this task. $(pwsh)
```

