```yaml
    - task: ALOpsSaaSPublishExtension@1
      displayName: 'ALOps SaaS Publish Extension'
      inputs:
        azure_api_endpoint: api.businesscentral.dynamics.com# Azure API Endpoint. $(azure_api_endpoint)
        azure_api_version: v2.0               # Azure API Endpoint version. $(azure_api_version)
        azure_tenant_id:                      # Azure Tenant Id. $(azure_tenant_id)
        azure_app_client_id:                  # Azure AD Application Client Id. $(azure_app_client_id)
        azure_app_client_secret:              # Azure AD Application Client Secret. $(azure_app_client_secret)
        bc_impersonate_user:                  # Business Central User to impersonate. $(bc_impersonate_user)
        bc_impersonate_password:              # Business Central User Password to impersonate. $(bc_impersonate_password)
        bc_environment: sandbox               # Business Central environment to publish extension on. $(bc_environment)
        bc_companyname:                       # Business Central Company. $(bc_companyname)
        artifact_path:                        # Path for App Artifact. $(artifact_path)
        app_artifact_filter: *.app            # Filter used for locating App file relative to $(path_to_publish). $(app_artifact_filter)
```

