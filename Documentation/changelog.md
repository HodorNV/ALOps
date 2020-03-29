# Change Log
All notable changes to the "ALOps" extension.

## [v1.428] - 2020-03-29
- ALOpsAppCompiler: compatibility with propagated dependencies
- ALOpsAppCompiler: improved direction of ALC.EXE output
- ALOpsAppCompiler: replace invalid path characters with underscore in App-Filename
- ALOpsAppTest: improved stability for BC15 / upgraded to work with BC16
- ALOpsDockerStart: auto split parameter [docker_parameters] so it can be set via Variables
- ALOpsDockerStart: parameter [vsix_download_path] enabled for use in docker containers
- ALOpsDockerWait: default behaviour changed, workfolder is now copied to the container on the WAIT step
- ALOpsFobImport: fixed empty "servername" parameter, improved GenerateSymbolReferences
- ALOpsFobImport: Generating symbol references can be enabled/disable with parameter [generate_symbol_reference]
- ALOpsFobImport: improved FinSql execution and error catching
- ALopsImportPackage: added parameter 'fixed_tag' for use with Docker
- ALOpsInfo: print extra information for debugging: diskspace, windows version, updates, memory stats...
- ALOpsLicenseImport: the scope of the license import can be set with parameter [license_scope]

## [v1.427] - 2020-01-25
- ALOpsAppClean: detect ServerInstance on custom Docker images
- ALOpsAppCompile: Allow to retain version parts from app.json. '*' is replaced by the build-id, '?' specifies to retain the version part of the orriginal app.json
- ALOpsAppCompile: Allow to update build number in DevOps
- ALOpsAppCompile: check docker info credentials
- ALOpsAppCompile: Multiroot workspace support
- ALOpsAppCompiler: Remove params [AssemblyProbingPaths] and [Ruleset] for NAV2018
- ALOpsAppPublish: new parameter [batch_publish_folder] which allows for batch publishing of Apps, install order is automatically detected
- ALOpsAppPublish: Set Path Variable
- ALOpsAppRuntimePackage: New task for creating runtime packages from existing Apps
- ALOpsAppSign: added instant validation of app after signing / Improved validation of timestamp
- ALOpsAppSign: Added parameter [pfx_password] for setting password additional to the environment variable 
- ALOpsDockerStart: allow login with Keyvault instead of ServiceConnection
- ALOpsDockerWait: Added parameter [error_string] which allow to set an extra exit condition
- ALOpsLicenseImport: Disable print License by default, license can be printed in the pipeline by setting parameter [print_license_info]
- Documentation: added pipeline examples in documentation section
- General: Allow for Host/Container memory monitoring
- General: Improved Json Importing, printout json on parse failure
- General: task output of all task cleaned up / bulk logging transferred to verbose

## [v1.426] - 2019-11-30
- ALOpsAppCompile: Additional AssemblyProbingPaths via discovery
- ALOpsAppPublish: Allow for default AL Application installed in docker containers
- ALOpsAppTest: Allow selecting TestSuite via parameter [testsuite]
- ALOpsRepositoryPublish: added default icon for Apps without icon

## [v1.425] - 2019-10-15
- ALOpsAppCompile/ALOpsAppSign: new parameter [publish_artifact] to disable artifact publishing from step
- ALOpsAppCompile: Allow to set filename suffix
- ALOpsAppCompile: clean empty entries from Compile log artifact
- ALOpsAppPublish: Dynamic Resolving of App Artifacts / new parameter [artifact_path]
- ALOpsAppPublish: Install-AL-Apps for docker /  extra parameter [installaltesttool] en [install_al_app_names]
- ALOpsAppSign: Docker: Replace local artifact from container
- ALOpsAppSign: Dynamic Resolving of App Artifacts / new parameter [artifact_path]
- ALOpsAppSign: set Error instead of warning on DNSResolve
- ALOpsAppSignVerify: Dynamic Resolving of App Artifacts / new parameter [artifact_path]
- ALOpsAppTest: Wave2 compatibel, new parameters [testpage] en [installaltesttool]
- ALOpsDockerExec: new tasks that allows for running powershell scripts on the container
- ALOpsDockerStart: Catch error on Docker login

- ALOpsDockerStart: parameter to ignore warning with fixed_tag
- ALOpsImportFob: Dynamicly resolve .psm1 file, bypass via finsql for non standard installations
- ALOpsRepositoryPublish: Dynamic Resolving of App Artifacts / new parameter [artifact_path]
- ALOpsRepositoryPublish: New task in beta, allows publishing of the Extension to a repository in Business Central
- ALOpsSaaSPublishExtension: Allow folder upload of docker Applications for and PackageCache, new parameters [upload_package_cache] and [upload_c_applications]
- ALOpsSaaSPublishExtension: Dynamic Resolving of App Artifacts / new parameter [artifact_path]
- ALOpsSaaSPublishExtension: monitor/report deployment status
- Multi stage pipeline support

## [v1.424] - 2019-09-17
- ALOpsAppCompiler: Now allows for dynamic resolving of "vsix_download_path", wildcards can be used.
- ALOpsAppPublish: dynamic resolving of "nav_artifact_app_filter", wildcards can be used.
- ALOpsAppSign: dynamic resolving of "nav_artifact_app_filter", wildcards can be used.
- ALOpsAppSignVerify: dynamic resolving of "nav_artifact_app_filter", wildcards can be used.
- ALOpsAppTest: extend authentication to cover all scenarios
- ALOpsAppTest: update routines from NavContainerHelper
- ALOpsDockerStart: improvements made for compatibility for in use in Release Flows
- ALOpsSaaSPublishExtension: dynamic resolving of "nav_artifact_app_filter", wildcards can be used.

## [v1.423] - 2019-08-30
- ALOpsAppCompiler: Add 'bc_username' and 'bc_password' parameters  to  allow  basic authentication
- ALOpsAppSign: Add 'timestamp_uri' string parameter  to specify which timestamp server to use.
- ALOpsAppSign: Check Timestamp  server if specified, trigger warning when offline.
- ALOpsAppTest: Add 'bc_username' and 'bc_password' parameters  to  allow  basic authentication
- ALOpsLicenseImport: enabled FLF import from DockerHost and Repository location.
- ALOpsSaaSGetExtensions: Add 'azure_api_endpoint' string parameter to overrule API Endpoint.
- ALOpsSaaSGetExtensions: Add 'azure_api_version' picklist parameter to specify Azure API Version to use.
- ALOpsSaaSGetExtensions: Add 'bc_companyname'  string parameter to  specify target company.
- ALOpsSaaSPublishExtension: Add  'azure_api_endpoint' string parameter to overrule API Endpoint.
- ALOpsSaaSPublishExtension: Add 'azure_api_version' picklist parameter to specify Azure API Version to use.
- ALOpsSaaSPublishExtension: Add 'bc_companyname'  string parameter to  specify target company.
- ALOpsSaaSPublishExtension: Added retry loop on status check
- Docker: Retrieve ServerInstanceName from configuration for Wave2 compatibility.
- Improved Docker-Session management with Auto-Retry and Broken Connection detection.
- Improved the HelpMarkDown of all ALOps task inputs, variable names cleary visible in help.

## [v1.422] - 2019-07-10
- ALOpsAppClean: added missing dependency to 'Get-NAVAppDependencies'
- ALOpsAppCompiler: Extended AssemblyProbingPaths with "c:\windows\assembly"
- ALOpsAppTest: Add 'failed_test_action' picklist parameter. define action (Ignore / Warning / Error) to take when a Test(s) fails
- ALOpsDockerRemove: containers exited with errors are also removed instead of skipped
- ALOpsDockerWait: detect when container exited on error and fail build
- ALOpsSaaSPublishExtension: new Task in preview mode. Publish an AL extension to Business Central SaaS
- Framework: Update VstsTaskSDK from v0.10 to v0.11
- New environment boolean variable 'Alops_PrintMemoryStats', when enabled print the current memory status at the beginning of every task
- Print execution of external executables/commands to the devops build log
- Random Vsts Task Freezes: deadlocks in the StandardOutput and StandardError stream processing of the DevOps Agent / Mitigated by force closing the environment

## [v1.421] - 2019-06-25
- All PS1 files are CodeSigned for beter compatibility with standard powershell restrictions
- ALOpsAppClean: Add 'sync_mode' picklist parameter (Add/Clean/Development/ForceSync)
- ALOpsAppClean: enable for use in docker containers, use_docker parameter
- ALOpsAppTest: DisableNameChecking when importing Microsoft.Dynamics.Nav.Ide to avoid false warnings in pipeline
- ALOpsDockerRemove: added boolean parameter 'print_logs', default enabled. Prints logs on container remove.
- ALOpsDockerStart: Add -ltsc2019 or -ltsc2016 to Docker Image depending on OS
- ALOpsDockerStart: added parameter 'encryption_key', link a secret downloadable Url of the Encryption Key.
- ALOpsDockerStart: container can now be connected to Azure SQL Database
- ALOpsDockerStart: container can now be started based on a SQL BAK file via parameter 'sql_backup_file'
- ALOpsDockerStart: new default value for memory_gb parameter = '-1' (unlimited memory)
- ALOpsDockerStart: Print all docker parameters used for RUN command
- ALOpsFobImport: Added parameter for NAV Server Instance name
- ALOpsFobImport: allow for multiple FOB files to be imported in a single step, parameter 'filePath' can contain a filter like '.fob/*.fob'
- ALOpsFobImport: DisableNameChecking when importing Microsoft.Dynamics.Nav.Ide to avoid false warnings in pipeline
- ALOpsFobImport: integrate SQL-Database authentication for SQL mixed mode or Azure SQL
- ALOpsLicenseImport: Print flf license information before import
- ALOpsSaaSGetExtensions: new Task in preview mode, first of the SaaS enabled tasks. Displays the extensions installed in Business Central SaaS
- Templates: Corrected the version on the PublishTestResults step to Version 2, PublishTestResults@2

## [v1.420] - 2019-06-17
- Added YAML templates for AL Projects: https://dev.azure.com/HodorNV/ALOps%20Templates
- ALOpsAppCompiler: Added boolean parameter 'download_test_symbols' for enabling explicit Test-Package download
- ALOpsAppCompiler: Added parameter 'al_analyzer', a comma separated list of Analyzers. Example: PerTenantExtensionCop,UICop,CodeCop
- ALOpsAppCompiler: Automatically add AssemblyProbingPath if projects contains external controls
- ALOpsAppSign: The PFX password should be linked to the environment variable 'pfx_password'
- ALOpsAppTest: added Auto-Retry on the "Warm-up" step for the Test-Client
- ALOpsAppTest: Added boolean parameter 'import_testtoolkit', can be used to skip the import of the default test-suite-objects.
- ALOpsDockerStart: Added multi-line parameter 'docker_parameters', these will be added to the [docker run] command
- ALOpsDockerStart: Removed 'No container found' message when not working with Fixed-Docker-Tags

