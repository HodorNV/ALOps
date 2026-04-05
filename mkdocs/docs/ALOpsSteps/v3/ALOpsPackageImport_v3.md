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

