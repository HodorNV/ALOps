```yaml
    - task: ALOpsAppSignVerify@1
      displayName: 'ALOps App Sign Verify'
      inputs:
        usedocker: False                      # Run task in Docker container. $(usedocker)
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
        artifact_path:                        # Path for App Artifact. $(artifact_path)
        nav_artifact_app_filter: *.app        # Path of the App to verify. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(nav_artifact_app_filter)
```

