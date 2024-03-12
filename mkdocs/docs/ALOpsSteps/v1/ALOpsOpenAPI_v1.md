```yaml
    - task: ALOpsOpenAPI@1
      displayName: 'ALOps OpenAPI'
      inputs:
        usedocker: False                      # Run task in Docker container. $(usedocker)
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
        api_endpoint: https://api.businesscentral.dynamics.com/v2.0/$(azure_tenant_id)/Sandbox/api# Set API Endpoint. (protocol://host:port/serverinstance/api) $(api_endpoint)
        authentication: oauth                 # Set authentication Method to use. Default [Windows]. $(authentication)
        azure_tenant_id:                      # Azure Tenant Id. Only required for BC SaaS $(azure_tenant_id)
        azure_app_client_id:                  # Azure AD Application Client Id. $(azure_app_client_id)
        azure_app_client_secret:              # Azure AD Application Client Secret. $(azure_app_client_secret)
        azure_app_client_certificate:         # Azure AD Application Client Certificate. $(azure_app_client_certificate)
        azure_app_client_certificate_password: # Azure AD Application Client Certificate Password. $(azure_app_client_certificate_password)
        username:                             # Business Central Username. Leave empty for Service-2-Service authentication. $(username)
        password:                             # Business Central User Password. Leave empty for Service-2-Service authentication. $(password)
        publish_artifacts: True               # Publish results as Artifacts. $(publish_artifacts)
        discover: True                        # Discover available API routes. $(discover)
        api_routes:                           # Specify API Routes to convert. Multiline or '|' seperated. $(api_routes)
        api_exclude_routes:                   # Specify API Routes to exclude from discovery. Multiline or '|' seperated. $(api_exclude_routes)
        inspect_paths: False                  # Print all available Paths per Route. $(inspect_paths)
        api_servers:                          # Specify available servers for OpenAPI. Multiline or '|' seperated. $(api_servers)
        export_edmx: False                    # Export original API EDMX. $(export_edmx)
        export_yaml: True                     # Export API in YAML format. $(export_yaml)
        export_json: False                    # Export API in JSON format. $(export_json)
        exclude_company_paths: False          # Exclude Company Paths. $(exclude_company_paths)
```

