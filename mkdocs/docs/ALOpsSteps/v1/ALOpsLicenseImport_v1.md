```yaml
    - task: ALOpsLicenseImport@1
      displayName: 'ALOps License Import'
      inputs:
        usedocker: False                      # Run the license import inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
        fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
        nav_serverinstance: BC140             # Name of the Business Central Server instance to import the license into, for example BC140 or BC230. $(nav_serverinstance)
        license_path:                         # Path or URL of the Business Central license file to import (.flf or .bclicense). Supports fully qualified paths, paths relative to $(System.DefaultWorkingDirectory), and HTTP/HTTPS URLs. $(license_path)
        remove_license_file: True             # Delete the license file from disk after it has been imported. Recommended to prevent the license file from remaining in the pipeline workspace. $(remove_license_file)
        print_license_info: False             # Print the license details (customer name, expiry date, licensed objects) to the pipeline log after import. $(print_license_info)
        license_scope: Default                # Scope at which the license is applied. Default applies the server default. Master imports as the master license. NavDatabase imports to the database level. Tenant applies the license to the current tenant only. $(license_scope)
```

