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

