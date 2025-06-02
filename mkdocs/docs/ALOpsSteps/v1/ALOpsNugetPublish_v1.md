```yaml
    - task: ALOpsNugetPublish@1
      displayName: 'ALOps Nuget Publish'
      inputs:
        artifact_path: $(System.ArtifactsDirectory)# Path for App Artifact(s). $(artifact_path)
        artifact_filter: *.app                # Filter used for locating App file relative to $(artifact_path). $(artifact_filter)
        nuget_source_uri:                     # The NuGet source Url. $(nuget_source_uri)
        nuget_source_apikey:                  # APIKey for the NuGet Source. $(nuget_source_apikey)
        suffix:                               # Nuget Version Suffix. $(suffix)
        use_suffix_for_dependencies_same_publisher: False# Use Suffix for dependencies same Publisher. $(use_suffix_for_dependencies_same_publisher)
        pwsh: False                           # Run task in Powershell Core. $(pwsh)
```

