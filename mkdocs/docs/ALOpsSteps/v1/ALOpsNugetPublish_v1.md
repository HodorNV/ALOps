```yaml
    - task: ALOpsNugetPublish@1
      displayName: 'ALOps Nuget Publish'
      inputs:
        artifact_path: $(System.ArtifactsDirectory)# Folder containing the .app files to package and publish as NuGet packages. Supports pipeline variables such as $(System.ArtifactsDirectory). $(artifact_path)
        artifact_filter: *.app                # Glob filter applied inside artifact_path to select which .app files are published to NuGet, for example *.app. $(artifact_filter)
        nuget_source_uri:                     # URL of the NuGet source to publish packages to, for example https://pkgs.dev.azure.com/{org}/{project}/_packaging/{feed}/nuget/v3/index.json. $(nuget_source_uri)
        nuget_username:                       # Username for authenticating to the NuGet feed. Leave empty when using only an API key. $(nuget_username)
        nuget_password:                       # Password or personal access token for authenticating to the NuGet feed. Store this in a pipeline secret variable. $(nuget_password)
        nuget_source_apikey:                  # API key for pushing packages to the NuGet source. Store this in a pipeline secret variable. $(nuget_source_apikey)
        suffix:                               # Version suffix appended to the NuGet package version, for example -preview or -beta. Produces versions such as 1.2.3.4-preview. $(suffix)
        use_suffix_for_dependencies_same_publisher: False# When enabled, the version suffix is also applied to dependency references for packages from the same publisher. Use this for consistent pre-release versioning of multi-app solutions. $(use_suffix_for_dependencies_same_publisher)
        keep_app_filename: False              # When enabled, the original .app filename is preserved as the NuGet package file name instead of using the standard publisher_appname_version naming convention. $(keep_app_filename)
        pwsh: False                           # Run the task using PowerShell Core (pwsh) instead of Windows PowerShell. Required on Linux-hosted build agents. $(pwsh)
```

