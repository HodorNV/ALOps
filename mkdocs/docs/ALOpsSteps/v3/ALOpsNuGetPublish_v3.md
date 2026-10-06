```yaml
    - task: ALOpsNuGetPublish@3
      displayName: 'ALOps NuGet Publish'
      inputs:
        altool_package_version: 18.0.33.65164-beta# Version of the microsoft.dynamics.businesscentral.development.tools NuGet package. Pin to a specific version for reproducible builds. $(altool_package_version) $(altool_package_version) $(altool_package_version)
        nuget_username:                       # Username for basic authentication against the NuGet source. Azure DevOps Artifacts feeds ignore NuGet API keys and require basic authentication: set any value (e.g. 'AzureDevOps') here and supply the pipeline's System.AccessToken or a PAT as NuGet Password. When empty but a password is given, 'AzureDevOps' is used. $(nuget_username) $(nuget_username) $(nuget_username)
        nuget_password:                       # Password or Personal Access Token (PAT) for basic authentication against the NuGet source. For Azure DevOps Artifacts use the pipeline's System.AccessToken (the build identity needs Contributor rights on the feed) or a PAT with Packaging (Read & write) scope. The value is written to an isolated, per-push NuGet.Config that is deleted after the push; the agent's user profile is never modified. $(nuget_password) $(nuget_password) $(nuget_password)
        nuget_source_apikey:                  # API key for feeds that authenticate pushes with X-NuGet-ApiKey (nuget.org, MyGet, BaGet, ...). Passed to dotnet nuget push --api-key. Azure DevOps Artifacts ignores API keys: supply NuGet Username / NuGet Password instead. Both may be set; the API key is then sent alongside basic authentication. $(nuget_source_apikey) $(nuget_source_apikey) $(nuget_source_apikey)
        nuget_source_uri:                     # NuGet feed URL to push packages to. $(nuget_source_uri) $(nuget_source_uri) $(nuget_source_uri)
        artifact_path:                        # Root folder to scan recursively for .app files. Leave empty to use the workspace directory. $(artifact_path) $(artifact_path) $(artifact_path)
        artifact_filter: *.app                # File filter pattern for selecting .app files to package and publish. $(artifact_filter) $(artifact_filter) $(artifact_filter)
        suffix:                               # Suffix to append to the NuGet package version (e.g. '-preview'). Leave empty for no suffix. $(suffix) $(suffix) $(suffix)
        use_suffix_for_dependencies_same_publisher: false# When enabled, applies the version suffix to dependency version ranges for dependencies from the same publisher. $(use_suffix_for_dependencies_same_publisher) $(use_suffix_for_dependencies_same_publisher) $(use_suffix_for_dependencies_same_publisher)
        keep_app_filename: false              # When enabled, uses the original .app filename as the .app entry inside the .nupkg instead of generating a standardized name. $(keep_app_filename) $(keep_app_filename) $(keep_app_filename)
```

