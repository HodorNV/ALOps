```yaml
    - task: ALOpsAppSignVerify@1
      displayName: 'ALOps App Sign Verify'
      inputs:
        usedocker: False                      # Run signature verification inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
        fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
        artifact_path:                        # Folder containing the .app files whose Authenticode signatures should be verified. Supports pipeline variables such as $(System.ArtifactsDirectory). $(artifact_path)
        nav_artifact_app_filter: *.app        # Glob filter applied inside artifact_path to select which .app files to verify, for example *.app. The task fails if any selected file has an invalid or missing signature. $(nav_artifact_app_filter)
```

