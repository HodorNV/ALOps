```yaml
    - task: ALOpsBCReplay@1
      displayName: 'ALOps BC Replay'
      inputs:
        usedocker: False                      # Run task in Docker container. $(usedocker)
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
        pwsh: True                            # Run task in Powershell Core. $(pwsh)
```

