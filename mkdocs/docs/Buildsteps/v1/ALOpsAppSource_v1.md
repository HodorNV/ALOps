    ```yaml
        - task: ALOpsAppSource@1
          displayName: 'ALOps AppSource'
          inputs:
            azure_tenant_id:                      # Azure Tenant Id. Only required for BC SaaS $(azure_tenant_id)
            azure_app_client_id:                  # Azure AD Application Client Id. $(azure_app_client_id)
            azure_app_client_secret:              # Azure AD Application Client Secret. $(azure_app_client_secret)
    ```

