```yaml
    - task: ALOpsBCReplay@2
      displayName: 'ALOps BC Replay'
      inputs:
        usedocker: False                      # Run task in Docker container. $(usedocker) $(usedocker)
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag) $(fixed_tag)
        pwsh: True                            # Run task in Powershell Core. $(pwsh) $(pwsh)
```

