```yaml
    - task: ALOpsAppSignVerify@3
      displayName: 'ALOps App Sign Verify'
      inputs:
        usedocker: false                      # Run signature verification inside a Docker container. The app is copied into the container, verified, and the result is returned. $(usedocker) $(usedocker) $(usedocker)
        fixed_tag:                            # Fixed container label. When set, uses this value to locate the Docker container instead of the build ID. $(fixed_tag) $(fixed_tag) $(fixed_tag)
        artifact_path:                        # Path to the folder containing .app files to verify. Leave empty to scan the workspace directory. $(artifact_path) $(artifact_path) $(artifact_path)
        nav_artifact_app_filter: *.app        # Glob filter for .app files to verify. $(nav_artifact_app_filter) $(nav_artifact_app_filter) $(nav_artifact_app_filter)
        batchverifycompiledapps: false        # Verify all apps from the ALOPS_COMPILE_ARTIFACT_ARRAY variable (set by ALOpsAppCompiler). $(batchverifycompiledapps) $(batchverifycompiledapps) $(batchverifycompiledapps)
```

