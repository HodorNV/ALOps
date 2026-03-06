```yaml
    - task: ALOpsLicenseImport@2
      displayName: 'ALOps License Import'
      inputs:
        usedocker: False                      # Run task in Docker container. $(usedocker) $(usedocker)
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag) $(fixed_tag)
        nav_serverinstance: BC140             # Business Central Server Instance Name. $(nav_serverinstance) $(nav_serverinstance)
        license_path:                         # Path of the FLF license to import. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory) or a downloadable Url. $(license_path) $(license_path)
        remove_license_file: True             # Remove license file after import. $(remove_license_file) $(remove_license_file)
        print_license_info: False             # Set if License is printed into the pipeline. $(print_license_info) $(print_license_info)
        license_scope: Default                # Set the scope for license upload. $(license_scope) $(license_scope)
```

