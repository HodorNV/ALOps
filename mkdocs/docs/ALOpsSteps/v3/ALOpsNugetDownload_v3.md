```yaml
    - task: ALOpsNugetDownload@3
      displayName: 'ALOps Nuget Download'
      inputs:
        nuget_username:                       # Username for the NuGet Source. For Azure DevOps feeds, use any value (e.g. 'az') combined with a PAT as password. $(nuget_username) $(nuget_username) $(nuget_username)
        nuget_password:                       # Password or Personal Access Token (PAT) for the NuGet Source. $(nuget_password) $(nuget_password) $(nuget_password)
        nuget_source_apikey:                  # API Key for the NuGet Source. When set, used as Bearer token and X-NuGet-ApiKey header. $(nuget_source_apikey) $(nuget_source_apikey) $(nuget_source_apikey)
        nuget_protocol_version: auto          # NuGet protocol version to use. 'auto' detects based on feed URL and service index. Set 'v2' or 'v3' to force a specific protocol. $(nuget_protocol_version) $(nuget_protocol_version) $(nuget_protocol_version)
        nuget_spec_file: $(System.DefaultWorkingDirectory)\nuget.json# Path to the nuget.json spec file that defines feeds and package dependencies. $(nuget_spec_file) $(nuget_spec_file) $(nuget_spec_file)
        nuget_select_type_filter:             # Wildcard filter for type names defined in the nuget.json spec file. Leave empty to process all types. $(nuget_select_type_filter) $(nuget_select_type_filter) $(nuget_select_type_filter)
        download_folder: $(System.ArtifactsDirectory)# Target folder where .app files will be downloaded. $(download_folder) $(download_folder) $(download_folder)
        artifact_folder_name: Nuget           # Artifact folder name used when uploading the resolved.json as a build artifact. $(artifact_folder_name) $(artifact_folder_name) $(artifact_folder_name)
        dependency_publisher_filter:          # Semicolon-separated list of publisher names to include when resolving dependencies. Leave empty to allow all publishers. Set to 'NONE' to skip dependency resolution entirely. $(dependency_publisher_filter) $(dependency_publisher_filter) $(dependency_publisher_filter)
        skip_microsoft_apps: True             # Skip packages whose ID starts with 'microsoft.' during dependency resolution. $(skip_microsoft_apps) $(skip_microsoft_apps) $(skip_microsoft_apps)
        pwsh: False                           # Run task in PowerShell Core. $(pwsh) $(pwsh) $(pwsh)
```

