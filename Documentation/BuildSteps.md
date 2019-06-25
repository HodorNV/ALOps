<<<<<<< HEAD
# Build Steps Overview
Let's describe all the Build Steps that we have at our disposal

## List and describe all build steps
Here is a list of all build steps you have at your disposal when you use ALOps

### ALOps Tasks
- ALOps App Sign
  * Codesign Business Central extension with .pfx.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppSign@1
          displayName: 'ALOps App Sign'
          inputs:
            usedocker: False                      # Run task in Docker container.
            fixed_tag:                            # Allows recycling of docker containers.
            nav_artifact_app_filter: *.app        # Path of the App to Codesign. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory).
            pfx_path:                             # Path or Url of the PFX file. (Required)
    ```
- ALOps App Sign Verify
  * Verify CodeSign of Business Central extension.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppSignVerify@1
          displayName: 'ALOps App Sign Verify'
          inputs:
            usedocker: False                      # Run task in Docker container.
            fixed_tag:                            # Allows recycling of docker containers.
            nav_artifact_app_filter: *.app        # Path of the App to verify. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory).
    ```
- ALOps App Test
  * Run Business Central Test-Suite and collect results.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppTest@1
          displayName: 'ALOps App Test'
          inputs:
            usedocker: False                      # Run task in Docker container.
            fixed_tag:                            # Allows recycling of docker containers.
            nav_serverinstance: BC140             # Business Central Server Instance Name. (Required)
            testfilter: <=130000|>160000          # Filter codeunits to include in Test-Suite.
            show_available_tests: True            # Show all available tests.
            import_testtoolkit: True              # Import TestToolKit FOB.
            import_action: Overwrite              # Import Action for importing Test-Suite FOB files.
    ```
- ALOps App Cleaner
  * Remove all extensions from Business Central service tier.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppClean@1
          displayName: 'ALOps App Cleaner'
          inputs:
            usedocker: False                      # Run task in Docker container.
            fixed_tag:                            # Allows recycling of docker containers.
            nav_computername: localhost           # Target Business Central Server running service tier. (Required)
            nav_serverinstance: BC140             # Business Central Server Instance Name. (Required)
            sync_mode: Add                        # Mode for synchronizing Business Central extensions.
    ```
- ALOps App Copy
  * Copy Business Central extensions from one service tier to another.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppCopy@1
          displayName: 'ALOps App Copy'
          inputs:
            nav_computername: localhost           # Target Business Central Server running service tier. (Required)
            nav_serverinstance_source: BC140      # Source Business Central service tier to copy from. (Required)
            nav_serverinstance_target: BC140      # Target Business Central service tier to copy to. (Required)
            nav_app_storage:                      # Path used for temporary extension storage.
    ```
- ALOps App Compiler
  * Compile a Business Central extension from AL code.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppCompiler@1
          displayName: 'ALOps App Compiler'
          inputs:
            usedocker: False                      # Run task in Docker container.
            fixed_tag:                            # Allows recycling of docker containers.
            targetproject: ./app.json             # Path of the project to compile. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory).
            nav_computername: localhost           # Target Business Central Server running service tier. (Required)
            nav_serverinstance: BC140             # Business Central Server Instance Name. (Required)
            nav_tenant: default                   # NAV Tenant used for symbols and compiling the app. (Required)
            nav_ports_dev: 7049                   # NAV Port used for DEV-Service. (Required)
            al_compiler_version: 0.12.15355       # AL Compiler version used for compiling. (Required)
            al_analyzer:                          # AL Analyzer(s) used for compiling. (Example: CodeCop,UICop)
            nav_app_version: 1.0.*.0              # Template for versioning NAV-Apps. '*' is replaced by the current Build Number. (Required)
            vsix_download_path:                   # Alternative VSIX download url.
            use_ssl: 0                            # Use SSL for Business Central connections.
            download_test_symbols: 0              # Download Test Symbols explicitly (without Test-Version reference in App.json).
            usecompression: True                  # Compress Source-Folder for transfer to docker container.
            failed_on_warnings: 0                 # Fail task when any warning occurs.
    ```
- ALOps Docker Remove
  * Remove Business Central docker container.
  * YAML Template: 
    ```yaml
        - task: ALOpsDockerRemove@1
          displayName: 'ALOps Docker Remove'
          inputs:
            usedocker: True                       # Run task in Docker container.
            fixed_tag:                            # Allows recycling of docker containers.
            print_logs: True                      # Print all container logs before remove.
    ```
- ALOps Docker Start
  * Start Business Central docker container.
  * YAML Template: 
    ```yaml
        - task: ALOpsDockerStart@1
          displayName: 'ALOps Docker Start'
          inputs:
            fixed_tag:                            # Allows recycling of docker containers.
            docker_image: microsoft/bcsandbox     # Business Central docker Image to Start. (Required)
            accept_image_eula: 1                  # Accept Eula of docker image.
            accept_image_outdated: 0              # Accept Outdated image.
            enable_symbol_loading: 0              # Enable Symbol Loading.
            enable_api_services: 0                # Enable API Services.
            docker_pull: 1                        # Force Pull docker image.
            docker_login:                         # Select the generic login to use for docker. If needed, click on 'manage', and add a new Service Endpoint of type 'Generic'
            memory_gb: -1                         # Set maximum memory for container in GB.
            container_restart: no                 # Set docker container restart preference.
            docker_parameters:                    # Specify additional docker parameters.
            sql_server:                           # External SQL Server.
            sql_server_instance:                  # External SQL Server Instance.
            sql_database:                         # External SQL Database.
            sql_database_user:                    # External SQL Database User.
            sql_database_user_password:           # External SQL Database Password.
            sql_backup_file:                      # Restore BAK file on startup.
            encryption_key:                       # Encryption key for Service Tier.
    ```
- ALOps Docker Wait
  * Wait until the Business Central container is started.
  * YAML Template: 
    ```yaml
        - task: ALOpsDockerWait@1
          displayName: 'ALOps Docker Wait'
          inputs:
            fixed_tag:                            # Allows recycling of docker containers.
            search_string: Ready for connections! # String to match in Docker Logs and return. (Required)
    ```
- ALOps Import FOB
  * Import objects from .FOB file.
  * YAML Template: 
    ```yaml
        - task: ALOpsFobImport@1
          displayName: 'ALOps Import FOB'
          inputs:
            usedocker: False                      # Run task in Docker container.
            fixed_tag:                            # Allows recycling of docker containers.
            nav_serverinstance: BC140             # Business Central Server Instance Name.
            filePath:                             # Path of the FOB to import. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). (Required)
            import_action: Default                # Import action for importing FOB files.
            synchronize_schema_changes: Yes       # Synchronize Schema Changes setting for importing FOB files.
            generate_symbol_reference: False      # Enable Generate Symbol References.
    ```
- ALOps Info
  * Print information about ALOps and executing host.
  * YAML Template: 
    ```yaml
        - task: ALOpsInfo@1
          displayName: 'ALOps Info'
    ```
- ALOps License Import
  * Import Business Central license (.flf).
  * YAML Template: 
    ```yaml
        - task: ALOpsLicenseImport@1
          displayName: 'ALOps License Import'
          inputs:
            usedocker: False                      # Run task in Docker container.
            fixed_tag:                            # Allows recycling of docker containers.
            nav_serverinstance: BC140             # Business Central Server Instance Name.
            license_path:                         # Path of the FLF license to import. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory) or a downloadable Url.
            remove_license_file: True             # Remove license file after import.
    ```
- ALOps Package Import
  * Import and Process RapidStart/Configuration Package
  * YAML Template: 
    ```yaml
        - task: ALOpsPackageImport@1
          displayName: 'ALOps Package Import'
          inputs:
            usedocker: True                       # Run task in Docker container.
    ```
- ALOps App Publish
  * Publish Business Central extension to service tier.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppPublish@1
          displayName: 'ALOps App Publish'
          inputs:
            usedocker: False                      # Run task in Docker container.
            fixed_tag:                            # Allows recycling of docker containers.
            nav_serverinstance: BC140             # Business Central Server Instance Name. (Required)
            nav_artifact_app_filter: *.app        # Path of the App to publish. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). (Required)
            skip_verification: True               # Skip CodeSign Verification of Business Central App.
    ```
- ALOps SaaS Get Extensions
  * Get extensions from Business Central Saas.
  * YAML Template: 
    ```yaml
        - task: ALOpsSaaSGetExtensions@1
          displayName: 'ALOps SaaS Get Extensions'
          inputs:
            azure_tenant_id:                      # Azure Tenant Id. (Required)
            azure_app_client_id:                  # Azure AD Application Client Id. (Required)
            azure_app_client_secret:              # Azure AD Application Client Secret. (Required)
            bc_impersonate_user:                  # Business Central User to impersonate. (Required)
            bc_impersonate_password:              # Business Central User Password to impersonate. (Required)
    ```

=======
# Build Steps Overview
Let's describe all the Build Steps that we have at our disposal

## List and describe all build steps
Here is a list of all build steps you have at your disposal when you use ALOps

### ALOps Tasks
- ALOps App Sign
  * Codesign Business Central extension with .pfx.
  * Example in yaml: 
    ```yaml
        - task: ALOpsAppSign@1
          displayName: 'ALOps App Sign'
          inputs:
            usedocker: False                      # Run task in Docker container.
            fixed_tag:                            # Allows recycling of docker containers.
            nav_artifact_app_filter: *.app        # Path of the App to Codesign. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory).
            pfx_path:                             # Path or Url of the PFX file. (Required)
    ```
- ALOps App Sign Verify
  * Verify CodeSign of Business Central extension.
  * Example in yaml: 
    ```yaml
        - task: ALOpsAppSignVerify@1
          displayName: 'ALOps App Sign Verify'
          inputs:
            usedocker: False                      # Run task in Docker container.
            fixed_tag:                            # Allows recycling of docker containers.
            nav_artifact_app_filter: *.app        # Path of the App to verify. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory).
    ```
- ALOps App Test
  * Run Business Central Test-Suite and collect results.
  * Example in yaml: 
    ```yaml
        - task: ALOpsAppTest@1
          displayName: 'ALOps App Test'
          inputs:
            usedocker: False                      # Run task in Docker container.
            fixed_tag:                            # Allows recycling of docker containers.
            nav_serverinstance: BC140             # Business Central Server Instance Name. (Required)
            testfilter: <=130000|>160000          # Filter codeunits to include in Test-Suite.
            show_available_tests: True            # Show all available tests.
            import_testtoolkit: True              # Import TestToolKit FOB.
            import_action: Overwrite              # Import Action for importing Test-Suite FOB files.
    ```
- ALOps App Cleaner
  * Remove all extensions from Business Central service tier.
  * Example in yaml: 
    ```yaml
        - task: ALOpsAppClean@1
          displayName: 'ALOps App Cleaner'
          inputs:
            nav_computername: localhost           # Target Business Central Server running service tier. (Required)
            nav_serverinstance: BC140             # Business Central Server Instance Name. (Required)
    ```
- ALOps App Copy
  * Copy Business Central extensions from one service tier to another.
  * Example in yaml: 
    ```yaml
        - task: ALOpsAppCopy@1
          displayName: 'ALOps App Copy'
          inputs:
            nav_computername: localhost           # Target Business Central Server running service tier. (Required)
            nav_serverinstance_source: BC140      # Source Business Central service tier to copy from. (Required)
            nav_serverinstance_target: BC140      # Target Business Central service tier to copy to. (Required)
            nav_app_storage:                      # Path used for temporary extension storage.
    ```
- ALOps App Compiler
  * Compile a Business Central extension from AL code.
  * Example in yaml: 
    ```yaml
        - task: ALOpsAppCompiler@1
          displayName: 'ALOps App Compiler'
          inputs:
            usedocker: False                      # Run task in Docker container.
            fixed_tag:                            # Allows recycling of docker containers.
            targetproject: ./app.json             # Path of the project to compile. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory).
            nav_computername: localhost           # Target Business Central Server running service tier. (Required)
            nav_serverinstance: BC140             # Business Central Server Instance Name. (Required)
            nav_tenant: default                   # NAV Tenant used for symbols and compiling the app. (Required)
            nav_ports_dev: 7049                   # NAV Port used for DEV-Service. (Required)
            al_compiler_version: 0.12.15355       # AL Compiler version used for compiling. (Required)
            al_analyzer:                          # AL Analyzer(s) used for compiling. (Example: CodeCop,UICop)
            nav_app_version: 1.0.*.0              # Template for versioning NAV-Apps. '*' is replaced by the current Build Number. (Required)
            vsix_download_path:                   # Alternative VSIX download url.
            use_ssl: 0                            # Use SSL for Business Central connections.
            download_test_symbols: 0              # Download Test Symbols explicitly (without Test-Version reference in App.json).
            usecompression: True                  # Compress Source-Folder for transfer to docker container.
            failed_on_warnings: 0                 # Fail task when any warning occurs.
    ```
- ALOps Docker Remove
  * Remove Business Central docker container.
  * Example in yaml: 
    ```yaml
        - task: ALOpsDockerRemove@1
          displayName: 'ALOps Docker Remove'
          inputs:
            usedocker: True                       # Run task in Docker container.
            fixed_tag:                            # Allows recycling of docker containers.
    ```
- ALOps Docker Start
  * Start Business Central docker container.
  * Example in yaml: 
    ```yaml
        - task: ALOpsDockerStart@1
          displayName: 'ALOps Docker Start'
          inputs:
            fixed_tag:                            # Allows recycling of docker containers.
            docker_image: microsoft/bcsandbox     # Business Central docker Image to Start. (Required)
            accept_image_eula: 1                  # Accept Eula of docker image.
            accept_image_outdated: 0              # Accept Outdated image.
            enable_symbol_loading: 0              # Enable Symbol Loading.
            enable_api_services: 0                # Enable API Services.
            docker_pull: 1                        # Force Pull docker image.
            docker_login:                         # Select the generic login to use for docker. If needed, click on 'manage', and add a new Service Endpoint of type 'Generic'
            memory_gb: 4                          # Set maximum memory for container in GB.
            container_restart: no                 # Set docker container restart preference.
            docker_parameters:                    # Specify additional docker parameters.
            sql_server:                           # External SQL Server.
            sql_server_instance:                  # External SQL Server Instance.
            sql_database:                         # External SQL Database.
            sql_database_user:                    # External SQL Database User.
    ```
- ALOps Docker Wait
  * Wait until the Business Central container is started.
  * Example in yaml: 
    ```yaml
        - task: ALOpsDockerWait@1
          displayName: 'ALOps Docker Wait'
          inputs:
            fixed_tag:                            # Allows recycling of docker containers.
            search_string: Ready for connections! # String to match in Docker Logs and return. (Required)
    ```
- ALOps Import FOB
  * Import objects from .FOB file.
  * Example in yaml: 
    ```yaml
        - task: ALOpsFobImport@1
          displayName: 'ALOps Import FOB'
          inputs:
            usedocker: False                      # Run task in Docker container.
            fixed_tag:                            # Allows recycling of docker containers.
            filePath:                             # Path of the FOB to import. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). (Required)
            import_action: Default                # Import action for importing FOB files.
            synchronize_schema_changes: Yes       # Synchronize Schema Changes setting for importing FOB files.
            generate_symbol_reference: False      # Enable Generate Symbol References.
    ```
- ALOps Info
  * Print information about ALOps and executing host.
  * Example in yaml: 
    ```yaml
        - task: ALOpsInfo@1
          displayName: 'ALOps Info'
    ```
- ALOps License Import
  * Import Business Central license (.flf).
  * Example in yaml: 
    ```yaml
        - task: ALOpsLicenseImport@1
          displayName: 'ALOps License Import'
          inputs:
            usedocker: False                      # Run task in Docker container.
            fixed_tag:                            # Allows recycling of docker containers.
            nav_serverinstance: BC140             # Business Central Server Instance Name.
            license_path:                         # Path of the FLF license to import. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory) or a downloadable Url.
            remove_license_file: True             # Remove license file after import.
    ```
- ALOps Package Import
  * Import and Process RapidStart/Configuration Package
  * Example in yaml: 
    ```yaml
        - task: ALOpsPackageImport@1
          displayName: 'ALOps Package Import'
          inputs:
            usedocker: True                       # Run task in Docker container.
    ```
- ALOps App Publish
  * Publish Business Central extension to service tier.
  * Example in yaml: 
    ```yaml
        - task: ALOpsAppPublish@1
          displayName: 'ALOps App Publish'
          inputs:
            usedocker: False                      # Run task in Docker container.
            fixed_tag:                            # Allows recycling of docker containers.
            nav_serverinstance: BC140             # Business Central Server Instance Name. (Required)
            nav_artifact_app_filter: *.app        # Path of the App to publish. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). (Required)
            skip_verification: True               # Skip CodeSign Verification of Business Central App.
    ```

>>>>>>> master
