    # Build Steps Overview
    Let's describe all the Build Steps that we have at our disposal

    ## List and describe all build steps
    Here is a list of all build steps you have at your disposal when you use ALOps

        ### ALOps Tasks
    - ALOps Admin Center API
  * Interact with the Business Central SaaS Admin Center API. Supports environment management (list, get, copy, delete, rename), app lifecycle (install, uninstall, update), and configuration (Application Insights key, security group). Authenticates via OAuth2 client credentials, client certificate, or user impersonation.
  * YAML Template: 
    ```yaml
        - task: ALOpsAdminCenterAPI@3
          displayName: 'ALOps Admin Center API'
          inputs:
            azure_tenant_id:                      # Azure Active Directory tenant ID (GUID or domain) of the Microsoft 365 or Entra ID tenant. Required for all SaaS cloud interactions. $(azure_tenant_id) $(azure_tenant_id) $(azure_tenant_id)
            azure_app_client_id:                  # Application (client) ID of the Azure AD app registration used for authentication against the Admin Center API. $(azure_app_client_id) $(azure_app_client_id) $(azure_app_client_id)
            azure_app_client_secret:              # Client secret of the Azure AD app registration. Store this value in a pipeline secret variable or Azure Key Vault, never in plain text. $(azure_app_client_secret) $(azure_app_client_secret) $(azure_app_client_secret)
            azure_app_client_certificate:         # Path, base-64 encoded content, or certificate store reference (CERT:\...) of the certificate (.pfx) used instead of a client secret for Azure AD app authentication. $(azure_app_client_certificate) $(azure_app_client_certificate) $(azure_app_client_certificate)
            azure_app_client_certificate_password: # Password protecting the client certificate. Store this in a pipeline secret variable. $(azure_app_client_certificate_password) $(azure_app_client_certificate_password) $(azure_app_client_certificate_password)
            username:                             # Business Central user account name. Leave empty when using Service-to-Service (app-only) OAuth authentication. $(username) $(username) $(username)
            password:                             # Password for the Business Central user account. Leave empty for Service-to-Service authentication. Store this in a pipeline secret variable. $(password) $(password) $(password)
            checksecondsdelay: 30                 # Number of seconds to wait between polls when checking the status of an async operation. Increase this for slower environments. $(checksecondsdelay) $(checksecondsdelay) $(checksecondsdelay)
            maxtries: 20                          # Maximum number of status-check attempts before the task times out and fails. Multiply by Check Delay to calculate the total maximum wait time. $(maxtries) $(maxtries) $(maxtries)
            interaction: environment_list         # Admin Center API operation to execute: environment_list or environment_get reads environment info; environment_copy or environment_rename manages environments; app_install, app_uninstall, or app_update manages extensions; set_application_insightskey or set_security_group applies configuration. $(interaction) $(interaction) $(interaction)
            wait_for_operation: true              # When enabled, the task polls the Admin Center API until the async operation completes or the maximum number of tries is reached. Disable to fire-and-forget. $(wait_for_operation) $(wait_for_operation) $(wait_for_operation)
            environment:                          # Name of the source Business Central environment to act on, for example Sandbox or Production. $(environment) $(environment) $(environment)
            target_environment:                   # Name of the target environment used for copy or rename operations. $(target_environment) $(target_environment) $(target_environment)
            target_environment_type: Sandbox      # Type of the new environment created during a copy operation. Sandbox environments allow developer access; Production environments are for live business data. $(target_environment_type) $(target_environment_type) $(target_environment_type)
            application_insightskey:              # Azure Application Insights instrumentation key (GUID) to configure on the Business Central environment for telemetry. Used with the set_application_insightskey interaction. $(application_insightskey) $(application_insightskey) $(application_insightskey)
            security_group_id:                    # Azure AD security group object ID to assign to the Business Central environment for access control. Used with the set_security_group interaction. $(security_group_id) $(security_group_id) $(security_group_id)
            app_id:                               # GUID of the Business Central extension to install, uninstall, or update. Find this value in the app.json of the extension or in the AppSource listing. $(app_id) $(app_id) $(app_id)
            use_update_window: false              # When enabled, the app install or update is scheduled within the Admin Center maintenance window instead of running immediately. $(use_update_window) $(use_update_window) $(use_update_window)
            accept_isv_eula: false                # Required to install ISV apps that carry an end-user license agreement. Set this to true to accept the EULA programmatically. $(accept_isv_eula) $(accept_isv_eula) $(accept_isv_eula)
            force_dependencies: false             # Force the installation or update of all dependent extensions together with the target app, even if they are already installed at a lower version. $(force_dependencies) $(force_dependencies) $(force_dependencies)
            confirm_delete_data: false            # Required when uninstalling an extension that has stored data in Business Central. Set this to true to confirm that stored data will be permanently deleted. $(confirm_delete_data) $(confirm_delete_data) $(confirm_delete_data)
    ```
- ALOps Agent Maintenance
  * Cleans up Docker resources (containers, images, volumes, build cache), BC Artifact caches, agent/Windows temp folders, package caches, and old ALOps task versions. Supports dry-run mode for previewing cleanup actions. Reports disk space freed and sets pipeline output variables for downstream steps.
  * YAML Template: 
    ```yaml
        - task: ALOpsAgentMaintenance@3
          displayName: 'ALOps Agent Maintenance'
          inputs:
            dockercontainers: False               # Remove all stopped/exited Docker containers (docker container prune). $(dockercontainers) $(dockercontainers) $(dockercontainers)
            dockerimages: False                   # Remove Docker images older than the specified number of days. $(dockerimages) $(dockerimages) $(dockerimages)
            pruneimagesdayscreated: 0             # Remove Docker images older than this many days. Set to 0 to skip age-based image pruning. $(pruneimagesdayscreated) $(pruneimagesdayscreated) $(pruneimagesdayscreated)
            dockerimagesbyos: False               # Remove Docker images whose OS version does not match the host OS. Uses direct Docker inspect (no BcContainerHelper dependency). $(dockerimagesbyos) $(dockerimagesbyos) $(dockerimagesbyos)
            dockervolumes: False                  # Remove all dangling (unused) Docker volumes. $(dockervolumes) $(dockervolumes) $(dockervolumes)
            dockerbuildcache: False               # Remove all Docker build cache (docker builder prune). $(dockerbuildcache) $(dockerbuildcache) $(dockerbuildcache)
            bcartifacts: False                    # Remove unused BC Artifact cache folders, orphaned VSIX extractions, temp folders, and empty directories. $(bcartifacts) $(bcartifacts) $(bcartifacts)
            bcartifactscachefolder:               # Path to the BC Artifacts cache folder. Leave empty for auto-detection (checks bcaboragentartifactspath env var, then falls back to C:\bcartifacts.cache). $(bcartifactscachefolder) $(bcartifactscachefolder) $(bcartifactscachefolder)
            packagecache: False                   # Remove old ALTool/compiler packages from the agent tools directory and old NuGet global cache packages. $(packagecache) $(packagecache) $(packagecache)
            oldtasks: False                       # Remove old ALOps task version folders from the agent. Auto-detects the current version and removes all older versions. $(oldtasks) $(oldtasks) $(oldtasks)
            agenttemp: False                      # Remove old files and folders from the agent temp directory (AGENT_TEMPDIRECTORY). $(agenttemp) $(agenttemp) $(agenttemp)
            windowstemp: False                    # Remove old files and folders from the Windows temp directory (TEMP). $(windowstemp) $(windowstemp) $(windowstemp)
            daysunused: 30                        # Threshold in days for cleanup operations. Items not used within this period are removed. Applies to BCArtifacts, AgentTemp, WindowsTemp, and PackageCache operations. $(daysunused) $(daysunused) $(daysunused)
            dryrun: False                         # When enabled, reports what would be cleaned without actually deleting anything. Use this for change management review before running actual cleanup. $(dryrun) $(dryrun) $(dryrun)
            erroraction: Warn                     # How cleanup failures affect the task result. 'Error' fails the task on any cleanup error. 'Warn' marks the task as SucceededWithIssues. 'Ignore' silently continues. $(erroraction) $(erroraction) $(erroraction)
    ```
- ALOps AI CLI
  * Runs one of three AI coding CLIs (Claude Code, OpenAI Codex, GitHub Copilot CLI) in headless mode with a uniform input and output contract. Authentication follows an OpenAI-compatible shape (api_key + base_url) with a narrow mapping to each tool's native auth. Cross-platform (Windows + Linux). The selected CLI must be pre-installed on the agent; a missing CLI fails the step with a clear error.
  * YAML Template: 
    ```yaml
        - task: ALOpsAICli@3
          displayName: 'ALOps AI CLI'
          inputs:
            ai_tool: claude                       # Which pre-installed AI coding CLI to invoke. $(ai_tool) $(ai_tool) $(ai_tool)
            model:                                # Pass-through model name (--model / -m). Leave empty to use the CLI's built-in default. $(model) $(model) $(model)
            user_prompt:                          # The user turn. Delivered to Claude and Codex via stdin, and to Copilot via the -p argument. Must be non-empty. If the value is a single-line existing file path (relative paths resolve against the working directory) the file content is used. If it is a single-line http(s) URL the body is downloaded. Otherwise the value is treated as inline text. Multi-line values are always inline. $(user_prompt) $(user_prompt) $(user_prompt)
            system_prompt:                        # Optional system/instructions layer. Native on Claude (--system-prompt); polyfilled via a fenced three-section wrapper for Codex and Copilot. If the value is a single-line existing file path (relative paths resolve against the working directory) the file content is used. If it is a single-line http(s) URL the body is downloaded. Otherwise the value is treated as inline text. Multi-line values are always inline. $(system_prompt) $(system_prompt) $(system_prompt)
            api_key:                              # The credential. Maps to the tool- and mode-appropriate env var (ANTHROPIC_API_KEY / ANTHROPIC_AUTH_TOKEN / OPENAI_API_KEY / GITHUB_TOKEN / ANTHROPIC_FOUNDRY_KEY). $(api_key) $(api_key) $(api_key)
            base_url:                             # OpenAI-compatible endpoint URL. When non-empty (and foundry_resource empty), switches the step into 'openai_compat' auth mode. Must be an http(s) URL. $(base_url) $(base_url) $(base_url)
            foundry_resource:                     # Azure AI Foundry resource name (plain name only, e.g. 'ALOpsAI' — no URL, no slashes). When non-empty, switches the step into 'foundry' auth mode. Not supported for Copilot in MVP. $(foundry_resource) $(foundry_resource) $(foundry_resource)
            working_directory:                    # Directory to run the CLI in. Leave empty to use the platform's workspace directory. The step restores the previous location on exit (try/finally). $(working_directory) $(working_directory) $(working_directory)
            show_raw_output: false                # When enabled, the step prints the full raw CLI stdout inside an "AI Raw Output" log group on success. Defaults to off to keep logs compact — the parsed ai_response is still logged, and the raw transcript is always available via the ai_raw_output_path output. The group is also shown automatically when pipeline debug logging is enabled (System.Debug on Azure DevOps, RUNNER_DEBUG on GitHub Actions). On non-zero exit the raw output is always printed. $(show_raw_output) $(show_raw_output) $(show_raw_output)
            enable_ai_cli_stream: false           # When enabled, the step echoes every CLI stdout line live inside an "AI CLI stream" log group, with each event formatted by the per-tool stream formatter. Defaults to off to keep logs compact — the parsed ai_response is always logged, and the full raw transcript can be shown via show_raw_output or retrieved from ai_raw_output_path. The CLI still runs and stdout is still captured when this is off; only the live echo is suppressed. $(enable_ai_cli_stream) $(enable_ai_cli_stream) $(enable_ai_cli_stream)
    ```
- ALOps AL Documentation
  * Generates DocFx-based reference documentation for AL extensions using aldoc.exe from the microsoft.dynamics.businesscentral.development.tools NuGet package. Supports init, build, refresh, and full workflows including optional DocFx static site generation.
  * YAML Template: 
    ```yaml
        - task: ALOpsALDoc@3
          displayName: 'ALOps AL Documentation'
          inputs:
            aldoc_operation: full                 # The aldoc operation to perform. `init` scaffolds a DocFx project, `build` generates reference docs from a .app file, `refresh` updates DocFx templates, `full` runs init+build, `fullwithdocfx` runs init+build+docfx build. $(aldoc_operation) $(aldoc_operation) $(aldoc_operation)
            app_file:                             # Path to the compiled `.app` file to generate documentation for. $(app_file) $(app_file) $(app_file)
            output_path: $(Build.ArtifactStagingDirectory)/ALDoc# Output folder for the DocFx project and generated documentation. $(output_path) $(output_path) $(output_path)
            package_cache_path:                   # Path to dependency `.app` files for cross-references (e.g., `.alpackages` folder). If empty, defaults to `{app_file_dir}/.alpackages/`. $(package_cache_path) $(package_cache_path) $(package_cache_path)
            flatten_namespaces: false             # Show namespaces as a non-nested (flat) list in the table of contents. $(flatten_namespaces) $(flatten_namespaces) $(flatten_namespaces)
            ignore_folders: false                 # Do not use folder structure as modules in the generated documentation. $(ignore_folders) $(ignore_folders) $(ignore_folders)
            include_internals: false              # Include internal symbols in the generated documentation. $(include_internals) $(include_internals) $(include_internals)
            overwrite_folder:                     # Path to a folder containing overwrite markdown files that inject custom content into autogenerated reference articles. $(overwrite_folder) $(overwrite_folder) $(overwrite_folder)
            assembly_probing_paths:               # Additional .NET assembly probing paths (one per line). Used when the app depends on custom .NET assemblies. $(assembly_probing_paths) $(assembly_probing_paths) $(assembly_probing_paths)
            docfx_build: false                    # Build a static HTML site using DocFx after generating reference docs. Requires DocFx <= 2.70.0 to be installed on the agent. $(docfx_build) $(docfx_build) $(docfx_build)
            altool_package_version: 18.0.33.65164-beta# Version of the `microsoft.dynamics.businesscentral.development.tools` NuGet package containing `aldoc.exe`. $(altool_package_version) $(altool_package_version) $(altool_package_version)
            altool_cache_hours: 0                 # Number of hours the downloaded NuGet package is cached on the agent. Set to `0` to always download fresh. $(altool_cache_hours) $(altool_cache_hours) $(altool_cache_hours)
            log_level: Info                       # ALDoc log level for controlling output verbosity. $(log_level) $(log_level) $(log_level)
            log_file_path:                        # Optional file path to save the aldoc processing log. $(log_file_path) $(log_file_path) $(log_file_path)
            fail_on_warnings: false               # Fail the task if aldoc emits warning messages. $(fail_on_warnings) $(fail_on_warnings) $(fail_on_warnings)
            publishartifact: true                 # Upload the generated documentation as an Azure DevOps build artifact. $(publishartifact) $(publishartifact) $(publishartifact)
            artifact_name: ALDocOutput            # Name of the Azure DevOps build artifact for the documentation output. $(artifact_name) $(artifact_name) $(artifact_name)
    ```
- ALOps App License Check
  * Validates Business Central App (.app) files against a BC license to ensure all objects are licensed.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppLicenseCheck@3
          displayName: 'ALOps App License Check'
          inputs:
            licensefile:                          # Set the BC License File. Path or Url. $(licensefile) $(licensefile) $(licensefile)
            expiry_text:                          # String to find in license to match for ExpiryDate. $(expiry_text) $(expiry_text) $(expiry_text)
            expiry_dateformat:                    # Date Format of the Expiry date, example: dd.MM.yyyy $(expiry_dateformat) $(expiry_dateformat) $(expiry_dateformat)
            expiry_dayswarning:                   # Amount of days before License-Expiry for triggering a warning $(expiry_dayswarning) $(expiry_dayswarning) $(expiry_dayswarning)
            expiry_checkonly: false               # When enabled, only the license expiry check is performed and the full license object check is skipped. $(expiry_checkonly) $(expiry_checkonly) $(expiry_checkonly)
            artifact_path:                        # Path for App Artifact. $(artifact_path) $(artifact_path) $(artifact_path)
            artifact_filter: *.app                # Filter used for locating App file relative to $(artifact_path). $(artifact_filter) $(artifact_filter) $(artifact_filter)
            artifact_include:                     # Include-Filter used for locating App file relative to $(artifact_path). $(artifact_include) $(artifact_include) $(artifact_include)
            artifact_exclude:                     # Exclude-Filter used for locating App file relative to $(artifact_path). $(artifact_exclude) $(artifact_exclude) $(artifact_exclude)
            use_alops_compiler_apps: false        # When enabled, `artifact_path` and `artifact_filter` are ignored. Instead, the task reads app paths from the `ALOPS_COMPILE_ARTIFACT_ARRAY` environment variable (comma-separated), which is populated by a preceding ALOpsAppCompiler task. $(use_alops_compiler_apps) $(use_alops_compiler_apps) $(use_alops_compiler_apps)
            exclude_ranges:                       # Exclude-Ranges from LicenseCheck (Buffer / Temporary tables). Format: 60000..60099,70000..70100 $(exclude_ranges) $(exclude_ranges) $(exclude_ranges)
            exclude_tables: false                 # Exclude Table objects from LicenseCheck. $(exclude_tables) $(exclude_tables) $(exclude_tables)
            exclude_codeunits: false              # Exclude Codeunit objects from LicenseCheck. $(exclude_codeunits) $(exclude_codeunits) $(exclude_codeunits)
            exclude_pages: false                  # Exclude Page objects from LicenseCheck. $(exclude_pages) $(exclude_pages) $(exclude_pages)
            exclude_reports: false                # Exclude Report objects from LicenseCheck. $(exclude_reports) $(exclude_reports) $(exclude_reports)
            exclude_xmlports: false               # Exclude XMLPort objects from LicenseCheck. $(exclude_xmlports) $(exclude_xmlports) $(exclude_xmlports)
            exclude_queries: false                # Exclude Query objects from LicenseCheck. $(exclude_queries) $(exclude_queries) $(exclude_queries)
            altool_package_version: 18.0.33.65164-beta# Version of the microsoft.dynamics.businesscentral.development.tools NuGet package to use for altool.exe and CodeAnalysis DLL. $(altool_package_version) $(altool_package_version) $(altool_package_version)
            warning_only: false                   # Only post warning, do not fail pipeline. $(warning_only) $(warning_only) $(warning_only)
    ```
- ALOps App Sign
  * Sign Business Central .app files with a code-signing certificate. Supports PFX file-based signing (local or URL), Azure Key Vault HSM, and Trusted Signing. Batch signing of all compiled apps is supported via the ALOPS_COMPILE_ARTIFACT_ARRAY variable.

**Runs on:** Windows only.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppSign@3
          displayName: 'ALOps App Sign'
          inputs:
            signmethod: PFX                       # Signing method: PFX for file-based certificate signing, HSM for hardware security module signing (Azure Key Vault or Trusted Signing). $(signmethod) $(signmethod) $(signmethod)
            usedocker: false                      # Run signing inside a Docker container. The app and PFX are copied into the container, signed, and copied back. $(usedocker) $(usedocker) $(usedocker)
            fixed_tag:                            # Fixed container label. When set, uses this value to locate the Docker container instead of the build ID. $(fixed_tag) $(fixed_tag) $(fixed_tag)
            timestamp_uri:                        # Time-stamping authority URL. Defaults to http://timestamp.digicert.com if empty. $(timestamp_uri) $(timestamp_uri) $(timestamp_uri)
            hsmmethod: KEYVAULT                   # HSM signing method: KEYVAULT for Azure Key Vault, TRUSTED for Azure Trusted Signing. $(hsmmethod) $(hsmmethod) $(hsmmethod)
            hsm_description:                      # Description text embedded in the digital signature. $(hsm_description) $(hsm_description) $(hsm_description)
            hsm_description_url:                  # URL embedded in the digital signature description. $(hsm_description_url) $(hsm_description_url) $(hsm_description_url)
            hsm_digestalgorithm: sha256           # Hash algorithm for digest and timestamp. Default: sha256. $(hsm_digestalgorithm) $(hsm_digestalgorithm) $(hsm_digestalgorithm)
            batchsigncompiledapps: false          # Sign all apps from the ALOPS_COMPILE_ARTIFACT_ARRAY variable (set by ALOpsAppCompiler). $(batchsigncompiledapps) $(batchsigncompiledapps) $(batchsigncompiledapps)
            artifact_path:                        # Path to the folder containing .app files to sign. Leave empty to scan the workspace directory. $(artifact_path) $(artifact_path) $(artifact_path)
            nav_artifact_app_filter: *.app        # Glob filter for .app files to sign. $(nav_artifact_app_filter) $(nav_artifact_app_filter) $(nav_artifact_app_filter)
            publish_artifact: true                # Upload signed .app files as build artifacts. $(publish_artifact) $(publish_artifact) $(publish_artifact)
            pfx_path:                             # Path or URL to the PFX certificate file. If a URL is provided, the file is downloaded automatically. $(pfx_path) $(pfx_path) $(pfx_path)
            pfx_password:                         # Password for the PFX certificate. Store this in a pipeline secret variable. $(pfx_password) $(pfx_password) $(pfx_password)
            hsm_signing_endpoint:                 # Azure Trusted Signing endpoint URL. $(hsm_signing_endpoint) $(hsm_signing_endpoint) $(hsm_signing_endpoint)
            hsm_signing_account:                  # Azure Trusted Signing account name. $(hsm_signing_account) $(hsm_signing_account) $(hsm_signing_account)
            hsm_trusted_certificateprofile:       # Certificate profile name for Azure Trusted Signing. $(hsm_trusted_certificateprofile) $(hsm_trusted_certificateprofile) $(hsm_trusted_certificateprofile)
            hsm_keyvault_name:                    # Azure Key Vault name (just the name, not the full URL). $(hsm_keyvault_name) $(hsm_keyvault_name) $(hsm_keyvault_name)
            hsm_keyvault_certificate_name:        # Certificate name in the Azure Key Vault. $(hsm_keyvault_certificate_name) $(hsm_keyvault_certificate_name) $(hsm_keyvault_certificate_name)
            hsm_tenantid:                         # Azure AD tenant ID for service principal authentication. Leave empty for managed identity. $(hsm_tenantid) $(hsm_tenantid) $(hsm_tenantid)
            hsm_clientid:                         # Azure AD application (client) ID for service principal authentication. Leave empty for managed identity. $(hsm_clientid) $(hsm_clientid) $(hsm_clientid)
            hsm_client_secret:                    # Azure AD client secret for service principal authentication. Store this in a pipeline secret variable. $(hsm_client_secret) $(hsm_client_secret) $(hsm_client_secret)
    ```
- ALOps App Sign Verify
  * Verify Authenticode signatures on Business Central .app files. Uses Get-AuthenticodeSignature (cross-platform on PS7) with SignTool.exe fallback on Windows. Supports Docker execution and batch verification via the ALOPS_COMPILE_ARTIFACT_ARRAY variable.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppSignVerify@3
          displayName: 'ALOps App Sign Verify'
          inputs:
            usedocker: false                      # Run signature verification inside a Docker container. The app is copied into the container, verified, and the result is returned. $(usedocker) $(usedocker) $(usedocker)
            fixed_tag:                            # Fixed container label. When set, uses this value to locate the Docker container instead of the build ID. $(fixed_tag) $(fixed_tag) $(fixed_tag)
            artifact_path:                        # Path to the folder containing .app files to verify. Leave empty to scan the workspace directory. $(artifact_path) $(artifact_path) $(artifact_path)
            nav_artifact_app_filter: *.app        # Glob filter for .app files to verify. $(nav_artifact_app_filter) $(nav_artifact_app_filter) $(nav_artifact_app_filter)
            batchverifycompiledapps: false        # Verify all apps from the ALOPS_COMPILE_ARTIFACT_ARRAY variable (set by ALOpsAppCompiler). $(batchverifycompiledapps) $(batchverifycompiledapps) $(batchverifycompiledapps)
    ```
- ALOps AppSource
  * Publishes Business Central .app files to Microsoft AppSource. Authenticates via Azure AD, discovers offerings, matches local apps, uploads packages via SAS URI, creates submissions, and optionally auto-promotes through the certification pipeline.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppSource@3
          displayName: 'ALOps AppSource'
          inputs:
            azure_tenant_id:                      # Azure AD tenant ID for Partner Center authentication. Falls back to environment variable 'alops_tenant_id' if empty. $(azure_tenant_id) $(azure_tenant_id) $(azure_tenant_id)
            azure_app_client_id:                  # Azure AD application (client) ID for Partner Center authentication. Falls back to environment variable 'alops_application_id' if empty. $(azure_app_client_id) $(azure_app_client_id) $(azure_app_client_id)
            azure_app_client_secret:              # Azure AD client secret for Partner Center authentication. Falls back to environment variable 'alops_application_secret' if empty. Automatically masked in logs. $(azure_app_client_secret) $(azure_app_client_secret) $(azure_app_client_secret)
            offering_name_filter:                 # Semicolon-separated list of offering names to include. Leave empty to process all Business Central offerings. $(offering_name_filter) $(offering_name_filter) $(offering_name_filter)
            apply_offering_version_filter: false  # When enabled, only uploads offerings where the local app version is higher than the currently published version. $(apply_offering_version_filter) $(apply_offering_version_filter) $(apply_offering_version_filter)
            skip_version_change: false            # When enabled, skips updating the version number in Partner Center. Useful for re-submitting the same version. $(skip_version_change) $(skip_version_change) $(skip_version_change)
            autopromote: false                    # Automatically promote the submission to go live after it reaches 'ReadyToPublish' status. $(autopromote) $(autopromote) $(autopromote)
            autopromote_check_delay: 30           # Seconds to wait between status polling attempts during auto-promotion. $(autopromote_check_delay) $(autopromote_check_delay) $(autopromote_check_delay)
            autopromote_max_tries: 120            # Maximum number of polling attempts before timing out during auto-promotion. $(autopromote_max_tries) $(autopromote_max_tries) $(autopromote_max_tries)
    ```
- ALOps App Symbol
  * Creates symbol-only packages from compiled AL .app files. Uses altool.exe CreateSymbolPackage to strip implementation code, leaving only the public API surface. Optionally verifies each output with altool IsSymbolOnly and publishes artifacts.
  * YAML Template: 
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
- ALOps BC Replay
  * Run BC-Replay for Business Central. Replays recorded `.yml` user sessions against a BC web client using Playwright. Supports Windows, AAD, and UserPassword authentication. Always uses server-side replay mode.
  * YAML Template: 
    ```yaml
        - task: ALOpsBCReplay@3
          displayName: 'ALOps BC Replay'
          inputs:
            tests: $(System.DefaultWorkingDirectory)\recordings\*.yml# File glob pattern to select the recording `.yml` files to run. Maps to the `-Tests` parameter of `npx replay`. $(tests) $(tests) $(tests)
            start_address:                        # URL to the deployed BC web client. For Docker: `http://localhost:<port>/`. For SaaS: `https://<tenant>.businesscentral.dynamics.com/`. Maps to `-StartAddress`. $(start_address) $(start_address) $(start_address)
            authentication: Windows               # Authentication method to use against the BC web client. `Windows` for on-prem/Docker, `AAD` for SaaS/cloud, `UserPassword` for basic auth. $(authentication) $(authentication) $(authentication)
            username_key:                         # Name of the environment variable containing the username. Required when Authentication is set to `AAD` or `UserPassword`. Maps to `-UserNameKey`. $(username_key) $(username_key) $(username_key)
            password_key:                         # Name of the environment variable containing the password or PAT. Required when Authentication is set to `AAD` or `UserPassword`. Maps to `-PasswordKey`. $(password_key) $(password_key) $(password_key)
            multifactor_type: None                # MFA mechanism. Only available with AAD authentication. Maps to `-MultiFactorType`. $(multifactor_type) $(multifactor_type) $(multifactor_type)
            multifactor_secret_key:               # Name of the environment variable storing the MFA secret. For TOTP: the TOTP secret key. For Certificate: Base64-encoded PFX certificate. Maps to `-MultiFactorSecretKey`. $(multifactor_secret_key) $(multifactor_secret_key) $(multifactor_secret_key)
            result_dir: $(Agent.TempDirectory)\bcreplay_results# Directory to write test results. Maps to `-ResultDir`. $(result_dir) $(result_dir) $(result_dir)
            npm_install: true                     # Automatically install `@microsoft/bc-replay` and Playwright browsers before running. When `false`, expects `@microsoft/bc-replay` to be pre-installed (e.g. in a prior pipeline step). Requires Node.js >= 16.14.0 on the agent. $(npm_install) $(npm_install) $(npm_install)
            bcreplay_version: latest              # Version of `@microsoft/bc-replay` to install. Use `latest` for the newest version or pin to a specific version (e.g. `0.1.119`). Only used when Auto-Install is enabled. $(bcreplay_version) $(bcreplay_version) $(bcreplay_version)
            failed_action: Error                  # Action to take when one or more replay recordings fail. `Error`: fail the task. `Warning`: succeed with issues. `Ignore`: succeed silently. $(failed_action) $(failed_action) $(failed_action)
            publish_results: true                 # Publish replay results as Azure DevOps test results (visible in the Tests tab). $(publish_results) $(publish_results) $(publish_results)
            publish_summary: true                 # Generate and publish a markdown summary report as a build artifact. $(publish_summary) $(publish_summary) $(publish_summary)
    ```
- ALOps App Compiler
  * Compile Business Central extension(s) from AL code using altool.exe (microsoft.dynamics.businesscentral.development.tools NuGet package). Supports serial and parallel compilation modes.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppCompiler@3
          displayName: 'ALOps App Compiler'
          inputs:
            altool_package_version: 17.0.30.49729-beta# Version of the microsoft.dynamics.businesscentral.development.tools NuGet package. Pin to a specific version for reproducible builds. $(altool_package_version) $(altool_package_version) $(altool_package_version)
            compilation_mode: Serial              # Serial: compiles one app at a time. Parallel: uses workspace compile for concurrency. $(compilation_mode) $(compilation_mode) $(compilation_mode)
            alsourcepath:                         # Root folder searched recursively for app.json files. $(alsourcepath) $(alsourcepath) $(alsourcepath)
            alcachepath:                          # Folder containing symbol .app files. Defaults to alsourcepath when empty. $(alcachepath) $(alcachepath) $(alcachepath)
            maxcpucount:                          # Maximum concurrent compilations in parallel mode. Defaults to logical processor count. $(maxcpucount) $(maxcpucount) $(maxcpucount)
            appversiontemplate: 1.0.*.0           # Four-part version template. * = build number, ? = keep original, A = application field. $(appversiontemplate) $(appversiontemplate) $(appversiontemplate)
            updatebuildnumber: true               # Update the CI build number with the compiled app version. $(updatebuildnumber) $(updatebuildnumber) $(updatebuildnumber)
            appfilenametemplate:                  # Template for the output .app filename. Tokens: %APPNAME%, %PUBLISHER%, %VERSION%. $(appfilenametemplate) $(appfilenametemplate) $(appfilenametemplate)
            alcodeanalyzer:                       # Comma-separated list of code analyzer DLL paths. $(alcodeanalyzer) $(alcodeanalyzer) $(alcodeanalyzer)
            ruleset:                              # Path to a .ruleset.json file for code analysis. $(ruleset) $(ruleset) $(ruleset)
            failonwarnings: false                 # Treat compiler warnings as errors. $(failonwarnings) $(failonwarnings) $(failonwarnings)
            auto_resolve_ms_symbols: true         # Download missing MS symbols from the MSSymbols NuGet feed. $(auto_resolve_ms_symbols) $(auto_resolve_ms_symbols) $(auto_resolve_ms_symbols)
            force_download_mssymbols: false       # Delete all `Microsoft_*.app` files from the symbol cache before resolving. Use in multi-localisation pipelines where the same cache path is reused across countries. $(force_download_mssymbols) $(force_download_mssymbols) $(force_download_mssymbols)
            bc_localization: W1                   # Business Central country code for MS symbol resolution. $(bc_localization) $(bc_localization) $(bc_localization)
            bc_version:                           # BC version filter in Major.Minor format. Auto-detected from app.json when empty. $(bc_version) $(bc_version) $(bc_version)
            ms_symbols_feed: https://dynamicssmb2.pkgs.visualstudio.com/DynamicsBCPublicFeeds/_packaging/MSSymbols/nuget/v3/index.json# NuGet v3 service index URL for the MSSymbols feed. $(ms_symbols_feed) $(ms_symbols_feed) $(ms_symbols_feed)
            ms_symbols_pat:                       # PAT for authenticated MSSymbols feed access. $(ms_symbols_pat) $(ms_symbols_pat) $(ms_symbols_pat)
            accept_insider_eula: false            # Accept the Microsoft BC insider EULA for NextMajor/NextMinor. $(accept_insider_eula) $(accept_insider_eula) $(accept_insider_eula)
            auto_resolve_appsource_symbols: true  # Resolve missing ISV symbol dependencies from the AppSourceSymbols feed. $(auto_resolve_appsource_symbols) $(auto_resolve_appsource_symbols) $(auto_resolve_appsource_symbols)
            appsource_symbols_feed: https://dynamicssmb2.pkgs.visualstudio.com/DynamicsBCPublicFeeds/_packaging/AppSourceSymbols/nuget/v3/index.json# NuGet v3 service index URL for the AppSourceSymbols feed. $(appsource_symbols_feed) $(appsource_symbols_feed) $(appsource_symbols_feed)
            appsource_symbols_pat:                # PAT for authenticated AppSourceSymbols feed access. $(appsource_symbols_pat) $(appsource_symbols_pat) $(appsource_symbols_pat)
            printappmanifest: true                # Print the app.json contents to the log before compilation. $(printappmanifest) $(printappmanifest) $(printappmanifest)
            outputalclogs: false                  # Output detailed ALC compiler logs. $(outputalclogs) $(outputalclogs) $(outputalclogs)
            publishartifact: true                 # Publish the compiled .app as a build artifact. $(publishartifact) $(publishartifact) $(publishartifact)
            outputpath:                           # Folder where compiled .app files are written. When empty, defaults to the CI platform artifact directory. $(outputpath) $(outputpath) $(outputpath)
            track_source_build_metadata: true     # Inject build and source metadata into app.json. Requires runtime >= 12.0. $(track_source_build_metadata) $(track_source_build_metadata) $(track_source_build_metadata)
            showmycode:                           # Override showMyCode in app.json (true/false/empty=keep). $(showmycode) $(showmycode) $(showmycode)
            internalsvisibleto:                   # Comma-separated list of app IDs to add to internalsVisibleTo. $(internalsvisibleto) $(internalsvisibleto) $(internalsvisibleto)
            preprocessorsymbols:                  # Comma-separated list of preprocessor symbols for conditional compilation. $(preprocessorsymbols) $(preprocessorsymbols) $(preprocessorsymbols)
    ```
- ALOps Docker Create
  * Build a BC Docker image from artifacts. Resolves artifact URLs, downloads app + platform artifacts, generates a Dockerfile, and builds the image. Supports Docker registry authentication, test toolkit inclusion, licensing, and multitenancy.
  * YAML Template: 
    ```yaml
        - task: ALOpsDockerCreate@3
          displayName: 'ALOps Docker Create'
          inputs:
            artifact_specification: Specific      # How to resolve BC artifacts. 'Specific' uses the version/type/country fields directly. 'Hint' reads them from a JSON hint file. $(artifact_specification) $(artifact_specification) $(artifact_specification)
            artifact_version:                     # BC artifact version, for example '24.0'. Leave empty for latest. $(artifact_version) $(artifact_version) $(artifact_version)
            artifact_type: Sandbox                # Type of BC artifact to download. $(artifact_type) $(artifact_type) $(artifact_type)
            artifact_country:                     # Country code for the BC artifact (e.g. 'us', 'w1'). Leave empty for W1. $(artifact_country) $(artifact_country) $(artifact_country)
            version_select: Latest                # Version selection strategy when multiple versions match. $(version_select) $(version_select) $(version_select)
            artifact_hint:                        # Path to a JSON hint file containing Version, Type, and Country fields. Used when Artifact Specification is 'Hint'. $(artifact_hint) $(artifact_hint) $(artifact_hint)
            alternative_artifact_url:             # Direct URL to BC artifacts. Overrides all other artifact resolution fields. $(alternative_artifact_url) $(alternative_artifact_url) $(alternative_artifact_url)
            storage_account:                      # Azure storage account for artifact downloads. Leave empty for default. $(storage_account) $(storage_account) $(storage_account)
            sas_token:                            # SAS token for private artifact storage. Store this in a pipeline secret variable. $(sas_token) $(sas_token) $(sas_token)
            image_prefix:                         # Prefix for the Docker image name (e.g. registry hostname). Can include registry path. $(image_prefix) $(image_prefix) $(image_prefix)
            image_name_template: %IMAGE_PREFIX%-%ARTIFACT_TYPE%-%ARTIFACT_VERSION%-%ARTIFACT_COUNTRY%-%OS_LTSC%# Template for generating the image name. Tokens: %IMAGE_PREFIX%, %ARTIFACT_TYPE%, %ARTIFACT_VERSION%, %ARTIFACT_COUNTRY%, %OS_VERSION%, %OS_LTSC%. $(image_name_template) $(image_name_template) $(image_name_template)
            use_generic_image:                    # Override the base generic image. Leave empty for auto-detection based on host OS. $(use_generic_image) $(use_generic_image) $(use_generic_image)
            memory: 8G                            # Docker build memory limit (e.g. '8G', '16G'). $(memory) $(memory) $(memory)
            force_create_image: false             # Force image rebuild even if the image already exists locally or in the registry. $(force_create_image) $(force_create_image) $(force_create_image)
            my_scripts:                           # Scripts to embed in the image's c:\run\my folder. One path or URL per line. Supports | delimiter for backward compatibility. $(my_scripts) $(my_scripts) $(my_scripts)
            docker_registry:                      # Docker registry URL for push/pull. Leave empty if not using a private registry. $(docker_registry) $(docker_registry) $(docker_registry)
            docker_username:                      # Username for Docker registry authentication. $(docker_username) $(docker_username) $(docker_username)
            docker_password:                      # Password for Docker registry authentication. Store this in a pipeline secret variable. $(docker_password) $(docker_password) $(docker_password)
            include_test_toolkit: false           # Include the full BC test toolkit in the image. $(include_test_toolkit) $(include_test_toolkit) $(include_test_toolkit)
            include_test_libraries_only: false    # Include only test libraries (not the full test toolkit). $(include_test_libraries_only) $(include_test_libraries_only) $(include_test_libraries_only)
            include_test_framework_only: false    # Include only the test framework (not test libraries or full toolkit). $(include_test_framework_only) $(include_test_framework_only) $(include_test_framework_only)
            include_performance_toolkit: false    # Include the BC performance toolkit in the image. $(include_performance_toolkit) $(include_performance_toolkit) $(include_performance_toolkit)
            license_file:                         # Path or URL to a BC license file (.flf or .bclicense) to embed in the image. $(license_file) $(license_file) $(license_file)
            accept_insider_eula: false            # Accept the Insider EULA for preview/insider artifact builds. $(accept_insider_eula) $(accept_insider_eula) $(accept_insider_eula)
            multitenant: false                    # Build a multitenant BC Docker image. $(multitenant) $(multitenant) $(multitenant)
    ```
- ALOps Docker Exec
  * Execute a PowerShell script inside a running Business Central Docker container. Supports inline scripts, file paths, workspace folder search, and URL downloads. BC management DLLs are automatically loaded before the user script runs.
  * YAML Template: 
    ```yaml
        - task: ALOpsDockerExec@3
          displayName: 'ALOps Docker Exec'
          inputs:
            fixed_tag:                            # Fixed container label. When set, the container is identified by this value instead of the build ID. $(fixed_tag) $(fixed_tag) $(fixed_tag)
            scriptsource: InLine                  # How to provide the script to execute. InLine: enter script text directly. Path: absolute or relative file path. Workfolder: search workspace recursively. Download: fetch from URL. $(scriptsource) $(scriptsource) $(scriptsource)
            script_location:                      # File path (for Path/Workfolder) or URL (for Download) of the script to execute. $(script_location) $(script_location) $(script_location)
            inline_script: Write-Host 'Hello World'# PowerShell script to execute inside the container. $(inline_script) $(inline_script) $(inline_script)
    ```
- ALOps Docker Remove
  * Stop and remove a Business Central Docker container. Optionally creates SQL and EventLog backups before removal, prints container logs, and performs Docker registry logout.
  * YAML Template: 
    ```yaml
        - task: ALOpsDockerRemove@3
          displayName: 'ALOps Docker Remove'
          inputs:
            fixed_tag:                            # Fixed container label. When set, the container is identified by this value instead of the build ID. $(fixed_tag) $(fixed_tag) $(fixed_tag)
            print_logs: true                      # Print all container logs before removal. Useful for post-mortem diagnostics. $(print_logs) $(print_logs) $(print_logs)
            createsqlbackup: disabled             # When to create a SQL database backup from the container. 'On Failure' requires job_status to be set (see Cleanup Options). $(createsqlbackup) $(createsqlbackup) $(createsqlbackup)
            sqlcompression: false                 # Use SQL backup compression. Not supported on SQL Server Express editions. $(sqlcompression) $(sqlcompression) $(sqlcompression)
            createeventlogbackup: disabled        # When to create an Application EventLog backup from the container. 'On Failure' requires job_status to be set (see Cleanup Options). $(createeventlogbackup) $(createeventlogbackup) $(createeventlogbackup)
            job_status: Succeeded                 # Pipeline job status for 'On Failure' backup logic. Set to 'Agent.JobStatus' in Azure DevOps or 'job.status' in GitHub Actions. $(job_status) $(job_status) $(job_status)
            docker_registry:                      # Docker registry URL for logout. Leave empty to skip logout. Should match the registry used in ALOps Docker Start. $(docker_registry) $(docker_registry) $(docker_registry)
    ```
- ALOps Docker Start
  * Start or reuse a Business Central Docker container. Handles Docker registry authentication (username/password), container creation with feature toggles, SQL database configuration, DLL add-in installation, Azure Key Vault setup, and build tagging.
  * YAML Template: 
    ```yaml
        - task: ALOpsDockerStart@3
          displayName: 'ALOps Docker Start'
          inputs:
            fixed_tag:                            # Fixed container label. When set, the container is tagged with this value instead of the build ID. Enables container reuse across builds. $(fixed_tag) $(fixed_tag) $(fixed_tag)
            ignore_no_container_warning: true     # Suppress the warning when no existing container is found for reuse. $(ignore_no_container_warning) $(ignore_no_container_warning) $(ignore_no_container_warning)
            docker_image:                         # Full Docker image name including tag, for example mcr.microsoft.com/businesscentral:ltsc2022. Leave empty to use the default BC sandbox image. $(docker_image) $(docker_image) $(docker_image)
            docker_pull: true                     # Pull the Docker image before creating the container. Disable to use a locally cached image. $(docker_pull) $(docker_pull) $(docker_pull)
            accept_image_eula: true               # Accept the End User License Agreement for the Business Central Docker image. $(accept_image_eula) $(accept_image_eula) $(accept_image_eula)
            accept_image_outdated: true           # Accept an outdated Docker image without failing the task. $(accept_image_outdated) $(accept_image_outdated) $(accept_image_outdated)
            container_restart: no                 # Docker restart policy for the container. $(container_restart) $(container_restart) $(container_restart)
            memory_gb: -1                         # Memory limit in GB for the container. Set to -1 for no limit. $(memory_gb) $(memory_gb) $(memory_gb)
            docker_parameters:                    # Additional parameters passed to docker create. One parameter per line. $(docker_parameters) $(docker_parameters) $(docker_parameters)
            enable_symbol_loading: false          # Enable symbol loading in the Business Central server instance. $(enable_symbol_loading) $(enable_symbol_loading) $(enable_symbol_loading)
            enable_api_services: false            # Enable API services in the Business Central server instance. $(enable_api_services) $(enable_api_services) $(enable_api_services)
            multitenant: false                    # Configure the Business Central server instance for multitenancy. $(multitenant) $(multitenant) $(multitenant)
            docker_authentication: None           # Authentication method for the Docker registry. $(docker_authentication) $(docker_authentication) $(docker_authentication)
            docker_username:                      # Username for Docker registry authentication. $(docker_username) $(docker_username) $(docker_username)
            docker_password:                      # Password for Docker registry authentication. Store this in a pipeline secret variable. $(docker_password) $(docker_password) $(docker_password)
            docker_registry:                      # Docker registry URL. When empty, the registry is derived from the image name. $(docker_registry) $(docker_registry) $(docker_registry)
            sql_server:                           # External SQL Server hostname. Leave empty to use the container's built-in SQL instance. $(sql_server) $(sql_server) $(sql_server)
            sql_server_instance:                  # SQL Server named instance. $(sql_server_instance) $(sql_server_instance) $(sql_server_instance)
            sql_database:                         # SQL database name to use for the Business Central service tier. $(sql_database) $(sql_database) $(sql_database)
            sql_database_user:                    # SQL Server authentication username. $(sql_database_user) $(sql_database_user) $(sql_database_user)
            sql_database_user_password:           # SQL Server authentication password. Store this in a pipeline secret variable. $(sql_database_user_password) $(sql_database_user_password) $(sql_database_user_password)
            sql_backup_file:                      # Path to a .bak file to restore into the container's SQL instance. $(sql_backup_file) $(sql_backup_file) $(sql_backup_file)
            licensefile:                          # Path to a Business Central license file (.flf or .bclicense) to import into the container. $(licensefile) $(licensefile) $(licensefile)
            encryption_key:                       # Path to an encryption key file to import into the container. $(encryption_key) $(encryption_key) $(encryption_key)
            taskscheduler: Keep                   # Configure the BC task scheduler. Keep preserves the default, Enable starts it, Disable stops it. $(taskscheduler) $(taskscheduler) $(taskscheduler)
            keyvault_pfxfile:                     # Path to the PFX certificate file for Azure Key Vault authentication. $(keyvault_pfxfile) $(keyvault_pfxfile) $(keyvault_pfxfile)
            keyvault_pfxpassword:                 # Password for the PFX certificate. Store this in a pipeline secret variable. $(keyvault_pfxpassword) $(keyvault_pfxpassword) $(keyvault_pfxpassword)
            keyvault_clientid:                    # Azure AD application (client) ID used for Key Vault authentication. $(keyvault_clientid) $(keyvault_clientid) $(keyvault_clientid)
            keyvault_publisher_validation: false  # Enable publisher validation for Key Vault extension settings. $(keyvault_publisher_validation) $(keyvault_publisher_validation) $(keyvault_publisher_validation)
    ```
- ALOps Docker Wait
  * Wait for a Business Central Docker container to become ready by polling its logs. Extracts connection info (IP, hostname, web client URL, admin credentials) and optionally copies the workspace into the container.
  * YAML Template: 
    ```yaml
        - task: ALOpsDockerWait@3
          displayName: 'ALOps Docker Wait'
          inputs:
            fixed_tag:                            # Fixed container label. When set, the container is identified by this value instead of the build ID. $(fixed_tag) $(fixed_tag) $(fixed_tag)
            search_string: Ready for connections! # Log line(s) that indicate the container is ready. One pattern per line. $(search_string) $(search_string) $(search_string)
            warning_string:                       # Log line(s) that trigger a warning. One pattern per line. $(warning_string) $(warning_string) $(warning_string)
            error_string:                         # Log line(s) that trigger an immediate failure. One pattern per line. $(error_string) $(error_string) $(error_string)
            printlogs: true                       # Print container log lines to the build output while polling. $(printlogs) $(printlogs) $(printlogs)
            setup_working_folder: true            # Copy the workspace into the container after it becomes ready. $(setup_working_folder) $(setup_working_folder) $(setup_working_folder)
            usecompression: true                  # Compress the workspace before copying into the container. Faster for large workspaces. $(usecompression) $(usecompression) $(usecompression)
            exclude_git_folder: false             # Exclude the .git folder when copying the workspace into the container. $(exclude_git_folder) $(exclude_git_folder) $(exclude_git_folder)
    ```
- ALOps Extension API
  * Get, publish, or batch-publish Business Central extensions via the BC Automation REST API. Supports SaaS environments (OAuth2 client credentials, client certificate, or user impersonation) and on-premises (basic or Windows authentication). Use 'get' to list installed extensions, 'publish' for a single .app file, or 'batch' for multiple .app files in dependency order.
  * YAML Template: 
    ```yaml
        - task: ALOpsExtensionAPI@3
          displayName: 'ALOps Extension API'
          inputs:
            authentication: oauth                 # Authentication method for the API connection. oauth uses Azure AD service-to-service tokens (recommended for SaaS). basic and usernamepassword use user credentials. windows uses Windows integrated authentication (on-premises only, Windows agents only). $(authentication) $(authentication) $(authentication)
            azure_tenant_id:                      # Azure Active Directory tenant ID (GUID or domain) of the Business Central SaaS tenant. $(azure_tenant_id) $(azure_tenant_id) $(azure_tenant_id)
            azure_app_client_id:                  # Application (client) ID of the Azure AD app registration used for OAuth authentication. $(azure_app_client_id) $(azure_app_client_id) $(azure_app_client_id)
            azure_app_client_secret:              # Client secret of the Azure AD app registration. Store this value in a pipeline secret variable or Azure Key Vault, never in plain text. $(azure_app_client_secret) $(azure_app_client_secret) $(azure_app_client_secret)
            azure_app_client_certificate:         # Path, base-64 encoded content, or certificate store reference (CERT:\...) of the certificate (.pfx) used instead of a client secret for Azure AD app authentication. $(azure_app_client_certificate) $(azure_app_client_certificate) $(azure_app_client_certificate)
            azure_app_client_certificate_password: # Password protecting the client certificate. Store this in a pipeline secret variable. $(azure_app_client_certificate_password) $(azure_app_client_certificate_password) $(azure_app_client_certificate_password)
            username:                             # Business Central user account name. Used for basic or usernamepassword authentication, or for on-behalf-of OAuth flow. Leave empty for Service-to-Service (app-only) OAuth authentication. $(username) $(username) $(username)
            password:                             # Password for the Business Central user account. Store this in a pipeline secret variable. $(password) $(password) $(password)
            interaction: get                      # API operation to perform. get lists extensions currently installed on the environment. publish deploys a single .app file. batch deploys multiple .app files in dependency order. $(interaction) $(interaction) $(interaction)
            api_endpoint:                         # Base URL of the Business Central API, for example https://api.businesscentral.dynamics.com/v2.0/{tenant}/Sandbox/api for SaaS or http://server:port/BC/api for on-premises. $(api_endpoint) $(api_endpoint) $(api_endpoint)
            dev_endpoint:                         # URL of the Business Central development endpoint used when deploying via the DEV port, for example http://server:7049/BC/dev. When set, extensions are published to this endpoint instead of the automation API. $(dev_endpoint) $(dev_endpoint) $(dev_endpoint)
            apiversion: v1.0                      # Version of the Business Central Automation API to use. Supported values are beta, v1.0, and v2.0. Use v2.0 for access to schedule and schema sync mode features. $(apiversion) $(apiversion) $(apiversion)
            bccompany:                            # Name or GUID of the Business Central company context for the API call. Leave empty to use the default (first) company. $(bccompany) $(bccompany) $(bccompany)
            dev_schemeupdatemode: synchronize     # Schema update mode when publishing via the DEV endpoint. synchronize adds new schema objects. recreate drops and recreates tables. forcesync allows breaking changes. $(dev_schemeupdatemode) $(dev_schemeupdatemode) $(dev_schemeupdatemode)
            dev_dependencypublishingoption: none  # Dependency handling when publishing via the DEV endpoint. none skips dependencies. default resolves them automatically. ignore skips dependency checks. strict fails if any dependency is missing. $(dev_dependencypublishingoption) $(dev_dependencypublishingoption) $(dev_dependencypublishingoption)
            replacepackageid: false               # Generate a new package GUID for each deployment. This forces Business Central to treat each deploy as a fresh installation rather than an upgrade. $(replacepackageid) $(replacepackageid) $(replacepackageid)
            blocksymbolsonly: false               # When enabled, the task checks whether the .app is a symbols-only package and blocks deployment if it is, preventing accidental publishing of placeholder apps. $(blocksymbolsonly) $(blocksymbolsonly) $(blocksymbolsonly)
            schedule: current                     # Deployment schedule for the extension. current deploys immediately. nextminor schedules for the next minor BC update. nextmajor schedules for the next major update. Requires API version 2.0. $(schedule) $(schedule) $(schedule)
            schema_sync_mode: add                 # Schema synchronization mode for the extension deployment. add only adds new schema objects. forcesync allows breaking schema changes. Requires API version 2.0. $(schema_sync_mode) $(schema_sync_mode) $(schema_sync_mode)
            showdeploymentstatus: true            # When enabled, the task polls and displays the extension deployment status after publishing until the operation completes or times out. $(showdeploymentstatus) $(showdeploymentstatus) $(showdeploymentstatus)
            checksecondsdelay: 30                 # Number of seconds to wait between polls when checking deployment status. Increase this for environments with slower deployment operations. $(checksecondsdelay) $(checksecondsdelay) $(checksecondsdelay)
            maxtries: 20                          # Maximum number of deployment status polls before the task times out. Multiply by Check Delay to calculate the total maximum wait time. $(maxtries) $(maxtries) $(maxtries)
            artifact_path:                        # Folder containing the .app files to deploy. For publish mode this is the folder where the single .app file is located. For batch mode this is the root folder scanned recursively for .app files. $(artifact_path) $(artifact_path) $(artifact_path)
            artifact_filter: *.app                # Glob filter applied inside artifact_path to select which .app files to deploy, for example *.app. $(artifact_filter) $(artifact_filter) $(artifact_filter)
            altool_package_version:               # Version of the ALTool NuGet package to install for app metadata extraction. Required for publish and batch interactions. Leave empty to skip installation (get interaction only). $(altool_package_version) $(altool_package_version) $(altool_package_version)
    ```
- ALOps Info
  * Collects comprehensive build-agent diagnostics: CPU, memory, disk, .NET frameworks, Docker, CI agent info, and BC application version discovery. Optionally enforces free memory/disk thresholds and checks for running Docker containers.
  * YAML Template: 
    ```yaml
        - task: ALOpsInfo@3
          displayName: 'ALOps Info'
          inputs:
            free_mem_threshold: 0                 # Minimum free memory percentage required. Set to 0 to disable the check. $(free_mem_threshold) $(free_mem_threshold) $(free_mem_threshold)
            free_mem_threshold_action: Warn       # Action to take when free memory is below the threshold. $(free_mem_threshold_action) $(free_mem_threshold_action) $(free_mem_threshold_action)
            free_disk_threshold: 0                # Minimum free disk space percentage required per drive. Set to 0 to disable the check. $(free_disk_threshold) $(free_disk_threshold) $(free_disk_threshold)
            free_disk_threshold_action: Warn      # Action to take when free disk space is below the threshold. $(free_disk_threshold_action) $(free_disk_threshold_action) $(free_disk_threshold_action)
            docker_containers_action: Error       # Action to take when Docker containers are found on the agent. Set to Ignore to skip the check. $(docker_containers_action) $(docker_containers_action) $(docker_containers_action)
    ```
- ALOps NuGet Download
  * Download Business Central extension packages (.app) from NuGet feeds. Supports NuGet protocol v2 (OData/XML) and v3 (JSON/REST) with automatic detection. Resolves transitive dependencies. Publishes a resolved.json artifact listing all downloaded packages.
  * YAML Template: 
    ```yaml
        - task: ALOpsNuGetDownload@3
          displayName: 'ALOps NuGet Download'
          inputs:
            nuget_username:                       # Username for the NuGet source. For Azure DevOps feeds, use any value (e.g. 'az') combined with a PAT as password. $(nuget_username) $(nuget_username) $(nuget_username)
            nuget_password:                       # Password or Personal Access Token (PAT) for the NuGet source. $(nuget_password) $(nuget_password) $(nuget_password)
            nuget_source_apikey:                  # API Key for the NuGet source. When set, used as Bearer token and X-NuGet-ApiKey header. $(nuget_source_apikey) $(nuget_source_apikey) $(nuget_source_apikey)
            nuget_protocol_version: auto          # NuGet protocol version to use. 'auto' detects based on feed URL and service index. $(nuget_protocol_version) $(nuget_protocol_version) $(nuget_protocol_version)
            nuget_spec_file: nuget.json           # Path to the nuget.json spec file that defines feeds and package dependencies. Relative paths resolve from the workspace root. $(nuget_spec_file) $(nuget_spec_file) $(nuget_spec_file)
            nuget_select_type_filter:             # Wildcard filter for type names defined in the nuget.json spec file. Leave empty to process all types. $(nuget_select_type_filter) $(nuget_select_type_filter) $(nuget_select_type_filter)
            download_folder:                      # Target folder where .app files will be downloaded. Defaults to a 'nuget' subfolder in the workspace. $(download_folder) $(download_folder) $(download_folder)
            artifact_folder_name: Nuget           # Artifact folder name used when uploading the resolved.json as a build artifact. $(artifact_folder_name) $(artifact_folder_name) $(artifact_folder_name)
            dependency_publisher_filter:          # Semicolon-separated list of publisher names to include when resolving dependencies. Leave empty to allow all publishers. Set to 'NONE' to skip dependency resolution entirely. $(dependency_publisher_filter) $(dependency_publisher_filter) $(dependency_publisher_filter)
            skip_microsoft_apps: true             # Skip packages whose ID starts with 'microsoft.' during dependency resolution. $(skip_microsoft_apps) $(skip_microsoft_apps) $(skip_microsoft_apps)
    ```
- ALOps NuGet Publish
  * Publishes Business Central .app files as NuGet packages to any NuGet-compatible feed. Reads app manifests via altool.exe GetPackageManifest, builds .nupkg files using pure-PowerShell ZIP assembly (no nuget.exe), and pushes via dotnet nuget push.
  * YAML Template: 
    ```yaml
        - task: ALOpsNuGetPublish@3
          displayName: 'ALOps NuGet Publish'
          inputs:
            altool_package_version: 18.0.33.65164-beta# Version of the microsoft.dynamics.businesscentral.development.tools NuGet package. Pin to a specific version for reproducible builds. $(altool_package_version) $(altool_package_version) $(altool_package_version)
            nuget_username:                       # Username for the NuGet source. For Azure DevOps feeds, use any value (e.g. 'az') combined with a PAT as password. $(nuget_username) $(nuget_username) $(nuget_username)
            nuget_password:                       # Password or Personal Access Token (PAT) for the NuGet source. $(nuget_password) $(nuget_password) $(nuget_password)
            nuget_source_apikey:                  # API Key for the NuGet source. When set, used with dotnet nuget push --api-key. $(nuget_source_apikey) $(nuget_source_apikey) $(nuget_source_apikey)
            nuget_source_uri:                     # NuGet feed URL to push packages to. $(nuget_source_uri) $(nuget_source_uri) $(nuget_source_uri)
            artifact_path:                        # Root folder to scan recursively for .app files. Leave empty to use the workspace directory. $(artifact_path) $(artifact_path) $(artifact_path)
            artifact_filter: *.app                # File filter pattern for selecting .app files to package and publish. $(artifact_filter) $(artifact_filter) $(artifact_filter)
            suffix:                               # Suffix to append to the NuGet package version (e.g. '-preview'). Leave empty for no suffix. $(suffix) $(suffix) $(suffix)
            use_suffix_for_dependencies_same_publisher: false# When enabled, applies the version suffix to dependency version ranges for dependencies from the same publisher. $(use_suffix_for_dependencies_same_publisher) $(use_suffix_for_dependencies_same_publisher) $(use_suffix_for_dependencies_same_publisher)
            keep_app_filename: false              # When enabled, uses the original .app filename as the .app entry inside the .nupkg instead of generating a standardized name. $(keep_app_filename) $(keep_app_filename) $(keep_app_filename)
    ```
- ALOps OpenAPI
  * Generate OpenAPI 3.0 specifications from Business Central APIs. Supports automatic route discovery, manual route selection, and export to EDMX, JSON, and YAML formats. Authenticate via OAuth2 (client credentials or client certificate), basic auth, Windows integrated auth, or username/password.
  * YAML Template: 
    ```yaml
        - task: ALOpsOpenAPI@3
          displayName: 'ALOps OpenAPI'
          inputs:
            api_endpoint: https://api.businesscentral.dynamics.com/v2.0/$(azure_tenant_id)/Sandbox/api# Base URL of the Business Central API. Use $(azure_tenant_id) as a placeholder — it is replaced at runtime with the azure_tenant_id input value. $(api_endpoint) $(api_endpoint) $(api_endpoint)
            authentication: oauth                 # Authentication method for the API connection. oauth uses Azure AD service-to-service tokens (recommended for SaaS). basic and usernamepassword use user credentials. windows uses Windows integrated authentication (on-premises only). $(authentication) $(authentication) $(authentication)
            azure_tenant_id:                      # Azure Active Directory tenant ID (GUID or domain) of the Business Central SaaS tenant. $(azure_tenant_id) $(azure_tenant_id) $(azure_tenant_id)
            azure_app_client_id:                  # Application (client) ID of the Azure AD app registration used for OAuth authentication. $(azure_app_client_id) $(azure_app_client_id) $(azure_app_client_id)
            azure_app_client_secret:              # Client secret of the Azure AD app registration. Store this value in a pipeline secret variable or Azure Key Vault, never in plain text. $(azure_app_client_secret) $(azure_app_client_secret) $(azure_app_client_secret)
            azure_app_client_certificate:         # Path, base-64 encoded content, or certificate store reference (CERT:\...) of the certificate (.pfx) used instead of a client secret for Azure AD app authentication. $(azure_app_client_certificate) $(azure_app_client_certificate) $(azure_app_client_certificate)
            azure_app_client_certificate_password: # Password protecting the client certificate. Store this in a pipeline secret variable. $(azure_app_client_certificate_password) $(azure_app_client_certificate_password) $(azure_app_client_certificate_password)
            username:                             # Business Central user account name. Used for basic or usernamepassword authentication. $(username) $(username) $(username)
            password:                             # Password for the Business Central user account. Store this in a pipeline secret variable. $(password) $(password) $(password)
            usedocker: false                      # Run the OpenAPI generation inside a Docker container instead of the host agent. $(usedocker) $(usedocker) $(usedocker)
            fixed_tag:                            # Fixed tag to identify the Docker container. When empty, the build label is used. $(fixed_tag) $(fixed_tag) $(fixed_tag)
            discover: true                        # Automatically discover available API routes from the Business Central runtime API. $(discover) $(discover) $(discover)
            api_routes:                           # Manual list of API routes to convert (one per line or pipe-delimited). Used when discover is false. $(api_routes) $(api_routes) $(api_routes)
            api_exclude_routes:                   # Routes to exclude from automatic discovery (one per line or pipe-delimited). $(api_exclude_routes) $(api_exclude_routes) $(api_exclude_routes)
            inspect_paths: false                  # Print all discovered API paths for each route to the build log. $(inspect_paths) $(inspect_paths) $(inspect_paths)
            api_servers:                          # Custom server URLs to include in the OpenAPI specification (one per line or pipe-delimited). When empty, the original API endpoint is used. $(api_servers) $(api_servers) $(api_servers)
            export_edmx: false                    # Export the raw EDMX metadata alongside the OpenAPI specification. $(export_edmx) $(export_edmx) $(export_edmx)
            export_yaml: true                     # Export the OpenAPI specification in YAML format. $(export_yaml) $(export_yaml) $(export_yaml)
            export_json: false                    # Export the OpenAPI specification in JSON format. $(export_json) $(export_json) $(export_json)
            publish_artifacts: true               # Upload the generated OpenAPI files as build artifacts. $(publish_artifacts) $(publish_artifacts) $(publish_artifacts)
            exclude_company_paths: false          # Exclude company-scoped paths from the OpenAPI specification. When enabled, a company header parameter is added instead. $(exclude_company_paths) $(exclude_company_paths) $(exclude_company_paths)
    ```
- ALOps Package Import
  * Import Business Central RapidStart configuration packages (.rapidstart files) into a BC instance. Supports three connection modes: local (BC Management DLLs on the agent), docker (BC inside a container), and api (BC Automation REST API with OAuth, basic, windows, or username/password authentication). Auto mode detects the best connection method from the inputs provided. Generates XUnit test reports and verifies package import errors.
  * YAML Template: 
    ```yaml
        - task: ALOpsPackageImport@3
          displayName: 'ALOps Package Import'
          inputs:
            connection_mode: auto                 # How to connect to Business Central. auto detects the mode from inputs: if fixed_tag is set, uses docker; if api_endpoint is set, uses api; otherwise uses local. Set explicitly to avoid ambiguity. $(connection_mode) $(connection_mode) $(connection_mode)
            nav_serverinstance: BC                # BC server instance name for local and docker modes. Typically 'BC' for modern versions. $(nav_serverinstance) $(nav_serverinstance) $(nav_serverinstance)
            fixed_tag:                            # Docker container label value used to locate the target container. Only used in docker mode. $(fixed_tag) $(fixed_tag) $(fixed_tag)
            authentication: oauth                 # Authentication method for the API connection. oauth uses Azure AD service-to-service tokens (recommended for SaaS). basic and usernamepassword use user credentials. windows uses Windows integrated authentication (on-premises only, Windows agents only). $(authentication) $(authentication) $(authentication)
            azure_tenant_id:                      # Azure Active Directory tenant ID (GUID or domain) of the Business Central SaaS tenant. $(azure_tenant_id) $(azure_tenant_id) $(azure_tenant_id)
            azure_app_client_id:                  # Application (client) ID of the Azure AD app registration used for OAuth authentication. $(azure_app_client_id) $(azure_app_client_id) $(azure_app_client_id)
            azure_app_client_secret:              # Client secret of the Azure AD app registration. Store this value in a pipeline secret variable or Azure Key Vault, never in plain text. $(azure_app_client_secret) $(azure_app_client_secret) $(azure_app_client_secret)
            azure_app_client_certificate:         # Path, base-64 encoded content, or certificate store reference (CERT:\...) of the certificate (.pfx) used instead of a client secret for Azure AD app authentication. $(azure_app_client_certificate) $(azure_app_client_certificate) $(azure_app_client_certificate)
            azure_app_client_certificate_password: # Password protecting the client certificate. Store this in a pipeline secret variable. $(azure_app_client_certificate_password) $(azure_app_client_certificate_password) $(azure_app_client_certificate_password)
            username:                             # Business Central user account name. Used for basic or usernamepassword authentication, or for on-behalf-of OAuth flow. $(username) $(username) $(username)
            password:                             # Password for the Business Central user account. Store this in a pipeline secret variable. $(password) $(password) $(password)
            api_endpoint:                         # Base URL of the Business Central API, for example https://api.businesscentral.dynamics.com/v2.0/{tenant}/Sandbox/api for SaaS or http://server:port/BC/api for on-premises. Required for API mode. $(api_endpoint) $(api_endpoint) $(api_endpoint)
            apiversion: v1.0                      # Version of the Business Central Automation API to use. Supported values are beta, v1.0, and v2.0. $(apiversion) $(apiversion) $(apiversion)
            bccompany:                            # Name or GUID of the Business Central company context for the API call. Leave empty to use the default (first) company. $(bccompany) $(bccompany) $(bccompany)
            package_path:                         # Folder to scan for RapidStart package files. Defaults to the workspace directory when empty. $(package_path) $(package_path) $(package_path)
            package_filter: *.rapidstart          # Glob filter for discovering RapidStart package files in the package path. $(package_filter) $(package_filter) $(package_filter)
            package_config:                       # Path to a rapidstart.json configuration file that specifies packages to import. When set, overrides package path scanning. $(package_config) $(package_config) $(package_config)
            delete_before_import: true            # Delete the existing configuration package (by code) before creating and importing the new one. $(delete_before_import) $(delete_before_import) $(delete_before_import)
            checksecondsdelay: 30                 # Number of seconds to wait between polls when checking async import/apply status in API mode. $(checksecondsdelay) $(checksecondsdelay) $(checksecondsdelay)
            maxtries: 20                          # Maximum number of status polls before the task times out. Multiply by Check Delay to calculate total maximum wait time. Prevents infinite loops. $(maxtries) $(maxtries) $(maxtries)
            generate_test_report: true            # Generate an XUnit XML test report summarizing the import results for each package. $(generate_test_report) $(generate_test_report) $(generate_test_report)
            test_report_path:                     # Custom output path for the XUnit test report. Defaults to a temporary directory when empty. $(test_report_path) $(test_report_path) $(test_report_path)
            publish_test_report: true             # Upload the generated XUnit test report as a build artifact via Publish-ALOpsArtifact. $(publish_test_report) $(publish_test_report) $(publish_test_report)
            verify_after_import: true             # Query ConfigurationPackageErrors after import to detect and report individual field/record errors. $(verify_after_import) $(verify_after_import) $(verify_after_import)
            fail_on_package_errors: true          # Fail the task when any package has import errors. When disabled, errors are reported as warnings. $(fail_on_package_errors) $(fail_on_package_errors) $(fail_on_package_errors)
    ```
- ALOps App Publish
  * Publish and install Business Central .app files to a BC server instance. Supports single app publish, batch publish of multiple apps in dependency order, and optional AL TestTool library installation. Works locally or inside Docker containers.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppPublish@3
          displayName: 'ALOps App Publish'
          inputs:
            nav_serverinstance: BC                # Business Central server instance name (e.g. BC). $(nav_serverinstance) $(nav_serverinstance) $(nav_serverinstance)
            install_published_apps: true          # Install apps after publishing. Disable to publish without installing. $(install_published_apps) $(install_published_apps) $(install_published_apps)
            skip_verification: true               # Skip code signing verification during publish. $(skip_verification) $(skip_verification) $(skip_verification)
            publish_scope: Global                 # Publishing scope: Global (all tenants) or Tenant (specific tenant only). $(publish_scope) $(publish_scope) $(publish_scope)
            tenant: default                       # Target tenant ID for publish and install operations. $(tenant) $(tenant) $(tenant)
            force_install: false                  # Reinstall app even if already installed. $(force_install) $(force_install) $(force_install)
            force_sync: false                     # Force schema synchronization mode. $(force_sync) $(force_sync) $(force_sync)
            artifact_path:                        # Path to the folder containing .app files. Leave empty to scan the workspace directory. $(artifact_path) $(artifact_path) $(artifact_path)
            nav_artifact_app_filter: *.app        # Glob filter for .app files to publish. $(nav_artifact_app_filter) $(nav_artifact_app_filter) $(nav_artifact_app_filter)
            batch_publish_folder:                 # Folder containing multiple .app files for batch publishing in dependency order. $(batch_publish_folder) $(batch_publish_folder) $(batch_publish_folder)
            block_symbols_only: false             # Block publishing of symbols-only app packages. $(block_symbols_only) $(block_symbols_only) $(block_symbols_only)
            exclude_microsoft_apps: true          # Skip publishing any app whose manifest Publisher is 'Microsoft' (case-insensitive). Applied after dependency ordering so manifest data is available. Works in Docker and non-Docker modes. $(exclude_microsoft_apps) $(exclude_microsoft_apps) $(exclude_microsoft_apps)
            usedocker: false                      # Run publish inside a Docker container. Apps are copied in, published, and results copied back. $(usedocker) $(usedocker) $(usedocker)
            fixed_tag:                            # Fixed container label. When set, uses this value to locate the Docker container instead of the build ID. $(fixed_tag) $(fixed_tag) $(fixed_tag)
            install_al_test_tool: false           # Install AL test libraries and test runner from the BC server's built-in apps. $(install_al_test_tool) $(install_al_test_tool) $(install_al_test_tool)
            install_al_app_names: Tests-TestLibraries
    System Application Test
    System Application Test Library
    Any
    Library Assert
    Library Variable Storage
    Test Runner# Names of test library apps to install (one per line). These are matched against the built-in apps on the BC server. $(install_al_app_names) $(install_al_app_names) $(install_al_app_names)
            strict_app_names: false               # Only install the exact apps listed in Test App Names. When disabled, version-specific test apps may be added automatically. $(strict_app_names) $(strict_app_names) $(strict_app_names)
            publisher_azure_ad_tenant_id:         # Azure AD tenant ID for per-tenant publisher authentication. Required when publishing to a multi-tenant environment with per-tenant isolation. $(publisher_azure_ad_tenant_id) $(publisher_azure_ad_tenant_id) $(publisher_azure_ad_tenant_id)
    ```

