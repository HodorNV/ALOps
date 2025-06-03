```yaml
    - task: ALOpsNugetDownload@1
      displayName: 'ALOps Nuget Download'
      inputs:
        nuget_source_uri:                     # The NuGet source Url. $(nuget_source_uri)
        nuget_source_apikey:                  # APIKey for the NuGet Source. $(nuget_source_apikey)
        pwsh: False                           # Run task in Powershell Core. $(pwsh)
```

