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
            azure_tenant_id:                      # Azure Active Directory tenant ID (GUID or domain) of the Microsoft 365 or Entra ID tenant. Required for all SaaS cloud interactions. $(azure_tenant_id)
            azure_app_client_id:                  # Application (client) ID of the Azure AD app registration used for authentication against the Admin Center API. $(azure_app_client_id)
            azure_app_client_secret:              # Client secret of the Azure AD app registration. Store this value in a pipeline secret variable or Azure Key Vault, never in plain text. $(azure_app_client_secret)
            azure_app_client_certificate:         # Path or base-64 encoded content of the certificate (.pfx) used instead of a client secret for Azure AD app authentication. $(azure_app_client_certificate)
            azure_app_client_certificate_password: # Password protecting the client certificate. Store this in a pipeline secret variable. $(azure_app_client_certificate_password)
            username:                             # Business Central user account name. Leave empty when using Service-to-Service (app-only) OAuth authentication. $(username)
            password:                             # Password for the Business Central user account. Leave empty for Service-to-Service authentication. Store this in a pipeline secret variable. $(password)
            checksecondsdelay: 30                 # Number of seconds to wait between polls when checking the status of an async operation. Increase this for slower environments. $(checksecondsdelay)
            maxtries: 20                          # Maximum number of status-check attempts before the task times out and fails. Multiply by checksecondsdelay to calculate the total maximum wait time. $(maxtries)
            interaction: environment_list         # Admin Center API operation to execute: environment_list or environment_get reads environment info; environment_copy or environment_rename manages environments; app_install, app_uninstall, or app_update manages extensions; set_application_insightskey or set_security_group applies configuration. $(interaction)
            wait_for_operation: True              # When enabled, the task polls the Admin Center API until the async operation completes or the maximum number of tries is reached. Disable to fire-and-forget. $(wait_for_operation)
            environment:                          # Name of the source Business Central environment to act on, for example Sandbox or Production. $(environment)
            target_environment:                   # Name of the target environment used for copy or rename operations. $(target_environment)
            target_environment_type: Sandbox      # Type of the new environment created during a copy operation. Sandbox environments allow developer access; Production environments are for live business data. $(target_environment_type)
            use_update_window: False              # When enabled, the app install or update is scheduled within the Admin Center maintenance window instead of running immediately. $(use_update_window)
            app_id:                               # GUID of the Business Central extension to install, uninstall, or update. Find this value in the app.json of the extension or in the AppSource listing. $(app_id)
            accept_isv_eula: False                # Required to install ISV apps that carry an end-user license agreement. Set this to true to accept the EULA programmatically. $(accept_isv_eula)
            force_dependencies: False             # Force the installation or update of all dependent extensions together with the target app, even if they are already installed at a lower version. $(force_dependencies)
            confirm_delete_data: False            # Required when uninstalling an extension that has stored data in Business Central. Set this to true to confirm that stored data will be permanently deleted. $(confirm_delete_data)
            application_insightskey:              # Azure Application Insights instrumentation key (GUID) to configure on the Business Central environment for telemetry. Used with the set_application_insightskey interaction. $(application_insightskey)
            security_group_id:                    # Azure AD security group object ID to assign to the Business Central environment for access control. Used with the set_security_group interaction. $(security_group_id)
    ```
- ALOps Agent Maintenance
  * Cleanup and maintain DevOps a Agent for Business Central.
  * YAML Template: 
    ```yaml
        - task: ALOpsAgentMaintenance@1
          displayName: 'ALOps Agent Maintenance'
          inputs:
            removeoldtasks: False                 # Remove stale ALOps pipeline task artifacts left over from previous pipeline runs on this agent. Helps keep the agent workspace clean over time. $(removeoldtasks)
            removeunusedcontainers: False         # Run Docker container pruning to remove all stopped or unused containers on the build agent. Frees disk space between pipeline runs. $(removeunusedcontainers)
            pruneimagesdayscreated: 0             # Remove Docker images that were created more than this many days ago. Set to 0 to disable image pruning by creation date. $(pruneimagesdayscreated)
            pruneimagesosbased: False             # Remove Docker images whose base operating system is outdated, for example images based on older Windows Server versions that have been superseded. $(pruneimagesosbased)
            removebcartifacts: False              # Delete Business Central artifact packages from the local cache folder to free disk space. Artifacts are re-downloaded automatically the next time they are needed. $(removebcartifacts)
            bcartifactscachefolder: C:\bcartifacts.cache# File system path of the BC artifact cache folder to clean. Change this only if you configured a non-default cache location. Default is C:\bcartifacts.cache. $(bcartifactscachefolder)
            daysunused: 30                        # Remove BC artifact packages that have not been accessed for more than this many days. More recently used packages are preserved. $(daysunused)
    ```
- ALOps App License Check
  * Validates Business Central App (.app) files against a BC license to ensure all objects are licensed.

**Requirements:** This task requires the Microsoft Dynamics NAV/BC platform assemblies (NCL) to be available on the build agent. These are only present on agents with a full NAV/BC installation.

**Recommended:** Run this task inside a Docker container using a BC artifact image (set 'In Docker' to true), which provides all required platform components without a local BC installation.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppLicenseCheck@1
          displayName: 'ALOps App License Check'
          inputs:
            usedocker: False                      # Run this task inside the Business Central Docker container identified by the fixed tag. The container provides the BC platform assemblies needed for FLF license parsing. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
            fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
            licensefile:                          # Path or URL of the Business Central license file (.flf or .bclicense) to validate against. Supports fully qualified paths, paths relative to $(System.DefaultWorkingDirectory), and HTTP/HTTPS URLs. $(licensefile)
            artifact_path: $(System.ArtifactsDirectory)# Folder containing the .app files to validate against the license. Supports pipeline variables such as $(System.ArtifactsDirectory). $(artifact_path)
            artifact_filter: *.app                # Glob filter applied inside artifact_path to select which .app files to check, for example *.app. $(artifact_filter)
            artifact_include:                     # Comma-separated include patterns applied in addition to artifact_filter when selecting .app files, for example MyApp*.app. $(artifact_include)
            artifact_exclude:                     # Comma-separated exclude patterns to omit specific .app files from the license check, for example *Test*.app. $(artifact_exclude)
            exclude_ranges:                       # Comma-separated list of object ID ranges to exclude from the license check. Useful for buffer tables or temporary object ranges. Format: 60000..60099,70000..70100. $(exclude_ranges)
            expiry_text:                          # Text string to search for in the license file to locate the expiry date, for example Expiration Date. Required together with expiry_dateformat for the expiry check. $(expiry_text)
            expiry_dateformat:                    # Date format of the expiry date found in the license file, for example dd.MM.yyyy or MM/dd/yyyy. Required together with expiry_text for the expiry check. $(expiry_dateformat)
            expiry_dayswarning:                   # Number of days before license expiry at which a warning is issued in the pipeline. Set to 0 to only raise an error on the actual expiry date. $(expiry_dayswarning)
            expiry_checkonly: False               # When enabled, only the license expiry date is checked and the full object-level license validation is skipped. Useful when you need a quick expiry check without a full app analysis. $(expiry_checkonly)
            exclude_tables: False                 # Exclude Table objects from the license coverage check. Useful when tables are intentionally unlicensed, for example temporary tables used only at runtime. $(exclude_tables)
            exclude_codeunits: False              # Exclude Codeunit objects from the license coverage check. $(exclude_codeunits)
            exclude_pages: False                  # Exclude Page objects from the license coverage check. $(exclude_pages)
            exclude_reports: False                # Exclude Report objects from the license coverage check. $(exclude_reports)
            exclude_xmlports: False               # Exclude XMLPort objects from the license coverage check. $(exclude_xmlports)
            exclude_queries: False                # Exclude Query objects from the license coverage check. $(exclude_queries)
            warning_only: False                   # When enabled, unlicensed objects produce a pipeline warning instead of a build failure. The pipeline continues and the check result is only advisory. $(warning_only)
            pwsh: False                           # Run the task using PowerShell Core (pwsh) instead of Windows PowerShell. Required on Linux-hosted build agents. $(pwsh)
    ```
- ALOps App Runtime Package
  * Get a NAV App runtime package for onprem deployment.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppRuntimePackage@1
          displayName: 'ALOps App Runtime Package'
          inputs:
            usedocker: False                      # Run this task inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
            fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
            nav_serverinstance: BC140             # Name of the Business Central Server instance that will generate the runtime package, for example BC140 or BC230. $(nav_serverinstance)
            nav_tenant: default                   # Tenant ID to act on when generating the runtime package. Use default for a single-tenant setup. $(nav_tenant)
            targetproject: ./app.json             # Path to the app.json of the AL project to export as a runtime package. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(targetproject)
            appfilenametemplate: %APP_PUBLISHER%_%APP_NAME%_%APP_VERSION%_runtime.app# Template for the output runtime package filename. Supported tokens: %APP_PUBLISHER%, %APP_NAME%, %APP_VERSION%. Example: %APP_PUBLISHER%_%APP_NAME%_%APP_VERSION%_runtime.app. $(appfilenametemplate)
            showmycode: False                     # When enabled, overwrites the ShowMyCode flag in the runtime package manifest to allow source-level debugging of the packaged app. $(showmycode)
            publish_artifact: True                # Upload the generated runtime .app file as a build artifact in Azure DevOps, making it available for download or use in downstream pipeline stages. $(publish_artifact)
            batchgeneratepackages: False          # Generate runtime packages for all apps in the solution in a single operation. The targetproject parameter is ignored when this is enabled. $(batchgeneratepackages)
    ```
- ALOps App Sign
  * Codesign Business Central extension with .pfx.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppSign@1
          displayName: 'ALOps App Sign'
          inputs:
            signmethod: PFX                       # Code-signing method to use. PFX uses a local certificate file (legacy approach). HSM uses a hardware security module via Azure Key Vault or Azure Trusted Signing (recommended for production). $(signmethod)
            usedocker: False                      # Run code signing inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
            fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
            batchsigncompiledapps: False          # Sign all .app files tagged as compiled output by the ALOps App Compiler task in this pipeline run, instead of filtering by artifact_path and nav_artifact_app_filter. $(batchsigncompiledapps)
            artifact_path:                        # Folder containing the .app files to sign. Supports pipeline variables such as $(System.ArtifactsDirectory). $(artifact_path)
            nav_artifact_app_filter: *.app        # Glob filter applied inside artifact_path to select which .app files to sign, for example *.app. $(nav_artifact_app_filter)
            publish_artifact: True                # Upload the signed .app file as a build artifact in Azure DevOps, replacing the unsigned artifact from the compiler task. $(publish_artifact)
            timestamp_uri:                        # URL of the time-stamping authority (TSA) service to include a trusted timestamp in the signature, for example http://timestamp.digicert.com. $(timestamp_uri)
            pfx_path:                             # Path or URL of the PFX certificate file used for signing. Only used when signmethod is PFX. $(pfx_path)
            pfx_password:                         # Password for the PFX certificate file. Store this in a pipeline secret variable. Only used when signmethod is PFX. $(pfx_password)
            hsmmethod: KEYVAULT                   # HSM signing provider to use. KEYVAULT signs using a certificate stored in Azure Key Vault. TRUSTED uses the Azure Trusted Signing managed service. $(hsmmethod)
            hsm_description:                      # Description text embedded in the Authenticode signature, typically the app or company name. Used when signmethod is HSM. $(hsm_description)
            hsm_description_url:                  # URL embedded in the Authenticode signature pointing to the publisher or product information page. Used when signmethod is HSM. $(hsm_description_url)
            hsm_digestalgorithm: sha256           # Digest algorithm used to compute the file hash for signing. The default and recommended value is sha256. Used when signmethod is HSM. $(hsm_digestalgorithm)
            hsm_signing_endpoint:                 # Endpoint URL of the Azure Trusted Signing account, for example https://eus.codesigning.azure.net. Required when hsmmethod is TRUSTED. $(hsm_signing_endpoint)
            hsm_signing_account:                  # Name of the Azure Trusted Signing account. Required when hsmmethod is TRUSTED. $(hsm_signing_account)
            hsm_trusted_certificateprofile:       # Name of the certificate profile within the Azure Trusted Signing account to use for signing. Required when hsmmethod is TRUSTED. $(hsm_trusted_certificateprofile)
            hsm_keyvault_name:                    # Name of the Azure Key Vault containing the signing certificate. Required when hsmmethod is KEYVAULT. $(hsm_keyvault_name)
            hsm_keyvault_certificate_name:        # Name of the certificate stored in Azure Key Vault to use for signing. Required when hsmmethod is KEYVAULT. $(hsm_keyvault_certificate_name)
            hsm_tenantid:                         # Azure AD tenant ID that owns the Key Vault. Required when hsmmethod is KEYVAULT. $(hsm_tenantid)
            hsm_clientid:                         # Application (client) ID of the Azure AD service principal with access to the Key Vault. Required when hsmmethod is KEYVAULT. $(hsm_clientid)
            hsm_client_secret:                    # Client secret of the Azure AD service principal. Store this in a pipeline secret variable. Required when hsmmethod is KEYVAULT. $(hsm_client_secret)
    ```
- ALOps App Sign Verify
  * Verify CodeSign of Business Central extension.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppSignVerify@1
          displayName: 'ALOps App Sign Verify'
          inputs:
            usedocker: False                      # Run signature verification inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
            fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
            artifact_path:                        # Folder containing the .app files whose Authenticode signatures should be verified. Supports pipeline variables such as $(System.ArtifactsDirectory). $(artifact_path)
            nav_artifact_app_filter: *.app        # Glob filter applied inside artifact_path to select which .app files to verify, for example *.app. The task fails if any selected file has an invalid or missing signature. $(nav_artifact_app_filter)
    ```
- ALOps AppSource
  * Compile a Business Central extension from AL code.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppSource@1
          displayName: 'ALOps AppSource'
          inputs:
            azure_tenant_id:                      # Azure Active Directory tenant ID (GUID or domain) of the partner center tenant used for AppSource submissions. $(azure_tenant_id)
            azure_app_client_id:                  # Application (client) ID of the Azure AD app registration used for Partner Center API authentication. $(azure_app_client_id)
            azure_app_client_secret:              # Client secret of the Azure AD app registration. Store this value in a pipeline secret variable or Azure Key Vault, never in plain text. $(azure_app_client_secret)
            apply_offering_version_filter: False  # When enabled, only offerings whose new version is higher than the currently published version are uploaded. Prevents accidental re-submission of the same version. $(apply_offering_version_filter)
            autopromote: False                    # Automatically promote the AppSource submission to the next review stage after publishing, without requiring a manual action in Partner Center. $(autopromote)
            autopromote_checksecondsdelay: 30     # Number of seconds to wait between polls when checking the promotion status of the AppSource submission. $(autopromote_checksecondsdelay)
            autopromote_maxtries: 120             # Maximum number of status-check attempts when auto-promoting. Multiply by autopromote_checksecondsdelay for the total maximum wait time. $(autopromote_maxtries)
            offering_name_filter_array:           # Semicolon-separated list of AppSource offering names to include. Submissions for offerings not in this list are skipped. Leave empty to process all offerings. $(offering_name_filter_array)
            skip_version_change: False            # When enabled, the version number in the AppSource package manifest is not updated before submission. Use this when the version has already been set correctly. $(skip_version_change)
            pwsh: False                           # Run the task using PowerShell Core (pwsh) instead of Windows PowerShell. Required on Linux-hosted build agents. $(pwsh)
    ```
- ALOps App Test
  * Run Business Central Test-Suite and collect results.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppTest@1
          displayName: 'ALOps App Test'
          inputs:
            usedocker: False                      # Run tests inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
            fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
            nav_serverinstance:                   # Name of the Business Central Server instance to run tests against, for example BC140 or BC230. $(nav_serverinstance)
            tenant: default                       # Business Central tenant to run tests in. Use default for a single-tenant setup. $(tenant)
            companyname:                          # Name of the Business Central company to use when running tests. Leave empty to use the first available company. $(companyname)
            profile:                              # Business Central role center profile ID used for the test session. Leave empty to use the default profile. $(profile)
            bc_username:                          # User account name for connecting to Business Central to run tests. Leave empty to use Windows authentication. $(bc_username)
            bc_password:                          # Password for the Business Central test user. Store this in a pipeline secret variable. $(bc_password)
            bc_authentication: NavUserPassword    # Authentication type for the Business Central service tier connection. NavUserPassword is the default for containers. AAD is required for SaaS environments. $(bc_authentication)
            bc_webclient_url:                     # URL of the Business Central web client. Required when the test runner needs to resolve the web client endpoint for UI tests. $(bc_webclient_url)
            testfilter:                           # Filter to select which test codeunits to include in the test suite. Supports codeunit ID ranges, names, or patterns separated by semicolons. $(testfilter)
            disabledtests:                        # Path to a JSON file listing individual test methods to skip. Useful for temporarily disabling known-failing or unstable tests without modifying AL source code. $(disabledtests)
            show_available_tests: True            # When enabled, print a list of all discovered test methods to the pipeline log before running. Helpful for diagnosing which tests are picked up. $(show_available_tests)
            import_testtoolkit: True              # Import the Test ToolKit FOB file into Business Central before running tests. Required when the Test Toolkit is not already present in the environment. $(import_testtoolkit)
            import_action: Overwrite              # Action to take when importing the Test Toolkit FOB. Overwrite replaces existing objects. Skip aborts the import if the objects already exist. Default uses the server default behavior. $(import_action)
            testpage: 130409                      # Page ID of the test runner page used to execute tests. The standard AL Test Runner page is 130409. $(testpage)
            testsuite: DEFAULT                    # Name of the test suite in Business Central to activate and run. The DEFAULT suite covers all available tests. $(testsuite)
            extensionid:                          # GUID of the specific Business Central extension to test. When set, only tests from this extension are included in the run. $(extensionid)
            installaltesttool: False              # Install the AL Test Tool and test library apps required for running BC unit tests on version 15 and later. $(installaltesttool)
            failed_test_action: Warning           # Action to take when a test method fails. Ignore continues without flagging. Warning marks the task as partially succeeded. Error fails the pipeline task. $(failed_test_action)
            override_finsql_path:                 # Override the automatic detection of finsql.exe with a fixed path. Use this if the executable is in a non-standard location. $(override_finsql_path)
            resultfilename: TestResults.xml       # Filename for the XML test results file written to the working directory. This file is published as a test result artifact and can be consumed by the Azure DevOps test results tab. $(resultfilename)
            testrunnercodeunitid:                 # Codeunit ID of a custom test runner to use instead of the default AL test runner. Leave empty to use the standard runner. $(testrunnercodeunitid)
            allow_zero_tests: False               # When enabled, the task succeeds even if no test methods are found in the target extension. Disable this to catch misconfigured test setups. $(allow_zero_tests)
    ```
- ALOps App Validation
  * Validate App from Business Central AppSource.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppValidation@1
          displayName: 'ALOps App Validation'
          inputs:
            license_path:                         # Path or URL of the Business Central FLF license file to import before validation. Must be a fully qualified path, a path relative to $(System.DefaultWorkingDirectory), or an HTTP/HTTPS URL. $(license_path)
            countries:                            # Comma-separated list of country codes to validate the app against, for example W1,DK,BE. When empty, the countries listed in AppSourceCop.json are used. $(countries)
            affixes:                              # Comma-separated list of object name affixes the app is required to use, for example ABC. AppSourceCop enforces that these affixes are present in all custom object names. $(affixes)
            artifact_path: $(System.ArtifactsDirectory)# Folder containing the .app files to validate. Supports pipeline variables such as $(System.ArtifactsDirectory). $(artifact_path)
            artifact_filter: *.app                # Glob filter applied inside artifact_path to select the .app files to validate, for example *.app. $(artifact_filter)
            installapps_path: $(System.ArtifactsDirectory)# Folder containing dependency .app files that must be installed before the validated app can be published. $(installapps_path)
            installapps_filter: *.app             # Glob filter applied inside installapps_path to select which dependency apps to install. $(installapps_filter)
            previousapps_path: $(System.ArtifactsDirectory)# Folder containing the previous version of the app. Used for upgrade compatibility validation and data upgrade testing. $(previousapps_path)
            previousapps_filter: *.app            # Glob filter applied inside previousapps_path to select which previous-version apps to use for upgrade validation. $(previousapps_filter)
            memory: 8G                            # Maximum memory allocated to the Docker container used for validation, for example 8G. Increase this for larger apps or when memory pressure causes failures. $(memory)
            validateversion:                      # Full or partial Business Central version to validate against, for example 22.0 or 22.3.12345. When set, the app is also validated against this specific BC version in addition to the standard targets. $(validateversion)
            validatecurrent: False                # When enabled, validate the app against the currently released version of Business Central. $(validatecurrent)
            validatenextminor: False              # When enabled, validate the app against the next upcoming minor version of Business Central. Useful for early compatibility testing. $(validatenextminor)
            validatenextmajor: False              # When enabled, validate the app against the next upcoming major version of Business Central. Useful for forward-compatibility testing before a new wave. $(validatenextmajor)
            sastoken:                             # Shared Access Signature token used to authenticate access to an Azure Storage Account containing BC artifacts. Leave empty for public artifact storage. $(sastoken)
            skipverification: False               # When enabled, skip Authenticode signature verification of the .app file before validation. Use this for unsigned development builds. $(skipverification)
            skipappsourcecop: False               # When enabled, skip the AppSource code analysis rules (AppSourceCop) during validation. Use this to focus on functional validation only. $(skipappsourcecop)
            includewarnings: False                # When enabled, AppSource validation warnings are included in the result output. By default only errors are reported. $(includewarnings)
            failonerror: True                     # When enabled, the task stops on the first validation error instead of collecting all errors and reporting them together at the end. $(failonerror)
            containername: bcserver               # Name assigned to the Docker container used for validation. Only change this when multiple DevOps pipeline agents run simultaneously on the same host to avoid container name conflicts. $(containername)
            accept_insider_eula: False            # Accept the insider EULA required to access next-minor and next-major Business Central artifacts. Required when validatenextminor or validatenextmajor is enabled. $(accept_insider_eula)
    ```
- ALOps BCPT
  * Run Business Central BCPT-Suite and collect results.
  * YAML Template: 
    ```yaml
        - task: ALOpsBCPT@1
          displayName: 'ALOps BCPT'
          inputs:
            usedocker: False                      # Run the BCPT test suite inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
            fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
            export_results: False                 # Export the BCPT test results to a file after the run. When enabled, results are saved to the working directory and can be published as pipeline artifacts. $(export_results)
            suite_code:                           # Code of the BCPT suite to execute, as configured in Business Central. Leave empty to run all available BCPT suites. $(suite_code)
            test_runner_page: 149002              # Page ID of the BCPT test runner page in Business Central. The standard BCPT runner page is 149002. $(test_runner_page)
    ```
- ALOps BC Replay
  * Run BC-Replay for Business Central.
  * YAML Template: 
    ```yaml
        - task: ALOpsBCReplay@1
          displayName: 'ALOps BC Replay'
          inputs:
            usedocker: False                      # Run BC Replay inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
            fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
            pwsh: True                            # Run the task using PowerShell Core (pwsh) instead of Windows PowerShell. Required on Linux-hosted build agents and enabled by default for this task. $(pwsh)
    ```
- ALOps App Cleaner
  * Remove all extensions from Business Central service tier.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppClean@1
          displayName: 'ALOps App Cleaner'
          inputs:
            usedocker: False                      # Run this task inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
            fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
            nav_computername: localhost           # Hostname or IP address of the server running the Business Central service tier. Use localhost when the build agent runs on the same machine. $(nav_computername)
            nav_serverinstance: BC140             # Name of the Business Central Server instance from which all extensions will be removed, for example BC140 or BC230. $(nav_serverinstance)
            sync_mode: Add                        # Schema synchronization mode applied when removing extensions. Add preserves existing data. Clean removes extension tables and data. Development performs a lightweight sync for rapid iteration. forceSync pushes breaking schema changes, potentially deleting data. $(sync_mode)
            includemicrosoftapps: False           # When enabled, Microsoft-published system apps are also removed. Disable this to only remove custom and third-party extensions. $(includemicrosoftapps)
    ```
- ALOps App Copy
  * Copy Business Central extensions from one service tier to another.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppCopy@1
          displayName: 'ALOps App Copy'
          inputs:
            nav_computername: localhost           # Hostname or IP address of the server running the Business Central service tier. Use localhost when the build agent runs on the same machine. $(nav_computername)
            nav_serverinstance_source: BC140      # Name of the Business Central Server instance to copy extensions from, for example BC140. Extensions published on this instance will be replicated to the target. $(nav_serverinstance_source)
            nav_serverinstance_target: BC140      # Name of the Business Central Server instance to copy extensions to, for example BC230. Extensions from the source instance will be published here. $(nav_serverinstance_target)
            nav_app_storage:                      # Temporary folder on disk used to stage .app files during the copy operation. Leave empty to use the default system temp folder. $(nav_app_storage)
    ```
- ALOps App Compiler
  * Compile a Business Central extension from AL code.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppCompiler@1
          displayName: 'ALOps App Compiler'
          inputs:
            usedocker: False                      # Run compilation inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
            fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
            targetproject: ./app.json             # Path to the app.json file of the AL project to compile. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(targetproject)
            nav_computername:                     # Hostname or IP address of the server providing Business Central symbols for compilation. Use localhost when the agent runs on the same machine. $(nav_computername)
            nav_serverinstance: BC140             # Name of the Business Central Server instance used to download symbols, for example BC140 or BC230. $(nav_serverinstance)
            nav_tenant: default                   # Tenant ID used when downloading symbols from a multi-tenant Business Central instance. Use default for a single-tenant setup. $(nav_tenant)
            nav_ports_dev: 7049                   # Port number of the Business Central development endpoint used to download symbols. The default port is 7049. $(nav_ports_dev)
            bc_username:                          # User account name for authenticating to the Business Central service tier during symbol download. Leave empty to use Windows authentication. $(bc_username)
            bc_password:                          # Password for the Business Central service tier user. Store this in a pipeline secret variable. $(bc_password)
            al_compiler_version: 0.12.15355       # Version of the AL Language compiler (alc.exe) from the AL VSIX package to use for compilation. Use 0.0.0.0 to always resolve the latest available version. $(al_compiler_version)
            ruleset:                              # Path to a .ruleset.json file that overrides the ruleset configured in the project .vscode/settings.json. Path is relative to the AL source folder. $(ruleset)
            suppresswarnings: KEEP                # Comma-separated list of diagnostic IDs to suppress during compilation, for example AA0001,AA0002. Set to KEEP to preserve the suppressWarnings value already defined in app.json. $(suppresswarnings)
            al_analyzer:                          # Comma-separated list of AL analyzers to run during compilation, for example CodeCop,UICop,PerCop. Leave empty to use only the default set of analyzers. $(al_analyzer)
            ignorepragmas:                        # When enabled, diagnostics suppressed by pragma directives in the AL source code are reported anyway, making hidden suppressed warnings visible in the build log. $(ignorepragmas)
            nav_app_version: 1.0.*.0              # Version number template applied to the compiled app. The asterisk (*) is replaced by the current pipeline build number, for example 1.0.*.0 produces 1.0.42.0. $(nav_app_version)
            vsix_download_path:                   # Alternative download URL for the AL Language VSIX extension used to obtain the compiler. Set to Latest to always download the newest version from the configured server. $(vsix_download_path)
            use_ssl: False                        # Enable SSL when connecting to the Business Central development endpoint for symbol download. $(use_ssl)
            download_test_symbols: False          # Download test framework symbols (Test Toolkit) even when the project app.json does not reference a test version. Required for unit test projects. $(download_test_symbols)
            usecompression: True                  # Compress the AL source folder into a zip archive before transferring it into the Docker container. Reduces transfer time for large projects. $(usecompression)
            publish_artifact: True                # Upload the compiled .app file as a build artifact in Azure DevOps, making it available for download or use in downstream pipeline stages. $(publish_artifact)
            publishxlif: False                    # Upload the generated .xlf translation file as a build artifact in Azure DevOps alongside the compiled app. $(publishxlif)
            failed_on_warnings: False             # Fail the pipeline task if the AL compiler produces any warnings. Useful for enforcing a warning-free codebase in CI pipelines. $(failed_on_warnings)
            failonany: False                      # Fail the pipeline task if the AL compiler produces any diagnostic message at all, including hints and informational messages. $(failonany)
            app_file_suffix:                      # Text appended to the compiled .app filename before the extension, for example _preview produces Publisher_App_1.0.1.0_preview.app. $(app_file_suffix)
            updatebuildnumber: True               # Update the Azure DevOps pipeline build number to match the compiled app version so that the build run is labeled with the app version. $(updatebuildnumber)
            setup_working_folder: False           # Copy the local working folder into the Docker container before compilation starts. Required when the container does not already contain the source files. $(setup_working_folder)
            showmycode: Keep                      # Override the ShowMyCode flag in app.json before compilation. Keep preserves the existing value. Enable allows source-level debugging of the app. Disable protects source code from being viewed by debuggers. $(showmycode)
            resourceexposurepolicy_allowdebugging: Keep# Override the allowDebugging resource exposure policy in app.json. Keep preserves the existing value. Enable allows attaching a debugger to the app. Disable prevents debugging. $(resourceexposurepolicy_allowdebugging)
            resourceexposurepolicy_allowdownloadingsource: Keep# Override the allowDownloadingSource resource exposure policy in app.json. Keep preserves the existing value. Enable allows downloading source via the AL Language extension. Disable prevents it. $(resourceexposurepolicy_allowdownloadingsource)
            resourceexposurepolicy_includesourceinsymbolfile: Keep# Override the includeSourceInSymbolFile resource exposure policy in app.json. Keep preserves the existing value. Enable embeds source in the .app symbol file. Disable removes it. $(resourceexposurepolicy_includesourceinsymbolfile)
            internalsvisibleto: Keep              # Override the internalsVisibleTo section in app.json. Keep preserves the existing value. Remove strips the section so that internal symbols are not exposed to any other extension. $(internalsvisibleto)
            preprocessorsymbols:                  # Override the preprocessorSymbols array in app.json with a comma-separated list of symbols, for example CLEAN19,CLEAN20. Set to NONE to remove all preprocessor symbols. $(preprocessorsymbols)
            applicationinsightskey:               # Override the applicationInsightsKey in app.json with the provided Azure Application Insights instrumentation key (GUID). Set to NONE to remove the key from app.json. $(applicationinsightskey)
            printappmanifest: True                # Print the final app.json content to the pipeline log immediately before compilation. Useful for diagnosing all version and policy overrides applied by this task. $(printappmanifest)
            output_alc_logs: True                 # Output the full compiler log produced by alc.exe to the pipeline log, including all warnings, hints, and informational messages. $(output_alc_logs)
            additionalprobingpaths:               # One additional .NET assembly probing path per line. The AL compiler uses these paths to locate external .NET assemblies referenced by the app. $(additionalprobingpaths)
            enable_external_rulesets: False       # Allow the AL compiler to load ruleset files referenced by a full URL or absolute path, in addition to local relative paths. $(enable_external_rulesets)
            allowed_publisher_names:              # List of permitted app publisher names separated by the character defined in allowed_publisher_names_separator. The build fails if any dependency references a publisher not in this list. $(allowed_publisher_names)
            allowed_publisher_names_separator: ,  # Character or string used to separate publisher names in the allowed_publisher_names field. Defaults to a comma. $(allowed_publisher_names_separator)
            generatereportlayouts: True           # Pass the generateReportLayouts flag to the AL compiler so that default report layouts are automatically generated during compilation. $(generatereportlayouts)
            alc_continuebuildonerror: False       # Pass the continueOnError flag to alc.exe. Compilation continues even when errors are encountered and produces a partial result. Useful for gathering all errors in one pass. $(alc_continuebuildonerror)
            alc_errorlog: False                   # Pass the errorLog flag to alc.exe to write compiler errors to a separate error log file in addition to the standard output. $(alc_errorlog)
            pwsh: False                           # Run the task using PowerShell Core (pwsh) instead of Windows PowerShell. Required when running on Linux-hosted build agents. $(pwsh)
    ```
- ALOps Docker Create
  * Create Docker image based on NAV/BC Artifacts.
  * YAML Template: 
    ```yaml
        - task: ALOpsDockerCreate@1
          displayName: 'ALOps Docker Create'
          inputs:
            artifactspecification: Specific       # Method used to resolve the BC artifact. Specific resolves the artifact described by artifacttype, artifactversion, and artifactcountry. Hint resolves the artifact from a JSON hint file specified in artifacthint. $(artifactspecification)
            artifactversion:                      # Business Central or NAV version number to use for the container image, for example 22.5, NAV2018, or 16.4.24524. Leave empty when using versionselect to resolve automatically. $(artifactversion)
            artifacttype: OnPrem                  # Type of BC artifact to use. OnPrem provides on-premises binaries. Sandbox provides the same binaries used in Business Central cloud environments. $(artifacttype)
            artifactcountry:                      # Two-letter country code for the localized BC artifact, for example W1, DK, or US. Use W1 for the international base version. $(artifactcountry)
            versionselect: Latest                 # Version selection strategy when artifactversion is not pinned to an exact build. Use Latest to always pull the newest available version, or specify a partial version for the newest matching build. $(versionselect)
            artifacthint:                         # Path or URL of a JSON hint file that describes the artifact to use. Only applicable when artifactspecification is set to Hint. $(artifacthint)
            multitenant: False                    # Create a multi-tenant container image where each tenant is isolated in its own database. Required for multi-tenant test scenarios. $(multitenant)
            memory: 8G                            # Maximum memory assigned to the Docker container, for example 8G. Increase this for large databases or when the BC server runs out of memory during startup. $(memory)
            imageprefix: myImage                  # Prefix used as the base name for the created Docker image. Combined with imagenametemplate to form the full image tag. $(imageprefix)
            dockerregistry:                       # Docker registry to pull the base image from or push the created image to, for example bcinsider.azurecr.io. Leave empty to use Docker Hub. $(dockerregistry)
            dockerusername:                       # Username for authenticating to the Docker registry. Leave empty for public registries. $(dockerusername)
            dockerpassword:                       # Password for authenticating to the Docker registry. Store this in a pipeline secret variable. $(dockerpassword)
            storageaccount:                       # Azure Storage Account name that hosts the BC artifact files. Only required when using a non-default or private artifact storage location. $(storageaccount)
            sastoken:                             # Shared Access Signature token for authenticating to the Azure Storage Account. Leave empty when the storage account allows public access. $(sastoken)
            forcecreateimage: False               # When enabled, a new image is always built locally and the Docker pull step is skipped. Useful when the target registry is not reachable from the agent. $(forcecreateimage)
            myscripts:                            # One entry per line: paths or URLs of PowerShell scripts to embed in the created image as myScripts. These scripts run automatically when a container is started from this image. $(myscripts)
            imagenametemplate: %IMAGE_PREFIX%:%ARTIFACT_TYPE%-%ARTIFACT_VERSION%-%ARTIFACT_COUNTRY%-%OS_VERSION%-%OS_LTSC%# Template for the full Docker image tag. Available tokens: %IMAGE_PREFIX%, %ARTIFACT_TYPE%, %ARTIFACT_VERSION%, %ARTIFACT_COUNTRY%, %OS_VERSION%, %OS_LTSC%. $(imagenametemplate)
            use_generic_image:                    # Fully qualified name of a base Docker image to use instead of the default navcontainerhelper generic image. $(use_generic_image)
            licensefile:                          # Path or URL of a Business Central license file (.flf or .bclicense) to include in the created image. The license is applied automatically when a container starts. $(licensefile)
            includetesttoolkit: False             # Include the complete BC Test Toolkit (test libraries, test framework, and performance toolkit) in the created image. $(includetesttoolkit)
            includetestlibrariesonly: False       # Include only the test library apps in the created image, without the full test framework. Reduces image size when only library-dependent tests are needed. $(includetestlibrariesonly)
            includetestframeworkonly: False       # Include only the core test framework apps in the created image, without test libraries or performance toolkit. $(includetestframeworkonly)
            includeperformancetoolkit: False      # Include the BC Performance Toolkit in the created image to enable BCPT performance benchmarking. $(includeperformancetoolkit)
            accept_insider_eula: False            # Accept the insider program end-user license agreement required to access Business Central insider or preview artifacts. $(accept_insider_eula)
            alternativeartifacturl:               # Full artifact URL that overrides the URL resolved from artifacttype, artifactcountry, and versionselect. Use this to pin to an exact artifact URL. $(alternativeartifacturl)
    ```
- ALOps Docker Execute
  * Execute powershell script in container.
  * YAML Template: 
    ```yaml
        - task: ALOpsDockerExec@1
          displayName: 'ALOps Docker Execute'
          inputs:
            fixed_tag:                            # Fixed name tag of the running Docker container in which to execute the script. The container must have been started by ALOps Docker Start before this task runs. $(fixed_tag)
            scriptsource: InLine                  # Specifies how the PowerShell script is supplied. Path loads the script from a file path on the agent. Workfolder loads it relative to the working folder copied into the container. Download fetches it from a URL. InLine lets you write the script directly in the task. $(scriptsource)
            script_location:                      # Path or URL of the PowerShell script to execute in the container. Applies when scriptsource is Path, Workfolder, or Download. $(script_location)
            inline_script: # Write your powershell commands here.
    Write-Host "Hello World"
    # PowerShell commands to execute directly inside the running Business Central Docker container. Only used when scriptsource is set to InLine. $(inline_script)
    ```
- ALOps Docker Remove
  * Remove Business Central docker container.
  * YAML Template: 
    ```yaml
        - task: ALOpsDockerRemove@1
          displayName: 'ALOps Docker Remove'
          inputs:
            usedocker: True                       # Identifies the Docker container to remove using the fixed tag. This must match the fixed_tag used when the container was started. $(usedocker)
            fixed_tag:                            # Fixed name tag of the Docker container to stop and remove. $(fixed_tag)
            print_logs: True                      # Print all container logs to the pipeline log before the container is removed. Useful for diagnosing failures without manually inspecting the container. $(print_logs)
            createeventlogbackup: disabled        # Create a Windows event log backup from the container before removing it. disabled never creates a backup. onfailure creates one only when the pipeline has failed. always creates one every run. $(createeventlogbackup)
            createsqlbackup: disabled             # Create a SQL Server database backup (.bak) from the container BC database before removing it. disabled skips the backup. onfailure creates one only on failure. always creates one every run. $(createsqlbackup)
            publishsqlbackup: True                # Upload the SQL backup file as a build artifact in Azure DevOps so it can be downloaded or restored later. $(publishsqlbackup)
            sqlcompression: False                 # Use SQL Server backup compression when creating the database backup. Significantly reduces backup file size. Not supported on SQL Server Express editions. $(sqlcompression)
            zipsqlbackup: True                    # Compress the SQL backup file into a zip archive before publishing it as a build artifact, reducing artifact storage size. $(zipsqlbackup)
    ```
- ALOps Docker Start
  * Start Business Central docker container.
  * YAML Template: 
    ```yaml
        - task: ALOpsDockerStart@1
          displayName: 'ALOps Docker Start'
          inputs:
            fixed_tag:                            # Fixed name tag assigned to the started container. Use the same value in subsequent ALOps Docker tasks to target this container. $(fixed_tag)
            ignore_no_container_warning: False    # When enabled, no warning is produced if a container with the given fixed_tag is not found. Useful in conditional pipeline flows where the container may not have been created. $(ignore_no_container_warning)
            docker_image: $(ALOPS_BC_IMAGE)       # Full name and tag of the Business Central Docker image to start. Supports the $(ALOPS_BC_IMAGE) pipeline variable set by ALOps Docker Create. $(docker_image)
            accept_image_eula: True               # Accept the end-user license agreement of the Docker image. Required for official Microsoft BC images. $(accept_image_eula)
            accept_image_outdated: True           # Accept and start images that are marked as outdated by navcontainerhelper. Disable this to enforce the use of fresh images only. $(accept_image_outdated)
            enable_symbol_loading: False          # Enable the AL symbol loading feature in the Business Central service tier. Required when using this container for compilation with the legacy symbol-download approach. $(enable_symbol_loading)
            enable_api_services: False            # Enable the Business Central OData and API services endpoint. Required for tasks that interact with BC via REST API. $(enable_api_services)
            multitenant: False                    # Start the container in multi-tenant mode. Each tenant runs in an isolated database. Required for multi-tenant test scenarios. $(multitenant)
            docker_pull: True                     # Force a Docker pull of the image before starting the container to ensure the latest version is used. Disable to use a locally cached image. $(docker_pull)
            dockerauthentication: None            # Authentication method for the Docker registry. None uses no authentication. Endpoint uses a service connection configured in Azure DevOps. UsernamePassword uses the docker_username and docker_password fields. $(dockerauthentication)
            docker_login:                         # Generic service connection configured in Azure DevOps for Docker registry authentication. Used when dockerauthentication is set to Endpoint. $(docker_login)
            docker_username:                      # Username for authenticating to the Docker registry. Used when dockerauthentication is set to UsernamePassword. $(docker_username)
            docker_password:                      # Password for authenticating to the Docker registry. Store this in a pipeline secret variable. Used when dockerauthentication is set to UsernamePassword. $(docker_password)
            docker_registry:                      # Hostname of the Docker registry to authenticate against, for example bcinsider.azurecr.io. Leave empty to use Docker Hub. $(docker_registry)
            memory_gb: -1                         # Maximum memory in GB allocated to the container. Set to -1 for no memory limit. Increase this for large databases or memory-intensive BC operations. $(memory_gb)
            container_restart: no                 # Docker restart policy for the container. no means no automatic restart. on-failure restarts on non-zero exit. unless-stopped and always restart unconditionally. $(container_restart)
            licensefile:                          # Path or URL of the Business Central license file to import into the container on startup. Supports .flf and .bclicense formats. $(licensefile)
            docker_parameters:                    # Additional raw Docker run parameters to pass to the container startup command, one per line, for example --env MYVAR=value. $(docker_parameters)
            sql_server:                           # Hostname or IP address of an external SQL Server to use as the BC database server instead of the built-in SQL Express in the container. $(sql_server)
            sql_server_instance:                  # Named instance of the external SQL Server, for example MSSQLSERVER. Leave empty for the default instance. $(sql_server_instance)
            sql_database:                         # Name of the SQL database on the external SQL Server that Business Central will use. $(sql_database)
            sql_database_user:                    # User account on the external SQL Server that Business Central uses to connect to the database. $(sql_database_user)
            sql_database_user_password:           # Password for the external SQL Server user account. Store this in a pipeline secret variable. $(sql_database_user_password)
            sql_backup_file:                      # Path to a SQL Server .bak backup file to restore into the external SQL database on container startup. Use this to start BC with an existing database. $(sql_backup_file)
            encryption_key:                       # Encryption key used by the Business Central service tier for data encryption. Provide this when connecting to a pre-existing encrypted database. $(encryption_key)
            taskscheduler: Keep                   # Override the Task Scheduler state in Business Central. Keep preserves the image default. Enable starts the scheduler. Disable stops it, which is recommended for pipeline containers to prevent background jobs. $(taskscheduler)
            keyvault_pfxfile:                     # Path to a PFX file used to authenticate the BC service tier to Azure Key Vault for secret retrieval. $(keyvault_pfxfile)
            keyvault_pfxpassword:                 # Password for the Key Vault PFX file. Store this in a pipeline secret variable. $(keyvault_pfxpassword)
            keyvault_clientid:                    # Azure AD application (client) ID that Business Central uses to authenticate to Azure Key Vault. $(keyvault_clientid)
            keyvault_publisher_validation: False  # When enabled, Business Central validates that app publishers match the allowed list configured in Key Vault before granting secret access. $(keyvault_publisher_validation)
    ```
- ALOps Docker Wait
  * Wait until the Business Central container is started.
  * YAML Template: 
    ```yaml
        - task: ALOpsDockerWait@1
          displayName: 'ALOps Docker Wait'
          inputs:
            fixed_tag:                            # Fixed name tag of the Docker container to monitor. Must match the fixed_tag used when starting the container. $(fixed_tag)
            search_string: Ready for connections! # String to search for in the container log output. The task waits until this string appears, indicating that BC is ready. The default Ready for connections! is emitted by the BC server when startup completes. $(search_string)
            warning_string:                       # String to watch for in the container log. When found, the task logs a pipeline warning but continues. Useful for surfacing non-fatal startup issues. $(warning_string)
            error_string:                         # String to watch for in the container log. When found, the task fails immediately with an error. Use this to catch critical startup failures early. $(error_string)
            setup_working_folder: True            # Copy the local agent working folder into the container after BC is ready. Required when subsequent tasks inside the container need access to source files or artifacts. $(setup_working_folder)
            usecompression: True                  # Compress the working folder into a zip archive before transferring it into the container. Reduces transfer time for large source trees. $(usecompression)
            printlogs: True                       # Print all container log output to the pipeline log after the wait condition is met. Useful for auditing the BC startup sequence. $(printlogs)
            exclude_git_folder: False             # Exclude the .git folder when copying the working folder into the container. Reduces transfer size and avoids exposing repository metadata inside the container. $(exclude_git_folder)
    ```
- ALOps Extension API
  * Get/Publish extensions with the Business Central API.
  * YAML Template: 
    ```yaml
        - task: ALOpsExtensionAPI@1
          displayName: 'ALOps Extension API'
          inputs:
            usedocker: False                      # Run this task inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
            fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
            interaction: get                      # API operation to perform. get lists extensions currently installed on the environment. publish deploys a single .app file. batch deploys multiple .app files in dependency order. $(interaction)
            api_endpoint: https://api.businesscentral.dynamics.com/v2.0/$(azure_tenant_id)/Sandbox/api# Base URL of the Business Central API, for example https://api.businesscentral.dynamics.com/v2.0/{tenant}/Sandbox/api for SaaS or http://server:port/BC/api for on-premises. $(api_endpoint)
            dev_endpoint:                         # URL of the Business Central development endpoint used when deploying via the DEV port, for example http://server:7049/BC/dev. $(dev_endpoint)
            dev_schemeupdatemode: synchronize     # Schema update mode when publishing via the DEV endpoint. synchronize adds new schema objects. recreate drops and recreates tables. forcesync allows breaking changes. $(dev_schemeupdatemode)
            dev_dependencypublishingoption: none  # Dependency handling when publishing via the DEV endpoint. none skips dependencies. default resolves them automatically. ignore skips dependency checks. strict fails if any dependency is missing. $(dev_dependencypublishingoption)
            apiversion: v1.0                      # Version of the Business Central API to use. Supported values are beta, v1.0, and v2.0. Use v2.0 for access to schedule and schema sync mode features. $(apiversion)
            authentication: oauth                 # Authentication method for the API connection. oauth uses Azure AD service-to-service tokens (recommended for SaaS). basic and usernamepassword use user credentials. windows uses Windows integrated authentication. $(authentication)
            azure_tenant_id:                      # Azure Active Directory tenant ID (GUID or domain) of the Business Central SaaS tenant. $(azure_tenant_id)
            azure_app_client_id:                  # Application (client) ID of the Azure AD app registration used for OAuth authentication. $(azure_app_client_id)
            azure_app_client_secret:              # Client secret of the Azure AD app registration. Store this value in a pipeline secret variable or Azure Key Vault. $(azure_app_client_secret)
            azure_app_client_certificate:         # Path or base-64 encoded content of the certificate used instead of a client secret for Azure AD app authentication. $(azure_app_client_certificate)
            azure_app_client_certificate_password: # Password protecting the Azure AD client certificate. Store this in a pipeline secret variable. $(azure_app_client_certificate_password)
            username:                             # Business Central user account name for basic or usernamepassword authentication. Leave empty for Service-to-Service OAuth authentication. $(username)
            password:                             # Password for the Business Central user account. Leave empty for Service-to-Service authentication. Store this in a pipeline secret variable. $(password)
            bccompany:                            # Name or GUID of the Business Central company context for the API call. Leave empty to use the default company. $(bccompany)
            artifact_path: $(System.ArtifactsDirectory)# Folder containing the .app files to deploy. In multi-stage pipelines, use $(Pipeline.Workspace) to access artifacts from earlier stages. $(artifact_path)
            artifact_filter: *.app                # Glob filter applied inside artifact_path to select which .app files to deploy, for example *.app. $(artifact_filter)
            showdeploymentstatus: True            # When enabled, the task polls and displays the extension deployment status after publishing until the operation completes or times out. $(showdeploymentstatus)
            vsix_only: False                      # Use only the AL compiler VSIX for symbol resolution and skip BC artifact downloads. Enable this to speed up pipelines that do not need full BC artifact packages. $(vsix_only)
            checksecondsdelay: 30                 # Number of seconds to wait between polls when checking deployment status. Increase this for environments with slower deployment operations. $(checksecondsdelay)
            maxtries: 20                          # Maximum number of deployment status polls before the task times out. Multiply by checksecondsdelay for the total maximum wait time. $(maxtries)
            replacepackageid: False               # Generate a new package GUID for each deployment. This forces Business Central to treat each deploy as a fresh installation rather than an upgrade. $(replacepackageid)
            blocksymbolsonly: False               # When enabled, the task checks whether the .app is a symbols-only package and blocks deployment if it is, preventing accidental publishing of placeholder apps. $(blocksymbolsonly)
            schedule: current                     # Deployment schedule for the extension. current deploys immediately. nextminor schedules for the next minor BC update. nextmajor schedules for the next major update. Requires API version 2.0. $(schedule)
            schema_sync_mode: add                 # Schema synchronization mode for the extension deployment. add only adds new schema objects. forcesync allows breaking schema changes. Requires API version 2.0. $(schema_sync_mode)
            pwsh: False                           # Run the task using PowerShell Core (pwsh) instead of Windows PowerShell. Required on Linux-hosted build agents. $(pwsh)
    ```
- ALOps Import FOB
  * Import objects from .FOB file.
  * YAML Template: 
    ```yaml
        - task: ALOpsFobImport@1
          displayName: 'ALOps Import FOB'
          inputs:
            usedocker: False                      # Run the FOB import inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
            fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
            nav_serverinstance: BC140             # Name of the Business Central or NAV Server instance to import the FOB into, for example BC140 or DynamicsNAV110. $(nav_serverinstance)
            filePath:                             # Path to the FOB file to import. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(filePath)
            import_action: Default                # Action to take when an object from the FOB already exists in the database. Default uses the server default. Overwrite replaces the existing object. Skip leaves the existing object unchanged. $(import_action)
            synchronize_schema_changes: Yes       # Whether to synchronize schema changes after import. Yes applies pending schema changes safely. No defers synchronization. Force applies changes immediately, including destructive ones. $(synchronize_schema_changes)
            generate_symbol_reference: False      # Generate AL symbol references for the imported NAV objects. Required when the NAV objects need to be accessible from AL extensions. $(generate_symbol_reference)
            force_full_generate_symbol_reference: False# Force symbol reference generation for all objects in the database, not only the newly imported ones. Use this after a bulk import to ensure all symbols are up to date. $(force_full_generate_symbol_reference)
            override_finsql_path:                 # Override the automatic detection of finsql.exe with a hard-coded path. Use this when the executable is not in the standard installation location. $(override_finsql_path)
    ```
- ALOps Info
  * Print information about ALOps and executing host.
  * YAML Template: 
    ```yaml
        - task: ALOpsInfo@1
          displayName: 'ALOps Info'
          inputs:
            scanforsymbolonlyapps: Disabled       # Scan build artifacts for symbols-only .app packages. Disabled skips the check. Warn reports a pipeline warning when symbols-only apps are found. Error fails the task, preventing accidental deployment of symbols-only placeholders. $(scanforsymbolonlyapps)
            pwsh: False                           # Run the task using PowerShell Core (pwsh) instead of Windows PowerShell. Required on Linux-hosted build agents. $(pwsh)
    ```
- ALOps License Import
  * Import Business Central license (.flf).
  * YAML Template: 
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
- ALOps Nuget Download
  * Download BC Apps from Nuget.
  * YAML Template: 
    ```yaml
        - task: ALOpsNugetDownload@1
          displayName: 'ALOps Nuget Download'
          inputs:
            nuget_username:                       # Username for authenticating to the NuGet feed. Leave empty for public feeds or when using only an API key. $(nuget_username)
            nuget_password:                       # Password or personal access token for authenticating to the NuGet feed. Store this in a pipeline secret variable. $(nuget_password)
            nuget_source_apikey:                  # API key for authenticating to the NuGet source. Used instead of username and password for API key-authenticated feeds. $(nuget_source_apikey)
            nuget_spec_file: $(System.DefaultWorkingDirectory)\nuget.json# Path to the JSON specification file that lists the NuGet packages and versions to download. Defaults to nuget.json in the working directory. $(nuget_spec_file)
            nuget_select_type_filter:             # Filter applied to the NuGet package type when resolving packages. Leave empty to include all package types. $(nuget_select_type_filter)
            download_folder: $(System.ArtifactsDirectory)# Target folder where downloaded NuGet packages are extracted. Supports pipeline variables such as $(System.ArtifactsDirectory). $(download_folder)
            artifact_folder_name: Nuget           # Name of the Azure DevOps artifact folder where the resolved.json dependency manifest is uploaded after the download. $(artifact_folder_name)
            dependency_publisher_filter:          # Semicolon-separated list of app publisher names whose dependency packages should be resolved and downloaded. Set to NONE to skip all dependency resolution. $(dependency_publisher_filter)
            skip_microsoft_apps: True             # When enabled, NuGet packages published by Microsoft are excluded from the download. Useful when Microsoft apps are already available from a local symbol server. $(skip_microsoft_apps)
            pwsh: False                           # Run the task using PowerShell Core (pwsh) instead of Windows PowerShell. Required on Linux-hosted build agents. $(pwsh)
    ```
- ALOps Nuget Publish
  * Publish BC Apps to Nuget.
  * YAML Template: 
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
- ALOps OpenAPI
  * Generate OpenAPI descriptions from Business Central API's.
  * YAML Template: 
    ```yaml
        - task: ALOpsOpenAPI@1
          displayName: 'ALOps OpenAPI'
          inputs:
            usedocker: False                      # Run the OpenAPI generation inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
            fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
            api_endpoint: https://api.businesscentral.dynamics.com/v2.0/$(azure_tenant_id)/Sandbox/api# Base URL of the Business Central API to generate OpenAPI specifications from, for example https://api.businesscentral.dynamics.com/v2.0/{tenant}/Sandbox/api. $(api_endpoint)
            authentication: oauth                 # Authentication method for the Business Central API connection. oauth uses Azure AD tokens (recommended for SaaS). basic and usernamepassword use user credentials. windows uses Windows integrated authentication. $(authentication)
            azure_tenant_id:                      # Azure Active Directory tenant ID (GUID or domain) of the Business Central SaaS tenant. $(azure_tenant_id)
            azure_app_client_id:                  # Application (client) ID of the Azure AD app registration used for OAuth authentication. $(azure_app_client_id)
            azure_app_client_secret:              # Client secret of the Azure AD app registration. Store this value in a pipeline secret variable or Azure Key Vault. $(azure_app_client_secret)
            azure_app_client_certificate:         # Path or base-64 encoded content of the certificate used instead of a client secret for Azure AD app authentication. $(azure_app_client_certificate)
            azure_app_client_certificate_password: # Password protecting the Azure AD client certificate. Store this in a pipeline secret variable. $(azure_app_client_certificate_password)
            username:                             # Business Central user account name for basic or usernamepassword authentication. Leave empty for OAuth Service-to-Service. $(username)
            password:                             # Password for the Business Central user account. Leave empty for OAuth authentication. Store this in a pipeline secret variable. $(password)
            publish_artifacts: True               # Upload the generated OpenAPI specification files as build artifacts in Azure DevOps. $(publish_artifacts)
            discover: True                        # When enabled, the task automatically discovers all available API routes from the endpoint. When disabled, only the routes listed in api_routes are processed. $(discover)
            api_routes:                           # One API route per line (or separated by a pipe character) to convert to OpenAPI. Used when discover is disabled. $(api_routes)
            api_exclude_routes:                   # One API route per line (or separated by a pipe character) to exclude from automatic discovery. Used when discover is enabled. $(api_exclude_routes)
            inspect_paths: False                  # When enabled, print all discovered API paths for each route to the pipeline log. Useful for auditing the available API surface. $(inspect_paths)
            api_servers:                          # One server URL per line (or separated by a pipe character) to include in the OpenAPI servers list, describing where the API is hosted. $(api_servers)
            export_edmx: False                    # Export the raw EDMX metadata document retrieved from the Business Central API alongside the OpenAPI specification. $(export_edmx)
            export_yaml: True                     # Export the OpenAPI specification in YAML format (.yaml). YAML is the default format and is widely supported by API tooling. $(export_yaml)
            export_json: False                    # Export the OpenAPI specification in JSON format (.json) in addition to or instead of YAML. $(export_json)
            exclude_company_paths: False          # Exclude company-scoped API paths (paths containing /companies({companyId})/) from the generated specification. Useful when generating a simplified specification for single-company scenarios. $(exclude_company_paths)
    ```
- ALOps Package Import
  * Import and Process RapidStart/Configuration Package
  * YAML Template: 
    ```yaml
        - task: ALOpsPackageImport@1
          displayName: 'ALOps Package Import'
          inputs:
            usedocker: True                       # Run the RapidStart package import inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
            fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
            company_name:                         # Name of the Business Central company into which the RapidStart configuration package will be imported. Must exactly match the company name as it appears in Business Central. $(company_name)
    ```
- ALOps App Publish
  * Publish Business Central extension to service tier.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppPublish@1
          displayName: 'ALOps App Publish'
          inputs:
            usedocker: False                      # Run this task inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
            fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
            installpublishedapps: True            # After publishing, automatically install all published apps so they become active in the Business Central tenant. $(installpublishedapps)
            installaltesttool: False              # Install the AL Test Tool and associated test libraries required for running BC unit tests on version 15 and later. $(installaltesttool)
            install_al_app_names: Tests-TestLibraries
    System Application Test
    System Application Test Library
    Any
    Library Assert
    Test Runner
    # Line-separated list of AL test library app names to install together with the AL Test Tool. Only used when installaltesttool is enabled. $(install_al_app_names)
            strictappnames: False                 # When enabled, only the apps explicitly listed in install_al_app_names are installed. All other apps are skipped, even if they are available. $(strictappnames)
            nav_serverinstance: BC140             # Name of the Business Central Server instance to publish to, for example BC140 or BC230. $(nav_serverinstance)
            artifact_path:                        # Folder containing the .app files to publish. Leave empty to use the artifact staging directory. $(artifact_path)
            nav_artifact_app_filter: *.app        # Glob filter applied inside artifact_path to select which .app files to publish, for example *.app. $(nav_artifact_app_filter)
            skip_verification: True               # Skip Authenticode code-signing verification of the .app file before publishing. Enable this when publishing unsigned development builds. $(skip_verification)
            forceinstall: False                   # Always reinstall apps regardless of whether they are already installed at the same version. Useful for forcing a clean state. $(forceinstall)
            forcesync: False                      # Set the schema sync mode to Force when publishing, enabling breaking schema changes such as removing fields or tables. $(forcesync)
            publish_scope: Global                 # Scope at which the extension is published. Global makes the app available to all tenants on the server. Tenant restricts it to a specific tenant. $(publish_scope)
            tenant: default                       # Tenant ID to publish to when publish_scope is set to Tenant. $(tenant)
            batch_publish_folder:                 # Folder containing multiple .app files to publish in a single batch operation. All matching apps in this folder are published in dependency order. $(batch_publish_folder)
            publisherazureactivedirectorytenantid: # Azure AD tenant ID of the app publisher. Required for apps that use per-tenant authorization in Business Central online. $(publisherazureactivedirectorytenantid)
            blocksymbolsonly: False               # When enabled, the task checks whether the app is a symbols-only package and blocks publishing if it is, preventing accidental deployment of placeholder apps. $(blocksymbolsonly)
            pwsh: False                           # Run the task using PowerShell Core (pwsh) instead of Windows PowerShell. Required on Linux-hosted build agents. $(pwsh)
    ```
- ALOps Repository Publish Extension
  * Publish extension to ALOps Repository.
  * YAML Template: 
    ```yaml
        - task: ALOpsRepositoryPublish@1
          displayName: 'ALOps Repository Publish Extension'
          inputs:
            usedocker: False                      # Run the repository publish inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
            fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
            alops_repository_endpoint: api.businesscentral.dynamics.com# Hostname of the ALOps Repository API endpoint, for example api.businesscentral.dynamics.com. Used as the base address for all API calls. $(alops_repository_endpoint)
            alops_repository_username:            # Username for authenticating to the ALOps Repository API endpoint. $(alops_repository_username)
            alops_repository_password:            # Password for the ALOps Repository API endpoint user. Store this in a pipeline secret variable. $(alops_repository_password)
            artifact_path:                        # Folder containing the .app files to publish to the ALOps Repository. Supports pipeline variables such as $(System.ArtifactsDirectory). $(artifact_path)
            app_artifact_filter: *.app            # Glob filter applied inside artifact_path to select which .app files to publish, for example *.app. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(app_artifact_filter)
            upload_c_applications: False          # When enabled, upload the applications from the Business Central Applications folder inside the container to the repository. Only available when usedocker is enabled. $(upload_c_applications)
            pwsh: False                           # Run the task using PowerShell Core (pwsh) instead of Windows PowerShell. Required on Linux-hosted build agents. $(pwsh)
    ```
- ALOps SaaS Get Extensions
  * Replaced by Task [ALOps Extension API]
  * YAML Template: 
    ```yaml
        - task: ALOpsSaaSGetExtensions@1
          displayName: 'ALOps SaaS Get Extensions'
          inputs:
            azure_api_endpoint: api.businesscentral.dynamics.com# Deprecated: use the ALOps Extension API task instead. Hostname of the Business Central API endpoint, for example api.businesscentral.dynamics.com. $(azure_api_endpoint)
            azure_api_version: v2.0               # Deprecated: use the ALOps Extension API task instead. Version of the Business Central API to call. $(azure_api_version)
            azure_tenant_id:                      # Deprecated: use the ALOps Extension API task instead. Azure Active Directory tenant ID of the Business Central SaaS tenant. $(azure_tenant_id)
            azure_app_client_id:                  # Deprecated: use the ALOps Extension API task instead. Application (client) ID of the Azure AD app registration used for authentication. $(azure_app_client_id)
            azure_app_client_secret:              # Deprecated: use the ALOps Extension API task instead. Client secret of the Azure AD app registration. Store this in a pipeline secret variable. $(azure_app_client_secret)
            bc_impersonate_user:                  # Deprecated: use the ALOps Extension API task instead. Business Central user account to impersonate when calling the API. $(bc_impersonate_user)
            bc_impersonate_password:              # Deprecated: use the ALOps Extension API task instead. Password of the Business Central user to impersonate. Store this in a pipeline secret variable. $(bc_impersonate_password)
            bc_environment: sandbox               # Deprecated: use the ALOps Extension API task instead. Name of the Business Central environment to query extensions from, for example Sandbox or Production. $(bc_environment)
            bc_companyname:                       # Deprecated: use the ALOps Extension API task instead. Name of the Business Central company scope for the API request. $(bc_companyname)
    ```
- ALOps SaaS Publish Extension
  * Replaced by Task [ALOps Extension API]
  * YAML Template: 
    ```yaml
        - task: ALOpsSaaSPublishExtension@1
          displayName: 'ALOps SaaS Publish Extension'
          inputs:
            azure_api_endpoint: api.businesscentral.dynamics.com# Deprecated: use the ALOps Extension API task instead. Hostname of the Business Central API endpoint, for example api.businesscentral.dynamics.com. $(azure_api_endpoint)
            azure_api_version: v2.0               # Deprecated: use the ALOps Extension API task instead. Version of the Business Central API to call. $(azure_api_version)
            azure_tenant_id:                      # Deprecated: use the ALOps Extension API task instead. Azure Active Directory tenant ID of the Business Central SaaS tenant. $(azure_tenant_id)
            azure_app_client_id:                  # Deprecated: use the ALOps Extension API task instead. Application (client) ID of the Azure AD app registration used for authentication. $(azure_app_client_id)
            azure_app_client_secret:              # Deprecated: use the ALOps Extension API task instead. Client secret of the Azure AD app registration. Store this in a pipeline secret variable. $(azure_app_client_secret)
            bc_impersonate_user:                  # Deprecated: use the ALOps Extension API task instead. Business Central user account to impersonate when calling the API. $(bc_impersonate_user)
            bc_impersonate_password:              # Deprecated: use the ALOps Extension API task instead. Password of the Business Central user to impersonate. Store this in a pipeline secret variable. $(bc_impersonate_password)
            bc_environment: sandbox               # Deprecated: use the ALOps Extension API task instead. Name of the Business Central environment to publish the extension to, for example Sandbox or Production. $(bc_environment)
            bc_companyname:                       # Deprecated: use the ALOps Extension API task instead. Name of the Business Central company scope for the API request. $(bc_companyname)
            artifact_path:                        # Deprecated: use the ALOps Extension API task instead. Folder containing the .app file to publish. $(artifact_path)
            app_artifact_filter: *.app            # Deprecated: use the ALOps Extension API task instead. Glob filter to select the .app file to publish from artifact_path. $(app_artifact_filter)
    ```

