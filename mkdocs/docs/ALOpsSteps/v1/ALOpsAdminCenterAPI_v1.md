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
        interaction: environment_list         # Admin Center API operation to execute: environment_list or environment_get reads environment info; environment_copy or environment_rename manages environments; environment_update_schedule selects the target version and date for the next environment update; app_install, app_uninstall, or app_update manages extensions; set_application_insightskey, set_security_group or set_update_window applies configuration. $(interaction)
        api_version:                          # Override the Business Central Admin Center API version, for example 'v2.28'. Leave empty to use the ALOps built-in default. See https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/administration-center-api for available versions. $(api_version)
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
        update_window_start:                  # Start of the environment update window in 24-hour 'HH:mm' notation, for example '22:00'. Used with the set_update_window interaction. $(update_window_start)
        update_window_end:                    # End of the environment update window in 24-hour 'HH:mm' notation, for example '06:00'. The window may span midnight and must be at least 6 hours long. Used with the set_update_window interaction. $(update_window_end)
        update_window_timezone:               # Windows time zone id in which the update window times are expressed, for example 'W. Europe Standard Time', 'Romance Standard Time' or 'UTC'. Required for the set_update_window interaction. Valid values are returned by the Admin Center API route /applications/settings/timezones. $(update_window_timezone)
        update_target_version:                # Business Central version to select for the next environment update, for example '27.1', as returned by the Admin Center API updates list. Leave empty to select the latest released (GA) version. Used with the environment_update_schedule interaction. $(update_target_version)
        update_datetime:                      # Date or date-time (ISO 8601, UTC assumed when no offset is given) on or after which the environment update runs, for example '2026-09-12' or '2026-09-12T22:00:00Z'. A date without time is scheduled at 12:00 UTC. Leave empty to schedule the update as soon as the update window allows. Used with the environment_update_schedule interaction. $(update_datetime)
        ignore_update_window: False           # When enabled, the scheduled environment update starts at the selected date-time even when that is outside the update window. Used with the environment_update_schedule interaction. $(ignore_update_window)
```

