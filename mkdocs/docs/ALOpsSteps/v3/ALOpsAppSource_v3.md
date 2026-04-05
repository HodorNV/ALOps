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

