```yaml
    - task: ALOpsAppSymbol@3
      displayName: 'ALOps App Symbol'
      inputs:
        altool_package_version: 18.0.33.65164-beta# Version of the microsoft.dynamics.businesscentral.development.tools NuGet package. Pin to a specific version for reproducible builds. $(altool_package_version) $(altool_package_version) $(altool_package_version)
        app_source_path:                      # Root folder to scan recursively for .app files. Leave empty to use the workspace directory. $(app_source_path) $(app_source_path) $(app_source_path)
        app_file_filter: *.app                # File filter pattern for selecting .app files. $(app_file_filter) $(app_file_filter) $(app_file_filter)
        use_alops_compiler_apps: false        # When enabled, reads app paths from the ALOPS_COMPILE_ARTIFACT_ARRAY variable set by a preceding ALOpsAppCompiler task instead of scanning the file system. $(use_alops_compiler_apps) $(use_alops_compiler_apps) $(use_alops_compiler_apps)
        output_path:                          # Folder where symbol .app files will be written. Leave empty to use a 'symbol_output' subfolder in the workspace. $(output_path) $(output_path) $(output_path)
        verify_symbol: true                   # Run altool IsSymbolOnly verification on each generated symbol package. $(verify_symbol) $(verify_symbol) $(verify_symbol)
        publishartifact: true                 # Upload symbol .app files as build artifacts. $(publishartifact) $(publishartifact) $(publishartifact)
        artifact_name: ALOpsSymbolArtifact    # Name of the build artifact when publishing symbol packages. $(artifact_name) $(artifact_name) $(artifact_name)
```

