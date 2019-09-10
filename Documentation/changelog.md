# Change Log
All notable changes to the "ALOps" extension.

## [v1.423] - 2019-07-14
- ALOpsAppSign: Add 'timestamp_uri' string parameter  to specify which timestamp server to use.
- ALOpsAppSign: Check Timestamp  server if specified, trigger warning when offline.
- ALOpsLicenseImport: enabled FLF import from DockerHost and Repository location.
- ALOpsSaaSGetExtensions: Add 'azure_api_endpoint' string parameter to overrule API Endpoint.
- ALOpsSaaSGetExtensions: Add 'azure_api_version' picklist parameter to specify Azure API Version to use.
- ALOpsSaaSGetExtensions: Add 'bc_companyname'  string parameter to  specify target company.
- ALOpsSaaSPublishExtension: Add  'azure_api_endpoint' string parameter to overrule API Endpoint.
- ALOpsSaaSPublishExtension: Add 'azure_api_version' picklist parameter to specify Azure API Version to use.
- ALOpsSaaSPublishExtension: Add 'bc_companyname'  string parameter to  specify target company.
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

