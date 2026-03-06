```yaml
    - task: ALOpsNugetDownload@1
      displayName: 'ALOps Nuget Download'
      inputs:
        nuget_username:                       # Username for authenticating to the NuGet feed. Leave empty for public feeds or when using only an API key. $(nuget_username)
        nuget_password:                       # Password or personal access token for authenticating to the NuGet feed. Store this in a pipeline secret variable. $(nuget_password)
        nuget_source_apikey:                  # API key for authenticating to the NuGet source. Used instead of username and password for API key-authenticated feeds. $(nuget_source_apikey)
        nuget_spec_file: $(System.DefaultWorkingDirectory)\nuget.json# Path to the JSON specification file that lists the NuGet packages and versions to download. Defaults to nuget.json in the working directory. $(nuget_spec_file)
        nuget_select_type_filter:             # Filter applied to the NuGet package type when resolving packages. Leave empty to include all package types. $(nuget_select_type_filter)
        download_folder: $(System.ArtifactsDirectory)# Target folder where downloaded NuGet packages are extracted. Supports pipeline variables such as $(System.ArtifactsDirectory). $(download_folder)
        artifact_folder_name: Nuget           # Name of the Azure DevOps artifact folder where the resolved.json dependency manifest is uploaded after the download. $(artifact_folder_name)
        dependency_publisher_filter:          # Semicolon-separated list of app publisher names whose dependency packages should be resolved and downloaded. Set to NONE to skip all dependency resolution. $(dependency_publisher_filter)
        skip_microsoft_apps: True             # When enabled, NuGet packages published by Microsoft are excluded from the download. Useful when Microsoft apps are already available from a local symbol server. $(skip_microsoft_apps)
        pwsh: False                           # Run the task using PowerShell Core (pwsh) instead of Windows PowerShell. Required on Linux-hosted build agents. $(pwsh)
```

