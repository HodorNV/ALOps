```yaml
    - task: ALOpsAppLicenseCheck@1
      displayName: 'ALOps App License Check'
      inputs:
        usedocker: False                      # Run task in Docker container. $(usedocker)
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
        licensefile:                          # Set the BC License File. Path or Url. $(licensefile)
        artifact_path: $(System.ArtifactsDirectory)# Path for App Artifact. $(artifact_path)
        artifact_filter: *.app                # Filter used for locating App file relative to $(artifact_path). $(artifact_filter)
        artifact_include:                     # Include-Filter used for locating App file relative to $(artifact_path). $(artifact_include)
        artifact_exclude:                     # Exclude-Filter used for locating App file relative to $(artifact_path). $(artifact_exclude)
        exclude_ranges:                       # Exclude-Ranges from LicenseCheck (Buffer / Tempory tables). Format: 60000..60099,70000..70100 $(exclude_ranges)
```

