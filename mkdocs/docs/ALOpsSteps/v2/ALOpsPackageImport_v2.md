```yaml
    - task: ALOpsPackageImport@2
      displayName: 'ALOps Package Import'
      inputs:
        packagesfolder: $(System.DefaultWorkingDirectory)# Set the folder where the packages are located $(packagesfolder) $(packagesfolder)
        api_endpoint: https://api.businesscentral.dynamics.com/v2.0/$(azure_tenant_id)/Sandbox/api# Set API Endpoint. (protocol://host:port/serverinstance/api) $(api_endpoint) $(api_endpoint)
        apiversion: v1.0                      # Version of the API to use (beta / v1.0 / v2.0) $(apiversion) $(apiversion)
        authentication: oauth                 # Set authentication Method to use. Default [Windows]. $(authentication) $(authentication)
        azure_tenant_id:                      # Azure Tenant Id. Only required for BC SaaS $(azure_tenant_id) $(azure_tenant_id)
        azure_app_client_id:                  # Azure AD Application Client Id. $(azure_app_client_id) $(azure_app_client_id)
        azure_app_client_secret:              # Azure AD Application Client Secret. $(azure_app_client_secret) $(azure_app_client_secret)
        azure_app_client_certificate:         # Azure AD Application Client Certificate. $(azure_app_client_certificate) $(azure_app_client_certificate)
        azure_app_client_certificate_password: # Azure AD Application Client Certificate Password. $(azure_app_client_certificate_password) $(azure_app_client_certificate_password)
        username:                             # Business Central Username. Leave empty for Service-2-Service authentication. $(username) $(username)
        password:                             # Business Central User Password. Leave empty for Service-2-Service authentication. $(password) $(password)
        bccompany:                            # Business Central Company (Id or Name). $(bccompany) $(bccompany)
```

