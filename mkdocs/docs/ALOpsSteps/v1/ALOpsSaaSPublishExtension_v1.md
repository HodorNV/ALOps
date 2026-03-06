```yaml
    - task: ALOpsSaaSPublishExtension@1
      displayName: 'ALOps SaaS Publish Extension'
      inputs:
        azure_api_endpoint: api.businesscentral.dynamics.com# Deprecated: use the ALOps Extension API task instead. Hostname of the Business Central API endpoint, for example api.businesscentral.dynamics.com. $(azure_api_endpoint)
        azure_api_version: v2.0               # Deprecated: use the ALOps Extension API task instead. Version of the Business Central API to call. $(azure_api_version)
        azure_tenant_id:                      # Deprecated: use the ALOps Extension API task instead. Azure Active Directory tenant ID of the Business Central SaaS tenant. $(azure_tenant_id)
        azure_app_client_id:                  # Deprecated: use the ALOps Extension API task instead. Application (client) ID of the Azure AD app registration used for authentication. $(azure_app_client_id)
        azure_app_client_secret:              # Deprecated: use the ALOps Extension API task instead. Client secret of the Azure AD app registration. Store this in a pipeline secret variable. $(azure_app_client_secret)
        bc_impersonate_user:                  # Deprecated: use the ALOps Extension API task instead. Business Central user account to impersonate when calling the API. $(bc_impersonate_user)
        bc_impersonate_password:              # Deprecated: use the ALOps Extension API task instead. Password of the Business Central user to impersonate. Store this in a pipeline secret variable. $(bc_impersonate_password)
        bc_environment: sandbox               # Deprecated: use the ALOps Extension API task instead. Name of the Business Central environment to publish the extension to, for example Sandbox or Production. $(bc_environment)
        bc_companyname:                       # Deprecated: use the ALOps Extension API task instead. Name of the Business Central company scope for the API request. $(bc_companyname)
        artifact_path:                        # Deprecated: use the ALOps Extension API task instead. Folder containing the .app file to publish. $(artifact_path)
        app_artifact_filter: *.app            # Deprecated: use the ALOps Extension API task instead. Glob filter to select the .app file to publish from artifact_path. $(app_artifact_filter)
```

