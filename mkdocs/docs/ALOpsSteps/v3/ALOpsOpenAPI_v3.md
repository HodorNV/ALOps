```yaml
    - task: ALOpsOpenAPI@3
      displayName: 'ALOps OpenAPI'
      inputs:
        api_endpoint: https://api.businesscentral.dynamics.com/v2.0/$(azure_tenant_id)/Sandbox/api# Base URL of the Business Central API. Use $(azure_tenant_id) as a placeholder — it is replaced at runtime with the azure_tenant_id input value. $(api_endpoint) $(api_endpoint) $(api_endpoint)
        authentication: oauth                 # Authentication method for the API connection. oauth uses Azure AD service-to-service tokens (recommended for SaaS). basic and usernamepassword use user credentials. windows uses Windows integrated authentication (on-premises only). $(authentication) $(authentication) $(authentication)
        azure_tenant_id:                      # Azure Active Directory tenant ID (GUID or domain) of the Business Central SaaS tenant. $(azure_tenant_id) $(azure_tenant_id) $(azure_tenant_id)
        azure_app_client_id:                  # Application (client) ID of the Azure AD app registration used for OAuth authentication. $(azure_app_client_id) $(azure_app_client_id) $(azure_app_client_id)
        azure_app_client_secret:              # Client secret of the Azure AD app registration. Store this value in a pipeline secret variable or Azure Key Vault, never in plain text. $(azure_app_client_secret) $(azure_app_client_secret) $(azure_app_client_secret)
        azure_app_client_certificate:         # Path, base-64 encoded content, or certificate store reference (CERT:\...) of the certificate (.pfx) used instead of a client secret for Azure AD app authentication. $(azure_app_client_certificate) $(azure_app_client_certificate) $(azure_app_client_certificate)
        azure_app_client_certificate_password: # Password protecting the client certificate. Store this in a pipeline secret variable. $(azure_app_client_certificate_password) $(azure_app_client_certificate_password) $(azure_app_client_certificate_password)
        username:                             # Business Central user account name. Used for basic or usernamepassword authentication. $(username) $(username) $(username)
        password:                             # Password for the Business Central user account. Store this in a pipeline secret variable. $(password) $(password) $(password)
        usedocker: false                      # Run the OpenAPI generation inside a Docker container instead of the host agent. $(usedocker) $(usedocker) $(usedocker)
        fixed_tag:                            # Fixed tag to identify the Docker container. When empty, the build label is used. $(fixed_tag) $(fixed_tag) $(fixed_tag)
        discover: true                        # Automatically discover available API routes from the Business Central runtime API. $(discover) $(discover) $(discover)
        api_routes:                           # Manual list of API routes to convert (one per line or pipe-delimited). Used when discover is false. $(api_routes) $(api_routes) $(api_routes)
        api_exclude_routes:                   # Routes to exclude from automatic discovery (one per line or pipe-delimited). $(api_exclude_routes) $(api_exclude_routes) $(api_exclude_routes)
        inspect_paths: false                  # Print all discovered API paths for each route to the build log. $(inspect_paths) $(inspect_paths) $(inspect_paths)
        api_servers:                          # Custom server URLs to include in the OpenAPI specification (one per line or pipe-delimited). When empty, the original API endpoint is used. $(api_servers) $(api_servers) $(api_servers)
        export_edmx: false                    # Export the raw EDMX metadata alongside the OpenAPI specification. $(export_edmx) $(export_edmx) $(export_edmx)
        export_yaml: true                     # Export the OpenAPI specification in YAML format. $(export_yaml) $(export_yaml) $(export_yaml)
        export_json: false                    # Export the OpenAPI specification in JSON format. $(export_json) $(export_json) $(export_json)
        publish_artifacts: true               # Upload the generated OpenAPI files as build artifacts. $(publish_artifacts) $(publish_artifacts) $(publish_artifacts)
        exclude_company_paths: false          # Exclude company-scoped paths from the OpenAPI specification. When enabled, a company header parameter is added instead. $(exclude_company_paths) $(exclude_company_paths) $(exclude_company_paths)
```

