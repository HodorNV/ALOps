```yaml
    - task: ALOpsAppSource@1
      displayName: 'ALOps AppSource'
      inputs:
        azure_tenant_id:                      # Azure Tenant Id. Only required for BC SaaS $(azure_tenant_id)
        azure_app_client_id:                  # Azure AD Application Client Id. $(azure_app_client_id)
        azure_app_client_secret:              # Azure AD Application Client Secret. $(azure_app_client_secret)
        apply_offering_version_filter: False  # Apply version filter to the AppSource Apps. New Offering must have a Higher version for it to upload. $(apply_offering_version_filter)
        autopromote: False                    # Auto Promote AppSource App after publish. $(autopromote)
        autopromote_checksecondsdelay: 30     # Seconds of delay betweel deployment status checks. $(autopromote_checksecondsdelay)
        autopromote_maxtries: 120             # Max tries for status check. $(autopromote_maxtries)
        offering_name_filter_array:           # Semicolon-separated list of offering names to filter. $(offering_name_filter_array)
        pwsh: False                           # Run task in Powershell Core. $(pwsh)
```

