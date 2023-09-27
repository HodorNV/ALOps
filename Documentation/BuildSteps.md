    # Build Steps Overview
    Let's describe all the Build Steps that we have at our disposal

    ## List and describe all build steps
    Here is a list of all build steps you have at your disposal when you use ALOps

        ### ALOps Tasks
    - ALOps AdminCenter API
  * Interact with BC SaaS AdminCenter API.
  * YAML Template: 
    ```yaml
        - task: ALOpsAdminCenterAPI@1
          displayName: 'ALOps AdminCenter API'
          inputs:
            azure_tenant_id:                      # Azure Tenant Id. Only required for BC SaaS $(azure_tenant_id)
            azure_app_client_id:                  # Azure AD Application Client Id. $(azure_app_client_id)
            azure_app_client_secret:              # Azure AD Application Client Secret. $(azure_app_client_secret)
            azure_app_client_certificate:         # Azure AD Application Client Certificate. $(azure_app_client_certificate)
            azure_app_client_certificate_password: # Azure AD Application Client Certificate Password. $(azure_app_client_certificate_password)
            username:                             # Business Central Username. Leave empty for Service-2-Service authentication. $(username)
            password:                             # Business Central User Password. Leave empty for Service-2-Service authentication. $(password)
            checksecondsdelay: 30                 # Seconds of delay betweel deployment status checks. $(checksecondsdelay)
            maxtries: 20                          # Max tries for status check. $(maxtries)
            interaction: environment_list         # Set Interaction to use. $(interaction)
            wait_for_operation: True              # Wait for operation. $(wait_for_operation)
            environment:                          # Source Environment. $(environment)
            target_environment:                   # Target Environment. $(target_environment)
            use_update_window: False              # Use update window. $(use_update_window)
            app_id:                               # App ID. $(app_id)
            accept_isv_eula: False                # Accept ISV Eula. $(accept_isv_eula)
            force_dependencies: False             # Force Dependencies. $(force_dependencies)
            confirm_delete_data: False            # Confirm Delete Data. $(confirm_delete_data)
    ```
- ALOps Agent Maintenance
  * Cleanup and maintain DevOps a Agent for Business Central.
  * YAML Template: 
    ```yaml
        - task: ALOpsAgentMaintenance@1
          displayName: 'ALOps Agent Maintenance'
          inputs:
            removeoldtasks: False                 # Remove old ALOps tasks. $(removeoldtasks)
            removeunusedcontainers: False         # Force docker container pruning. $(removeunusedcontainers)
            pruneimagesdayscreated: 0             # Force docker image pruning based on creation date (x days). $(pruneimagesdayscreated)
            pruneimagesosbased: False             # Prune images based on old OS. $(pruneimagesosbased)
            removebcartifacts: False              # Remove BC Artifacts. $(removebcartifacts)
            bcartifactscachefolder: C:\bcartifacts.cache# Set non-default BC Artifact Cache folder. $(bcartifactscachefolder)
            daysunused: 30                        # Define date-range for cleanup BC-Artifacts. $(daysunused)
    ```
- ALOps App License Check
  * Check App files agains a license.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppLicenseCheck@1
          displayName: 'ALOps App License Check'
          inputs:
            usedocker: False                      # Run task in Docker container. $(usedocker)
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            licensefile:                          # Set the BC License File. Path or Url. $(licensefile)
            artifact_path: $(System.ArtifactsDirectory)# Path for App Artifact. $(artifact_path)
            artifact_filter: *.app                # Filter used for locating App file relative to $(artifact_path). $(artifact_filter)
            artifact_include:                     # Include-Filter used for locating App file relative to $(artifact_path). $(artifact_include)
            artifact_exclude:                     # Exclude-Filter used for locating App file relative to $(artifact_path). $(artifact_exclude)
            exclude_ranges:                       # Exclude-Ranges from LicenseCheck (Buffer / Tempory tables). Format: 60000..60099,70000..70100 $(exclude_ranges)
    ```
- ALOps App Runtime Package
  * Get a NAV App runtime package for onprem deployment.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppRuntimePackage@1
          displayName: 'ALOps App Runtime Package'
          inputs:
            usedocker: False                      # Run task in Docker container. $(usedocker)
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            nav_serverinstance: BC140             # Specifies the name of a Business Central Server instance. $(nav_serverinstance)
            nav_tenant: default                   # Specifies the ID of a specific tenant that you want to act on, such as Tenant1. $(nav_tenant)
            targetproject: ./app.json             # Path of the project to export as RuntimePackage. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(targetproject)
            showmycode: False                     # Overwrites the ShowMyCode value in the manifest. $(showmycode)
            publish_artifact: True                # Publish generated Runtime-App Artifact to DevOps. $(publish_artifact)
    ```
- ALOps App Sign
  * Codesign Business Central extension with .pfx.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppSign@1
          displayName: 'ALOps App Sign'
          inputs:
            usedocker: False                      # Run task in Docker container. $(usedocker)
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            batchsigncompiledapps: False          # Batch Sign Apps taged by ALOpsAppCompile task. $(batchsigncompiledapps)
            artifact_path:                        # Path for storing App Artifact. $(artifact_path)
            nav_artifact_app_filter: *.app        # Path of the App to Codesign. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(nav_artifact_app_filter)
            pfx_path:                             # Path or Url of the PFX file. $(pfx_path)
            timestamp_uri:                        # Uri of the timestamp service used during signing. $(timestamp_uri)
            publish_artifact: True                # Publish generated App Artifact to DevOps. $(publish_artifact)
            pfx_password:                         # Password for the PFX File. Recommended to use Azure-KeyVault secrets. $(pfx_password)
    ```
- ALOps App Sign Verify
  * Verify CodeSign of Business Central extension.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppSignVerify@1
          displayName: 'ALOps App Sign Verify'
          inputs:
            usedocker: False                      # Run task in Docker container. $(usedocker)
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            artifact_path:                        # Path for App Artifact. $(artifact_path)
            nav_artifact_app_filter: *.app        # Path of the App to verify. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(nav_artifact_app_filter)
    ```
- ALOps AppSource
  * Compile a Business Central extension from AL code.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppSource@1
          displayName: 'ALOps AppSource'
          inputs:
            azure_tenant_id:                      # Azure Tenant Id. Only required for BC SaaS $(azure_tenant_id)
            azure_app_client_id:                  # Azure AD Application Client Id. $(azure_app_client_id)
            azure_app_client_secret:              # Azure AD Application Client Secret. $(azure_app_client_secret)
    ```
- ALOps App Test
  * Run Business Central Test-Suite and collect results.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppTest@1
          displayName: 'ALOps App Test'
          inputs:
            usedocker: False                      # Run task in Docker container. $(usedocker)
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            nav_serverinstance:                   # Business Central Server Instance Name. $(nav_serverinstance)
            tenant: default                       # Business Central Tenant. $(tenant)
            companyname:                          # Business Central Company. $(companyname)
            profile:                              # Business Central Profile. $(profile)
            bc_username:                          # BC Username for ServiceTier connection. $(bc_username)
            bc_password:                          # BC User Password for ServiceTier connection. $(bc_password)
            bc_authentication: NavUserPassword    # BC Authentication type of the ServiceTier. $(bc_authentication)
            bc_webclient_url:                     # BC WebClient Endpoint. $(bc_webclient_url)
            testfilter:                           # Filter codeunits to include in Test-Suite. $(testfilter)
            disabledtests:                        # Disabled Tests File. $(disabledtests)
            show_available_tests: True            # Show all available tests. $(show_available_tests)
            import_testtoolkit: True              # Import TestToolKit FOB. $(import_testtoolkit)
            import_action: Overwrite              # Import Action for importing Test-Suite FOB files. $(import_action)
            testpage: 130409                      # Set the PageId used for testing. $(testpage)
            testsuite: DEFAULT                    # Set target Test Suite to activate. $(testsuite)
            extensionid:                          # Set Extension ID. $(extensionid)
            installaltesttool: False              # Install the AL TestTool for v15. $(installaltesttool)
            failed_test_action: Warning           # Action to take when a Test failed. $(failed_test_action)
            override_finsql_path:                 # Overrule automatic detection of FinSql with fixed value. $(override_finsql_path)
            resultfilename: TestResults.xml       # Set filename for the Result XML. $(resultfilename)
            testrunnercodeunitid:                 # Set the Codeunit Id for the test-runner to use. $(testrunnercodeunitid)
    ```
- ALOps App Validation
  * Validate App from Business Central AppSource.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppValidation@1
          displayName: 'ALOps App Validation'
          inputs:
            license_path:                         # Path of the FLF license to import. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory) or a downloadable Url. $(license_path)
            countries:                            # Comma seperated array of countries to validate. When blank SupportedCountries value from AppSourceCop.json is used. $(countries)
            affixes:                              # Comma seperated array of affixes. $(affixes)
            artifact_path: $(System.ArtifactsDirectory)# Path for App Artifact(s). $(artifact_path)
            artifact_filter: *.app                # Filter used for locating App file relative to $(artifact_path). $(artifact_filter)
            installapps_path: $(System.ArtifactsDirectory)# Path for InstallApps Artifact(s). $(installapps_path)
            installapps_filter: *.app             # Filter used for locating App file relative to $(installapps_path). $(installapps_filter)
            previousapps_path: $(System.ArtifactsDirectory)# Path for PreviousApps Artifact(s). $(previousapps_path)
            previousapps_filter: *.app            # Filter used for locating App file relative to $(previousapps_path). $(previousapps_filter)
            memory: 8G                            # Set maximum memory for Container. $(memory)
            validateversion:                      # Full or partial version number. If specified, apps will also be validated against this version. $(validateversion)
            validatecurrent: False                # Validate against current version of Business Central. $(validatecurrent)
            validatenextminor: False              # Validate against Next Minor version of Business Central. $(validatenextminor)
            validatenextmajor: False              # Validate against Next Major version of Business Central. $(validatenextmajor)
            sastoken:                             # SAS Token used to access Storage Account. $(sastoken)
            skipverification: False               #  $(skipverification)
            skipappsourcecop: False               #  $(skipappsourcecop)
            includewarnings: False                # Include this switch if you want to include Warnings. $(includewarnings)
            failonerror: True                     # Include this switch if you want to fail on the first error instead of returning all errors to the caller. $(failonerror)
            containername: bcserver               # Only required when running multiple DevOps Agents on the same server. (Not recommended) $(containername)
    ```
- ALOps App Cleaner
  * Remove all extensions from Business Central service tier.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppClean@1
          displayName: 'ALOps App Cleaner'
          inputs:
            usedocker: False                      # Run task in Docker container. $(usedocker)
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            nav_computername: localhost           # Target Business Central Server running service tier. $(nav_computername)
            nav_serverinstance: BC140             # Business Central Server Instance Name. $(nav_serverinstance)
            sync_mode: Add                        # Mode for synchronizing Business Central extensions. $(sync_mode)
            includemicrosoftapps: False           # Include Microsoft Apps. $(includemicrosoftapps)
    ```
- ALOps App Copy
  * Copy Business Central extensions from one service tier to another.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppCopy@1
          displayName: 'ALOps App Copy'
          inputs:
            nav_computername: localhost           # Target Business Central Server running service tier. $(nav_computername)
            nav_serverinstance_source: BC140      # Source Business Central service tier to copy from. $(nav_serverinstance_source)
            nav_serverinstance_target: BC140      # Target Business Central service tier to copy to. $(nav_serverinstance_target)
            nav_app_storage:                      # Path used for temporary extension storage. $(nav_app_storage)
    ```
- ALOps App Compiler
  * Compile a Business Central extension from AL code.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppCompiler@1
          displayName: 'ALOps App Compiler'
          inputs:
            usedocker: False                      # Run task in Docker container. $(usedocker)
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            targetproject: ./app.json             # Path of the project to compile. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(targetproject)
            nav_computername:                     # Target Business Central Server running service tier. $(nav_computername)
            nav_serverinstance: BC140             # Business Central Server Instance Name. $(nav_serverinstance)
            nav_tenant: default                   # NAV Tenant used for symbols and compiling the app. $(nav_tenant)
            nav_ports_dev: 7049                   # NAV Port used for DEV-Service. $(nav_ports_dev)
            bc_username:                          # BC Username for ServiceTier connection. $(bc_username)
            bc_password:                          # BC User Password for ServiceTier connection. $(bc_password)
            al_compiler_version: 0.12.15355       # AL Compiler version used for compiling. $(al_compiler_version)
            ruleset:                              # Overrule the Ruleset from VSCode settings. Path relative to [alsourcepath] $(ruleset)
            suppresswarnings: KEEP                # Overrule the 'suppresswarnings' setting. $(suppresswarnings)
            al_analyzer:                          # AL Analyzer(s) used for compiling. (Example: CodeCop,UICop) $(al_analyzer)
            ignorepragmas:                        # Report Suppressed Diagnostics: diagnostics suppressed in source code should be emitted. $(ignorepragmas)
            nav_app_version: 1.0.*.0              # Template for versioning NAV-Apps. '*' is replaced by the current Build Number. $(nav_app_version)
            vsix_download_path:                   # Alternative VSIX download url. 'Latest' can be specified. $(vsix_download_path)
            use_ssl: False                        # Use SSL for Business Central connections. $(use_ssl)
            download_test_symbols: False          # Download Test Symbols explicitly (without Test-Version reference in App.json). $(download_test_symbols)
            usecompression: True                  # Compress Source-Folder for transfer to docker container. $(usecompression)
            publish_artifact: True                # Publish generated App Artifact to DevOps. $(publish_artifact)
            publishxlif: False                    # Publish generated XLIF to DevOps. $(publishxlif)
            failed_on_warnings: False             # Fail task when any warning occurs. $(failed_on_warnings)
            app_file_suffix:                      # Set a suffix tag on the compiled App filename. $(app_file_suffix)
            updatebuildnumber: True               # Update the Build number with the current version. $(updatebuildnumber)
            setup_working_folder: False           # Copy working folder to Docker container. $(setup_working_folder)
            showmycode: Keep                      # Overrule ShowMyCode by setting other option than 'Keep'. $(showmycode)
            resourceexposurepolicy_allowdebugging: Keep# Overrule allowDebugging by setting other option than 'Keep'. $(resourceexposurepolicy_allowdebugging)
            resourceexposurepolicy_allowdownloadingsource: Keep# Overrule allowDownloadingSource by setting other option than 'Keep'. $(resourceexposurepolicy_allowdownloadingsource)
            resourceexposurepolicy_includesourceinsymbolfile: Keep# Overrule includeSourceInSymbolFile by setting other option than 'Keep'. $(resourceexposurepolicy_includesourceinsymbolfile)
            internalsvisibleto: Keep              # Remove internalsVisibleTo by setting other option than 'Keep'. $(internalsvisibleto)
            preprocessorsymbols:                  # Overwrite the preprocessorSymbols in app.json, comma seperated string. Set to 'NONE' to remove. $(preprocessorsymbols)
            applicationinsightskey:               # Overwrite the ApplicationInsightsKey in app.json. Set to 'NONE' to remove InsightsKey. $(applicationinsightskey)
            printappmanifest: True                # Print the final app.json before compile. $(printappmanifest)
            output_alc_logs: True                 # Output ALC logs. $(output_alc_logs)
            additionalprobingpaths:               # Add additional Assembly probing Paths. $(additionalprobingpaths)
            enable_external_rulesets: False       # Enable External Rulesets. $(enable_external_rulesets)
            allowed_publisher_names:              # Allowed Publisher names. $(allowed_publisher_names)
    ```
- ALOps Docker Create
  * Create Docker image based on NAV/BC Artifacts.
  * YAML Template: 
    ```yaml
        - task: ALOpsDockerCreate@1
          displayName: 'ALOps Docker Create'
          inputs:
            artifactspecification: Specific       # Set Artifact resolve method. $(artifactspecification)
            artifactversion:                      # BC/NAV Version, eg: 9, 10.4, NAV2016, 16.4.24524. $(artifactversion)
            artifacttype: OnPrem                  # Set Artifact Type. $(artifacttype)
            artifactcountry:                      # The Country for the Artifact. $(artifactcountry)
            versionselect: Latest                 # The version to be selected from the Artifacts. $(versionselect)
            artifacthint:                         # . $(artifacthint)
            multitenant: False                    # Create a Multi-Tenant image. $(multitenant)
            memory: 8G                            # Set maximum memory for Container. $(memory)
            imageprefix: myImage                  # New image name, tag defined by $(imagenametemplate). $(imageprefix)
            dockerregistry:                       # Docker registry Pull/Push, example: 'bcinsider.azurecr.io', or 'repo.mydomain.com' $(dockerregistry)
            dockerusername:                       # Docker login username. $(dockerusername)
            dockerpassword:                       # Docker login password. $(dockerpassword)
            storageaccount:                       # Non Default Storage Account. $(storageaccount)
            sastoken:                             # SAS Token used to access Storage Account. $(sastoken)
            forcecreateimage: False               # Forces image creation, skipping Pull image. $(forcecreateimage)
            myscripts:                            # Specify myScripts to be added to the image. $(myscripts)
            imagenametemplate: %IMAGE_PREFIX%:%ARTIFACT_TYPE%-%ARTIFACT_VERSION%-%ARTIFACT_COUNTRY%-%OS_VERSION%-%OS_LTSC%# Template for defining Image names or using a fixed name $(imagenametemplate)
            licensefile:                          # BC License File to be included in the Image $(licensefile)
            includetesttoolkit: False             # Included the TestToolkit in created image. $(includetesttoolkit)
            includetestlibrariesonly: False       # Included only the Test-Libraries in created image. $(includetestlibrariesonly)
            includetestframeworkonly: False       # Included only the Test-Framework in created image. $(includetestframeworkonly)
            includeperformancetoolkit: False      # Include Performance-Toolkit in created image. $(includeperformancetoolkit)
    ```
- ALOps Docker Execute
  * Execute powershell script in container.
  * YAML Template: 
    ```yaml
        - task: ALOpsDockerExec@1
          displayName: 'ALOps Docker Execute'
          inputs:
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            scriptsource: InLine                  # Set type for requiring the script. $(scriptsource)
            script_location:                      # Location of the script to fetch. $(script_location)
            inline_script: # Write your powershell commands here.
    Write-Host "Hello World"
    # Inline Powershell Script. $(inline_script)
    ```
- ALOps Docker Remove
  * Remove Business Central docker container.
  * YAML Template: 
    ```yaml
        - task: ALOpsDockerRemove@1
          displayName: 'ALOps Docker Remove'
          inputs:
            usedocker: True                       # Run task in Docker container. $(usedocker)
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            print_logs: True                      # Print all container logs before remove. $(print_logs)
            createeventlogbackup: disabled        # Create EventLog Backup from Container. $(createeventlogbackup)
            createsqlbackup: disabled             # Create SQL Backup from Container Database. $(createsqlbackup)
            publishsqlbackup: True                # Published the SQL Backup as Build-Artifact. $(publishsqlbackup)
            sqlcompression: False                 # Create Compressed SQL Backup (does not work on SQL-Express). $(sqlcompression)
            zipsqlbackup: True                    # ZIP the SQL Backup. $(zipsqlbackup)
    ```
- ALOps Docker Start
  * Start Business Central docker container.
  * YAML Template: 
    ```yaml
        - task: ALOpsDockerStart@1
          displayName: 'ALOps Docker Start'
          inputs:
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            ignore_no_container_warning: False    # Do not trigger warning when container with [fixed_tag] is not found. $(ignore_no_container_warning)
            docker_image: $(ALOPS_BC_IMAGE)       # Business Central docker Image to Start. $(docker_image)
            accept_image_eula: True               # Accept Eula of docker image. $(accept_image_eula)
            accept_image_outdated: True           # Accept Outdated image. $(accept_image_outdated)
            enable_symbol_loading: False          # Enable Symbol Loading. $(enable_symbol_loading)
            enable_api_services: False            # Enable API Services. $(enable_api_services)
            multitenant: False                    # Create a Multi-Tenant container. $(multitenant)
            docker_pull: True                     # Force Pull docker image. $(docker_pull)
            dockerauthentication: None            # Set authentication Method to use. $(dockerauthentication)
            docker_login:                         # Select the generic login to use for docker. If needed, click on 'manage', and add a new Service Endpoint of type 'Generic' $(docker_login)
            docker_username:                      # Docker login username. $(docker_username)
            docker_password:                      # Docker login password. $(docker_password)
            docker_registry:                      # Docker registry for login, example: 'bcinsider.azurecr.io' $(docker_registry)
            memory_gb: -1                         # Set maximum memory for container in GB. $(memory_gb)
            container_restart: no                 # Set docker container restart preference. $(container_restart)
            licensefile:                          # Set the BC License File. Path or Url. $(licensefile)
            docker_parameters:                    # Specify additional docker parameters. $(docker_parameters)
            sql_server:                           # External SQL Server. $(sql_server)
            sql_server_instance:                  # External SQL Server Instance. $(sql_server_instance)
            sql_database:                         # External SQL Database. $(sql_database)
            sql_database_user:                    # External SQL Database User. $(sql_database_user)
            sql_database_user_password:           # External SQL Database Password. $(sql_database_user_password)
            sql_backup_file:                      # Restore BAK file on startup. $(sql_backup_file)
            encryption_key:                       # Encryption key for Service Tier. $(encryption_key)
            taskscheduler: Keep                   # Overrule EnableTaskScheduler by setting other option than 'Keep'. $(taskscheduler)
    ```
- ALOps Docker Wait
  * Wait until the Business Central container is started.
  * YAML Template: 
    ```yaml
        - task: ALOpsDockerWait@1
          displayName: 'ALOps Docker Wait'
          inputs:
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            search_string: Ready for connections! # String to match in Docker Logs and return. $(search_string)
            warning_string:                       # Show as Warning when the container logs contain the warning string. $(warning_string)
            error_string:                         # Throw error when the container logs contain the error string. $(error_string)
            setup_working_folder: True            # Copy working folder to Docker container. $(setup_working_folder)
            usecompression: True                  # Compress Source-Folder for transfer to docker container. $(usecompression)
            printlogs: True                       # Print all container logs. $(printlogs)
    ```
- ALOps Extension API
  * Get/Publish extensions with the Business Central API.
  * YAML Template: 
    ```yaml
        - task: ALOpsExtensionAPI@1
          displayName: 'ALOps Extension API'
          inputs:
            usedocker: False                      # Run task in Docker container. $(usedocker)
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            interaction: get                      # Set Interaction Method to use. (Get/Publish/Batch Publish). $(interaction)
            api_endpoint: https://api.businesscentral.dynamics.com/v2.0/$(azure_tenant_id)/Sandbox/api# Set API Endpoint. (protocol://host:port/serverinstance/api) $(api_endpoint)
            dev_endpoint:                         # Set DEV Endpoint. (protocol://host:port/serverinstance/dev) $(dev_endpoint)
            dev_schemeupdatemode: synchronize     # Set Schema Update Mode to use with DEVPort deploy. (synchronize/recreate/forcesync) $(dev_schemeupdatemode)
            apiversion: v1.0                      # Version of the API to use (beta / v1.0 / v2.0) $(apiversion)
            authentication: oauth                 # Set authentication Method to use. Default [Windows]. $(authentication)
            azure_tenant_id:                      # Azure Tenant Id. Only required for BC SaaS $(azure_tenant_id)
            azure_app_client_id:                  # Azure AD Application Client Id. $(azure_app_client_id)
            azure_app_client_secret:              # Azure AD Application Client Secret. $(azure_app_client_secret)
            azure_app_client_certificate:         # Azure AD Application Client Certificate. $(azure_app_client_certificate)
            azure_app_client_certificate_password: # Azure AD Application Client Certificate Password. $(azure_app_client_certificate_password)
            username:                             # Business Central Username. Leave empty for Service-2-Service authentication. $(username)
            password:                             # Business Central User Password. Leave empty for Service-2-Service authentication. $(password)
            bccompany:                            # Business Central Company (Id or Name). $(bccompany)
            artifact_path: $(System.ArtifactsDirectory)# Path for App Artifact. $(artifact_path)
            artifact_filter: *.app                # Filter used for locating App file relative to $(path_to_publish). $(artifact_filter)
            showdeploymentstatus: True            # Show Extension Deployment Status. $(showdeploymentstatus)
            checksecondsdelay: 30                 # Seconds of delay betweel deployment status checks. $(checksecondsdelay)
            maxtries: 20                          # Max tries for status check. $(maxtries)
            replacepackageid: False               # Force a new PackageID for each deployment. $(replacepackageid)
            blocksymbolsonly: False               # Check App, block if SymbolsOnly App. $(blocksymbolsonly)
    ```
- ALOps Import FOB
  * Import objects from .FOB file.
  * YAML Template: 
    ```yaml
        - task: ALOpsFobImport@1
          displayName: 'ALOps Import FOB'
          inputs:
            usedocker: False                      # Run task in Docker container. $(usedocker)
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            nav_serverinstance: BC140             # Business Central Server Instance Name. $(nav_serverinstance)
            filePath:                             # Path of the FOB to import. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(filePath)
            import_action: Default                # Import action for importing FOB files. $(import_action)
            synchronize_schema_changes: Yes       # Synchronize Schema Changes setting for importing FOB files. $(synchronize_schema_changes)
            generate_symbol_reference: False      # Enable Generate Symbol References. $(generate_symbol_reference)
            force_full_generate_symbol_reference: False# Generate Symbol Reference for All Objects. $(force_full_generate_symbol_reference)
            override_finsql_path:                 # Overrule automatic detection of FinSql with fixed value. $(override_finsql_path)
    ```
- ALOps Info
  * Print information about ALOps and executing host.
  * YAML Template: 
    ```yaml
        - task: ALOpsInfo@1
          displayName: 'ALOps Info'
          inputs:
            scanforsymbolonlyapps: Disabled       # Scan for SymbolOnly Apps. $(scanforsymbolonlyapps)
    ```
- ALOps License Import
  * Import Business Central license (.flf).
  * YAML Template: 
    ```yaml
        - task: ALOpsLicenseImport@1
          displayName: 'ALOps License Import'
          inputs:
            usedocker: False                      # Run task in Docker container. $(usedocker)
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            nav_serverinstance: BC140             # Business Central Server Instance Name. $(nav_serverinstance)
            license_path:                         # Path of the FLF license to import. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory) or a downloadable Url. $(license_path)
            remove_license_file: True             # Remove license file after import. $(remove_license_file)
            print_license_info: False             # Set if License is printed into the pipeline. $(print_license_info)
            license_scope: Default                # Set the scope for license upload. $(license_scope)
    ```
- ALOps OpenAPI
  * Generate OpenAPI descriptions from Business Central API's.
  * YAML Template: 
    ```yaml
        - task: ALOpsOpenAPI@1
          displayName: 'ALOps OpenAPI'
          inputs:
            usedocker: False                      # Run task in Docker container. $(usedocker)
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            api_endpoint: https://api.businesscentral.dynamics.com/v2.0/$(azure_tenant_id)/Sandbox/api# Set API Endpoint. (protocol://host:port/serverinstance/api) $(api_endpoint)
            authentication: oauth                 # Set authentication Method to use. Default [Windows]. $(authentication)
            azure_tenant_id:                      # Azure Tenant Id. Only required for BC SaaS $(azure_tenant_id)
            azure_app_client_id:                  # Azure AD Application Client Id. $(azure_app_client_id)
            azure_app_client_secret:              # Azure AD Application Client Secret. $(azure_app_client_secret)
            azure_app_client_certificate:         # Azure AD Application Client Certificate. $(azure_app_client_certificate)
            azure_app_client_certificate_password: # Azure AD Application Client Certificate Password. $(azure_app_client_certificate_password)
            username:                             # Business Central Username. Leave empty for Service-2-Service authentication. $(username)
            password:                             # Business Central User Password. Leave empty for Service-2-Service authentication. $(password)
            publish_artifacts: True               # Publish results as Artifacts. $(publish_artifacts)
            discover: True                        # Discover available API routes. $(discover)
            api_routes:                           # Specify API Routes to convert. Multiline or '|' seperated. $(api_routes)
            api_exclude_routes:                   # Specify API Routes to exclude from discovery. Multiline or '|' seperated. $(api_exclude_routes)
            inspect_paths: False                  # Print all available Paths per Route. $(inspect_paths)
            api_servers:                          # Specify available servers for OpenAPI. Multiline or '|' seperated. $(api_servers)
            export_edmx: False                    # Export original API EDMX. $(export_edmx)
            export_yaml: True                     # Export API in YAML format. $(export_yaml)
            export_json: False                    # Export API in JSON format. $(export_json)
            exclude_company_paths: False          # Exclude Company Paths. $(exclude_company_paths)
    ```
- ALOps Package Import
  * Import and Process RapidStart/Configuration Package
  * YAML Template: 
    ```yaml
        - task: ALOpsPackageImport@1
          displayName: 'ALOps Package Import'
          inputs:
            usedocker: True                       # Run task in Docker container. $(usedocker)
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            company_name:                         # Company name for Package import. $(company_name)
    ```
- ALOps App Publish
  * Publish Business Central extension to service tier.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppPublish@1
          displayName: 'ALOps App Publish'
          inputs:
            usedocker: False                      # Run task in Docker container. $(usedocker)
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            installpublishedapps: True            # Install Published Applications. $(installpublishedapps)
            installaltesttool: False              # Install the AL TestTool for v15. $(installaltesttool)
            install_al_app_names: Tests-TestLibraries
    System Application Test
    System Application Test Library
    Any
    Library Assert
    Test Runner
    # Specify additional docker parameters. $(install_al_app_names)
            strictappnames: False                 # Only install Specified Apps. $(strictappnames)
            nav_serverinstance: BC140             # Business Central Server Instance Name. $(nav_serverinstance)
            artifact_path:                        # Path for storing App Artifact. $(artifact_path)
            nav_artifact_app_filter: *.app        # Filter used for locating App file relative to $(path_to_publish). $(nav_artifact_app_filter)
            skip_verification: True               # Skip CodeSign Verification of Business Central App. $(skip_verification)
            forceinstall: False                   # Always install Apps regards of current state. $(forceinstall)
            forcesync: False                      # Sets the Sync-Mode to Force, enables pushing breaking changes. $(forcesync)
            publish_scope: Global                 # Set the scope for publishing extensions. $(publish_scope)
            tenant: default                       # Tenant to publish to when Scope is set to Tenant. $(tenant)
            batch_publish_folder:                 # Path containing Apps to publish. $(batch_publish_folder)
            publisherazureactivedirectorytenantid: # Publisher Azure AD TenantId. $(publisherazureactivedirectorytenantid)
            blocksymbolsonly: False               # Check App, block if SymbolsOnly App. $(blocksymbolsonly)
    ```
- ALOps Repository Publish Extension
  * Publish extension to ALOps Repository.
  * YAML Template: 
    ```yaml
        - task: ALOpsRepositoryPublish@1
          displayName: 'ALOps Repository Publish Extension'
          inputs:
            usedocker: False                      # Run task in Docker container. $(usedocker)
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            alops_repository_endpoint: api.businesscentral.dynamics.com# Azure API Endpoint. $(alops_repository_endpoint)
            alops_repository_username:            # Username for ALOps API Endpoint. $(alops_repository_username)
            alops_repository_password:            # Password for ALOps API Endpoint. $(alops_repository_password)
            artifact_path:                        # Path for App Artifact. $(artifact_path)
            app_artifact_filter: *.app            # Path of the App to publish. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(app_artifact_filter)
            upload_c_applications: False          # Upload Applications from Applications folder. $(upload_c_applications)
    ```
- ALOps SaaS Get Extensions
  * Replaced by Task [ALOps Extension API]
  * YAML Template: 
    ```yaml
        - task: ALOpsSaaSGetExtensions@1
          displayName: 'ALOps SaaS Get Extensions'
          inputs:
            azure_api_endpoint: api.businesscentral.dynamics.com# Azure API Endpoint. $(azure_api_endpoint)
            azure_api_version: v2.0               # Azure API Endpoint version. $(azure_api_version)
            azure_tenant_id:                      # Azure Tenant Id. $(azure_tenant_id)
            azure_app_client_id:                  # Azure AD Application Client Id. $(azure_app_client_id)
            azure_app_client_secret:              # Azure AD Application Client Secret. $(azure_app_client_secret)
            bc_impersonate_user:                  # Business Central User to impersonate. $(bc_impersonate_user)
            bc_impersonate_password:              # Business Central User Password to impersonate. $(bc_impersonate_password)
            bc_environment: sandbox               # Business Central environment to publish extension on. $(bc_environment)
            bc_companyname:                       # Business Central Company. $(bc_companyname)
    ```
- ALOps SaaS Publish Extension
  * Replaced by Task [ALOps Extension API]
  * YAML Template: 
    ```yaml
        - task: ALOpsSaaSPublishExtension@1
          displayName: 'ALOps SaaS Publish Extension'
          inputs:
            azure_api_endpoint: api.businesscentral.dynamics.com# Azure API Endpoint. $(azure_api_endpoint)
            azure_api_version: v2.0               # Azure API Endpoint version. $(azure_api_version)
            azure_tenant_id:                      # Azure Tenant Id. $(azure_tenant_id)
            azure_app_client_id:                  # Azure AD Application Client Id. $(azure_app_client_id)
            azure_app_client_secret:              # Azure AD Application Client Secret. $(azure_app_client_secret)
            bc_impersonate_user:                  # Business Central User to impersonate. $(bc_impersonate_user)
            bc_impersonate_password:              # Business Central User Password to impersonate. $(bc_impersonate_password)
            bc_environment: sandbox               # Business Central environment to publish extension on. $(bc_environment)
            bc_companyname:                       # Business Central Company. $(bc_companyname)
            artifact_path:                        # Path for App Artifact. $(artifact_path)
            app_artifact_filter: *.app            # Filter used for locating App file relative to $(path_to_publish). $(app_artifact_filter)
    ```

