# Change Log
All notable changes to the "ALOps" extension.

## [v1.458] - 2023-07-26
- All Tasks: added "HelpMarkDown" for all parameters, improved documentation
- All Tasks: Global Parameter [alops_disable_buildtags] for disabling build tags
- ALOpsAdminCenterAPI: Auto update AppSourceApps in BC SaaS Environment
- ALOpsAppCompile@2: Improved handling of Invalid Characters in naming
- ALOpsAppPublish: Improved handling of Invalid Characters in naming
- ALOpsAppTest: Validation check on existings test, fail pipeline if no tests

## [v1.457] - 2023-06-17
- ALOpsAppCompile: better error handling Get-ArtifactUrl, next-major catch during release
- ALOpsAppCompile: extra parameter ArtifactUrl overrule
- ALOpsAppCompile: improved error handling
- ALOpsAppCompile@1/@2: Download Artifact url once, improved performance

## [v1.455] - 2023-03-18
- All Tasks: BC v22 compatibility
- All Tasks: Bump BcContainerHelper to latest version v4.0.14
- ALOpsAppCompile @1/@2: Added parameter for enabling "External Rulesets "
- ALOpsAppCompile: Custom Linter json
- ALOpsAppLicenseCheck: Solved bug with Permissions masks for BCLicense files
- ALOpsAppTest: fixed ability to set filter on TestCodeunits to run
- ALOpsAppValidation: Increase logging on License import

## [v1.454] - 2022-11-29
- All tasks: optimized loading of NAV Management DLLs and other modules
- ALOpsAppCompile: Added string parameter 'ignorepragmas', when not blank ignores all PRAMA's set in code.
- ALOpsAppCompile: Optimised Get-ArfitactUrl, runs only once per task.
- ALOpsAppCompile@1: Added 'AppId' for App-Downloading from NST, proper name/publisher resolve.
- ALOpsAppLicenseCheck: Can parse .bclicense files now, .flf files can still be used.
- ALOpsAppPublish: New parameter [blocksymbolsonly] with default 'true'. Check for SymbolsOnly app before publish.
- ALOpsDockerRemove: fixed some parameters not visible in visual editor
- ALOpsExtensionAPI: New parameter [blocksymbolsonly] with default 'true'. Check for SymbolsOnly app before publish.
- ALOpsOpenAPI: When parameter "exclude_company_paths" is set to 'true', Company specific paths are removed. Default Company can be set via Authentication (Header)

## [v1.454] - 2022-11-29
- All tasks: optimized loading of NAV Management DLLs and other modules
- ALOpsAppCompile: Added string parameter 'ignorepragmas', when not blank ignores all PRAMA's set in code.
- ALOpsAppCompile: Optimised Get-ArfitactUrl, runs only once per task.
- ALOpsAppCompile@1: Added 'AppId' for App-Downloading from NST, proper name/publisher resolve.
- ALOpsAppLicenseCheck: Can parse .bclicense files now, .flf files can still be used.
- ALOpsAppPublish: New parameter [blocksymbolsonly] with default 'true'. Check for SymbolsOnly app before publish.
- ALOpsDockerRemove: fixed some parameters not visible in visual editor
- ALOpsExtensionAPI: New parameter [blocksymbolsonly] with default 'true'. Check for SymbolsOnly app before publish.
- ALOpsOpenAPI: When parameter "exclude_company_paths" is set to 'true', Company specific paths are removed. Default Company can be set via Authentication (Header)

## [v1.453] - 2022-10-12
- ALOpsAppCompile: Expand appversiontemplate with Major/Minor application from app.json. (* = Build Nr / ? = Original Version / A = Application Version)
- ALOpsAppCompile: override global preprocessor symbols in app
- ALOpsAppCompile: Remove internalsVisibleTo property from app.json
- ALOpsAppPublish: Improved Get-AppOrder based on AppID
- ALOpsExtensionAPI: Added SchemaSyncMode option
- ALOpsExtensionAPI: Ignore Server 503 error when checking status
- General: improved generic assembly loading

## [v1.451] - 2022-07-30
- ALOpsAppLicenseCheck: Validate App(s) against License
- ALOpsAppPublish:  Sync-CheckOnly before Publish / Breaking Change detection
- ALOpsExtensionAPI: Added Client Certificate Authentication 
- ALOpsExtensionAPI: DEV-Port Deploy enabled by specifying the additional parameter [dev_endpoint]
- ALOpsOpenAPI: Added Client Certificate Authentication 

## [v1.450] - 2022-07-03
- ALOpsAppCompile: Custom CodeCop libraries 
- ALOpsAppCompile: Optimize Get Latest VSIX
- ALOpsAppcompile: Use 64bit ALC.EXE when available
- ALOpsAppPublish: Allow publishing same version of an App
- ALOpsAppPublish: Increased default delays and retry count
- ALOpsAppTest: bugfix, set authentication to AAD instead of AccessControlService
- ALOpsAppTest: Testrunner Codeunit can be set with parameter [testrunnercodeunitid]
- ALOpsOpenAPI: Major performance improvents

## [v1.449] - 2022-05-18
- ALOpsAgentMaintenance: New parameter boolean 'pruneimagesosbased', allows for cleanup of images based on old OS
- ALOpsAppCompiler: Extra parameter 'suppressWarnings' allows for overwriting in the app.json. Options: "KEEP","NONE", "<Array of exclusions>"
- ALOpsAppCompiler@2: Improved Assembly resolve, fixes the missing "System.Collections.Immutable" reference
- ALOpsAppCompiler@2: Ruleset not being applied when settings.json is missing
- ALOpsDockerCreate: OS Detection for Windows Server 2019 (2022)
- ALOpsExtensionAPI: More Resilient on Deployment, delay and max retries can be configured with [checksecondsdelay] and [maxtries]
- ALOpsInfo: Add feature to detect highest used Application version in any "App.json" file, saved in variable "ALOPS_APPLICATION_VERSION", "ALOPS_APPLICATION_VERSION_MAJOR", "ALOPS_APPLICATION_VERSION_MINOR"


## [v1.448] - 2022-04-21
- ALOpsInfo: Add feature to detect highest used Application version in any "App.json" file, saved in variable "ALOPS_APPLICATION_VERSION"
- ALOpsOpenAPI: Generate OpenAPI (Swagger) documentation based on Business Central API's

## [v1.447] - 2022-01-24
- ALOpsAppCompile: Allow values TRUE/FALSE for setting ResourceExposurePolicy
- ALOpsAppCompile: bugfix concerning disabling parallel compile
- ALOpsAppCompile: build in compatibility with applicationInsightsConnectionString 
- ALOpsAppCompile: ignore Resourceexposurepolicy on runtime <= 8.0

## [v1.446] - 2021-11-25
- ALOpsAppCompile (v1/v2):  Latest VSIX can be used by specifing "LATEST" in the alternative_vsix_path
- ALOpsAppCompile: Disable MAXDEGREEOFPARALELISM when 'Alops_DisableParallelCompile' is enabled
- ALOpsAppCompile: ResourceExposurePolicy - Auto remove ShowMyCode
- ALOpsAppCompile: Weeknumber correction, Activates on 1/1/2022
- ALOpsAppCompiler@2 - Provide support for resourceExposurePolicy
- ALOpsAppSign: improved NavSip setup for Azure Devops Hosted Agents
- ALOpsDockerCreate: catch pull failure for remote repositories with login
- ALOpsDockerStart: Map parameter for TaskScheduler
- ALOpsExtensionAPI: Error-handling on failure
- ALOpsExtensionAPI: improved failure detection, exit on timeout

## [v1.445] - 2021-09-09
- ALOpsAgentMaintenance: Additional cleanup of temporary folder with format ????????.??? 
- ALOpsAppCompile: ignore download previous if AppSourceCop is not enabled
- ALOpsAppCompile: Parallel compile can now be disabled using boolean Environment Variable [Alops_DisableParallelCompile]
- ALOpsAppCompile: Solved locking issue on VSIX extract
- ALOpsCompile: Print full ALC output on failure exitcode

## [v1.444] - 2021-07-05
- All Tasks: The Artifact Publish Folder for DevOps can be manipulated via Environment variable [Alops_ArtifactPublishFolder], defaults is [Dynamics 365]
- ALOpsAppCompile: Improved parsing of BC Compile logs
- ALOpsAppCompile: Ruleset patch matching with DefaultWorkingDirectory
- ALOpsAppCompiler@2: Added [updatebuildnumber] conform v1. Updates the Build number with the App version in the pipeline.
- ALOpsAppPublish: Implemented auto Uninstall of Apps when "Force Sync" is used
- ALOpsAppSign: Can batch sign Apps compiled with ALOpsAppCompiler, use parameter [batchsigncompiledapps] to enabled
- ALOpsAppValidation: Get countries from AppSourceCop.json is parameter [countries] is empty/blank
- ALOpsDockerStart: Added [license] parameter, works with local path or Url
- ALOpsDockerStart: Improved Copy-Addins method for larger Add-ins, fixed the PermissionDenied exception.

## [v1.443] - 2021-06-07
- All Tasks: Fixed BC-Management module loading compatibility with BC v19
- ALOpsAgentMaintenance: Prune images based on CreationDate
- ALOpsAgentMaintenance: Remove VSIX folder when no platform of localised folders exists
- ALOpsAppCompiler@v1: Backported "AL_Analyzer=NONE" to disable analyzers
- ALOpsAppCompiler@v1: Backported "publishxlif" functionality from v2
- ALOpsAppTest: Increased interaction timeout, allowing for long running tests
- ALOpsDockerStart: "docker_pull" automatically disablen when using ALOpsDockerCreate images
- ALOpsDockerStart: Multiple Add-In DLL versions can now be used in parallell. Duplicate folder names are renamed.

## [v1.442] - 2021-05-01
- ALOpsAgentMaintenance: New integer parameter [pruneimagesdayscreated], when not zero Images are pruned based on creationdate
- ALOpsAppCompile: BC ServiceTier folder added in AssemblyProbingPaths
- ALOpsAppCompile: Global warnings and errors are now catched from ALC output
- ALOpsAppCompile: New boolean parameter [output_alc_logs] for disabling printing the ALC logs
- ALOpsAppCompile: New multiline parameter for specifying additional AssemblyProbingPaths, comma seperated string can also be used 
- ALOpsAppValidation: Added parameters for specifying InstallApps and PreviousApps

## [v1.441] - 2021-04-13
- All Tasks : Disable script scanning for AV/Defender
- All Tasks: Fail Azure DevOps task on failed exit
- All Tasks: improved copy-item with literal path's, special character compatibility
- All Tasks: Improved performance for Expand-Archive with System.IO.Compression
- All Tasks: Improved powershell modules, Azure DevOps Diagnostics mode can be used
- ALOpsAppCompile: Detect ruleset feature, ignore when not available in ALC.EXE
- ALOpsAppCompile: Improved output parsing and Line detection
- ALOpsAppCompile: New parameter [applicationinsightskey] for registering ApplicationInsights
- ALOpsAppCompile: Print resulting app.json, allows for easy debugging
- ALOpsAppSignVerify: improved Path resolving of artifacts
- ALOpsAppTest:  Implemented [ExtensionID] based test-running
- ALOpsAppTest: Configurable filename for Test-Results allowing for multiple result files
- ALOpsAppValidation: Extra parameter [containername] for overruling the default containername used for validation
- ALOpsDockerStart: Improved Additional Parameter parsing, allows for variables via parameter injection
- ALOpsDockerWait: Improved parsing of Error and Warning strings
- ALOpsDockerWait: Multiline Warning and Error string parsing
- ALOpsDockerWait: Task failed with warning on WarningString matches
- ALOpsExtensionAPI: Configurable API Version via parameter [apiversion]
- ALOpsExtensionAPI: Easy parameters for Service2Service setup
- ALOpsExtensionAPI: Improved deploymentStatus validation / Connection recovery for SaaS
- ALOpsExtensionAPI: Poll dpeloyment status as Warning instead of Error

## [v1.440] - 2021-02-17
- ALOpsAppCompile: Parameter added to overwrite "ShowMyCode" manifest setting
- ALOpsAppCompile@1: download previous app for Breaking Changes check
- ALOpsAppCompile@1: Download previous version of App
- ALOpsAppCompile@2: improved unpacking for Artifacts
- ALOpsAppCompiler@2: Compatibility update for pre-BC-v15 versions
- ALOpsAppPublish: added parameter [forceinstall] which will force installation of Apps ignoring previous state
- ALOpsAppPublish: new parameter [publisherazureactivedirectorytenantid] 
- ALOpsAppTest: Option to create test-suites on-the-fly by specifying the [testfilter] parameter
- ALOpsAppTest: Parameter added for loading DisabledTests via File or Url
- ALOpsAppValidation: new Task for running BcContainerHelper's AppValidation 
- ALOpsDockerStart: improved unpacking for Artifacts
- ALOpsExtensionAPI: Alternate to BC-Artifacts when BC-Management DLL's are not available
- ALOpsExtensionAPI: Improved error catching on API calls

## [v1.439] - 2021-02-05
- All Tasks: Use same artifact folder names when publishing pipeline artifacts
- ALOpsAgentMaintenance: improved container/image pruning
- ALOpsAppPublish: ignore/skip errors when installing AL-Test-Apps
- ALOpsDockerStart: Added option for 'multitenant' environments
- ALOpsExtensionAPI: added Service-2-Service authentication, only client_id and client_secret is required

## [v1.438] - 2020-12-31
- ALOpsAppCompile: ALAnalyzer can be disabled by setting the parameter to 'NONE'
- ALOpsAppCompile: Ruleset can be disabled by setting it to 'NONE', Url's can be specificied for downloading remote rulesets
- ALOpsAppCompile@2: Allow custom VSIX for compilation. Filepath or Url.
- ALOpsAppCompile@2: Register NavSip in non-docker environments
- ALOpsAppSign: Improved AppFile resolving
- ALOpsAppSign: Improved path resolving / Register NavSip if required
- ALOpsDockerRemove: Action filter for SQL-Backup and EventLog extraction: Always or OnFailure
- ALOpsDockerRemove: EventLogs can be extracted from the container. Always or OnFailure.

## [v1.437] - 2020-12-14
- ALOpsAppCompile: Read CodeAnalyzers from VSCode settings
- ALOpsAppCompile@2: Define Ruleset via parameter [ruleset], overrules VSCode settings
- ALOpsAppCompile@2: Generate hash table of generated Apps in BatchCompile Mode
- ALOpsAppCompile@2: New string Parameter [appfilenametemplate] that allows for setting custom appnames, prefixes and suffixes
- ALOpsAppCompile@2: XLIF can be publsihed as Artifact by setting boolean parameter [publishxlif]
- ALOpsAppPublish: Installation of published Apps can be skipped by setting [installpublishedapps] = false
- ALOpsAppTest: [companyname] and [profile] can now be set for executing tests
- ALOpsDockerRemove: Export Container Database via new parameters [createsqlbackup], [sqlcompression], [zipsqlbackup], [publishsqlbackup]
- ALOpsFobImport: New boolean parameter [force_full_generate_symbol_reference], will trigger a full generate symbols after FOB Import.

## [v1.436] - 2020-11-25
- ALOPSAppCompile: implemented /parallel and /maxDegreeOfParallelism with VSCode defaults
- ALOPSAppCompile: new integer Global variable [alops_webrequest_timeout_ms] to set timeout for DownloadSymbols
- ALOPSAppCompile: Only copy Platform Apps if no Localized version exists
- ALOpsAppCompile@2: Escape AssemblyProbingPaths in pipeline log
- ALOPSAppPublish: Get-NAVAppInfo does not account for UTF-8, replace UTF8 characters in Build-Tag
- ALOPSAppPublish: Use Unique Folder for each Batch Publish
- ALOPSAppTest: New parameter [tenant] for targeting tests at a specific tenant
- ALOPSDockerCreate: Fail pipeline on Error, Force task status
- ALOPSDockerCreate: New string parameter [memory] with default 8G
- ALOPSDockerRemove: Exit status error when container does not exist
- Global: Show Task inputs for all Tasks

## [v1.435] - 2020-10-11
- ALOpsAgentMaintenance: New task that allows for auto-cleanup of BCArtifacts, Containers and ALOps Tasks
- ALOpsAppClean: allow removal of Microsoft Apps with new boolean parameter [includemicrosoftapps]
- ALOpsAppCompile: Added warning for square brackets in AppName/AppPublisher, Improved handling of FilePaths
- ALOpsAppCompile: Force copy non default [app.json]
- ALOpsAppPublish: Strict AL Apps installation. Added bool parameter [strictappnames]
- ALOpsDockerCreate: Allow usage of "select" parameter for NextMinor/NextMajor/...
- ALOpsDockerCreate: Default MultiTenant to false
- ALOpsDockerCreate: Silent BCContainerHelper installation, ignore install errors if BCContainerHelper is present
- ALOpsDockerStart: Reset default inputs when blanked out
- ALOpsExtensionAPI: Fail task on errors in App Publish
- ALOpsExtensionAPI: OAuth authentication when running in docker
- Global: added boolean [Alops_UpdateHostsFile] Environment Variable which will set/remove the current Container in the Hosts file on the agent
- Global: Install-Update BcContainerHelper bugfix

## [v1.434] - 2020-09-15
- ALOpsDockerCreate: Allow Clobber on BcContainerHelper
- ALOpsDockerCreate: allow usage of 'myScript' feature with multiline parameter [myscripts]
- ALOpsDockerCreate: Allow using BcContainerHelper pre-release
- ALOpsDockerCreate: Set type default to Sandbox for BcInsider
- ALOpsDockerCreate: Uninstall NavContainerHelper will not be implemented, AllowClobber and Fully Qualitified CmdLets instead
- ALOpsDockerStart: fixed bug with recycling containers

## [v1.433] - 2020-08-25
- ALOpsAppCompile: Save Extension Artifact path in global variable $(ALOPS_COMPILE_ARTIFACT)
- ALOpsAppPublish: New parameter [publish_scope] / [tenant]
- ALOpsAppTest: Dynamicly resolve .PSM1 file in case of Multi-Version installations
- ALOpsDockerCreate: added boolean parameter [forcecreateimage] to force image creation
- ALOpsDockerCreate: added parameter [imagenametemplate] to allow setting the image template name
- ALOpsDockerCreate: Added parameters [sastoken] and [storageaccount] to allow for Insider/Custom Artifact Urls
- ALOpsDockerCreate: New task that allows creating BC-Docker images from BC-Artifacts
- ALOpsDockerStart: Improved security on DockerLogin for Windows Server 2016
- ALOpsDockerStart: Never pull images on local registry
- ALOpsDockerWait: new parameter [printlogs] which can be used to disable log printing of docker logs
- ALOpsDockerWait: Reset Container IP in global variables [ALOPS_DOCKER_IPADDRESS]
- ALOpsExtensionAPI: Set parameters [artifact_path] default to [$(System.ArtifactsDirectory)]

## [v1.432] - 2020-08-03
- ALOpsAppCompile: UTF-8 compatibility, affects Extension names, Manifest parsing and Download Extension
- ALOpsAppPublish: Added boolean parameter [forcesync] allowing destructive changes
- ALOpsDockerStart: Compression performance, switched to DotNet ZIP instead of Powershell
- ALOpsDockerStart: Disable docker pull for local repository images bugfix

## [v1.431] - 2020-06-30
- ALOpsAppCompile: SSL Verification can now be disabled with the global boolean parameter [alops_disable_ssl]
- ALOpsAppCompile: UrlEncode on Url-Builder can now be disabled with global boolean variable named "alops_disable_urlencoding" (Character Convert)
- ALOpsAppCompiler: only upload compile log with "PublishArtifacts" enabled
- ALOpsAppPublish: Allow ForceSync via new boolean parameter [forcesync]
- ALOpsAppTest: Import Test Suite v17 / Auto add required Apps for Test-Suite

## [v1.430] - 2020-05-31
- All Tasks: Improved NAV/BC Module loading for Multi-Build environments
- ALOpsAppPublish: InstallAlTestTool - Auto add additional Apps required for the Test-Framework
- ALOpsAppTest: BC v16/v17 compatibility/improvements
- ALOpsDockerStart: Default value for parameter 'accept_image_outdated' set to "TRUE"
- ALOpsDockerWait: Report transfer ZIP size
- ALopsExtensionAPI: Auto select correct version of Module in Multi-Build environments
- Disable Cleanup old Tasks by default (Performance)
- Docker Based Tasks: Direct PSSession support to other container. Use global parameters [alops-docker-computer] / [alops-docker-username] / [alops-docker-password]

## [v1.429] - 2020-04-30
- All Tasks: Allow for Windows-Authentication in docker containers (GSMA)
- All Tasks: Improved error-handling on all REST calls
- ALOpsAppPublish: Allow updating Apps in Batch-Publish cfr single publish
- ALOpsAppPublish: AppUpgrade issues are now logged to the pipeline
- ALOpsAppPublish: Batch_Publish_Folder is now copied to the container on demand
- ALOpsAppPublish: enable force install dependency by default
- ALOpsAppTest: Error and Warning close dialog enhancement
- ALOpsExtensionAPI: new tasks to handle BC-Extensions API calls
- ALOpsFobImport: added parameter [override_finsql_path] which allows to override the default finsql.exe resolving
- ALOpsLicenseImport: License-Path made dynamics (filtering) instead of literal
- ALOpsSaaSGetExtension: Task is replaced by the new Task [ALOps Extension API]
- ALOpsSaasPublishExtension: Task is replaced by the new Task [ALOps Extension API]

## [v1.428] - 2020-03-29
- All Tasks: Dynamic resolve of Management DLL's for Multiversion NAV/BC installations
- ALOpsAppCompiler: compatibility with propagated dependencies
- ALOpsAppCompiler: improved direction of ALC.EXE output
- ALOpsAppCompiler: replace invalid path characters with underscore in App-Filename
- ALOpsAppPublish: removed 'Scope' parameter for NAV2018 compatibility
- ALOpsAppRuntimePackage: remove ShowMyCode for NAV20
- ALOpsAppTest: BC16 overwrite faulty standard Test-Libraries
- ALOpsAppTest: improved stability for BC15 / upgraded to work with BC16
- ALOpsDockerStart: auto split parameter [docker_parameters] so it can be set via Variables
- ALOpsDockerStart: only convert microsoft images to lowercase
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

