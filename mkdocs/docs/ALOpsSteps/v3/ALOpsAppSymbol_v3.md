```yaml
    - task: ALOpsAppSymbol@3
      displayName: 'ALOps App Symbol'
      inputs:
        altool_package_version: 18.0.33.65164-beta# Version of the `microsoft.dynamics.businesscentral.development.tools` NuGet package to download from nuget.org. The package contains `altool.exe` which provides the `CreateSymbolPackage` command. Pre-release suffixes (e.g. `-beta`) are supported. $(altool_package_version) $(altool_package_version) $(altool_package_version)
        altool_cache_hours: 0                 # Number of hours the downloaded NuGet package is cached on the agent (under `$AGENT_TOOLSDIRECTORY`). Set to `0` to always download fresh. Non-numeric values silently default to `0`. $(altool_cache_hours) $(altool_cache_hours) $(altool_cache_hours)
        app_source_path: $(System.DefaultWorkingDirectory)# Root folder searched recursively for `.app` files to convert into symbol packages. All matching files (see `app_file_filter`) will be processed. $(app_source_path) $(app_source_path) $(app_source_path)
        app_file_filter: *.app                # File filter/glob pattern for selecting which `.app` files to process. Default is `*.app` which matches all app files in `app_source_path`. $(app_file_filter) $(app_file_filter) $(app_file_filter)
        use_alops_compiler_apps: false        # When enabled, `app_source_path` and `app_file_filter` are ignored. Instead, the task reads app paths from the `ALOPS_COMPILE_ARTIFACT_ARRAY` environment variable (comma-separated), which is populated by a preceding ALOpsAppCompiler task. $(use_alops_compiler_apps) $(use_alops_compiler_apps) $(use_alops_compiler_apps)
        output_path: $(Build.ArtifactStagingDirectory)# Folder where generated symbol `.app` files will be written. The folder is created if it does not exist. $(output_path) $(output_path) $(output_path)
        verify_symbol: true                   # When `true`, runs `altool IsSymbolOnly` on each generated symbol package to verify it is indeed a symbol-only package. If verification fails, the task fails with an error. $(verify_symbol) $(verify_symbol) $(verify_symbol)
        publishartifact: true                 # Upload the generated symbol `.app` file(s) as Azure DevOps build artifacts. The artifact name is controlled by the `artifact_name` parameter. $(publishartifact) $(publishartifact) $(publishartifact)
        artifact_name: ALOpsSymbolArtifact    # Name of the Azure DevOps build artifact for the symbol packages. Only used when `publishartifact` is `true`. $(artifact_name) $(artifact_name) $(artifact_name)
```

