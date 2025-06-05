```yaml
    - task: ALOpsNugetDownload@1
      displayName: 'ALOps Nuget Download'
      inputs:
        nuget_spec_file: $(System.DefaultWorkingDirectory)\nuget.json# Nuget Spec File. $(nuget_spec_file)
        nuget_select_type_filter:             # Nuget Select Type Filter. $(nuget_select_type_filter)
        download_folder: $(System.ArtifactsDirectory)# Target download folder. $(download_folder)
        artifact_folder_name: Nuget           # Artifact Folder name where resolved.json get uploaded. $(artifact_folder_name)
        dependency_publisher_filter:          # Dependency Publisher Filter. ';' as Seperator. 'NONE' skips all dependencies $(dependency_publisher_filter)
        skip_microsoft_apps: True             # Skip Microsoft Apps. $(skip_microsoft_apps)
        pwsh: False                           # Run task in Powershell Core. $(pwsh)
```

