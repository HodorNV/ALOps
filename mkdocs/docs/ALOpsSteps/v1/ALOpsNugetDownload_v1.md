```yaml
    - task: ALOpsNugetDownload@1
      displayName: 'ALOps Nuget Download'
      inputs:
        nuget_source_uri:                     # The NuGet source Url. $(nuget_source_uri)
        nuget_source_apikey:                  # APIKey for the NuGet Source. $(nuget_source_apikey)
        nuget_spec_file: nuget.json           # Nuget Spec File. $(nuget_spec_file)
        download_folder: $(System.ArtifactsDirectory)# Target download folder. $(download_folder)
        pwsh: False                           # Run task in Powershell Core. $(pwsh)
```

