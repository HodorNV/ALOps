```yaml
    - task: ALOpsOpenAPI@1
      displayName: 'ALOps OpenAPI'
      inputs:
        usedocker: False                      # Run the OpenAPI generation inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
        fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
        api_endpoint: https://api.businesscentral.dynamics.com/v2.0/$(azure_tenant_id)/Sandbox/api# Base URL of the Business Central API to generate OpenAPI specifications from, for example https://api.businesscentral.dynamics.com/v2.0/{tenant}/Sandbox/api. $(api_endpoint)
        authentication: oauth                 # Authentication method for the Business Central API connection. oauth uses Azure AD tokens (recommended for SaaS). basic and usernamepassword use user credentials. windows uses Windows integrated authentication. $(authentication)
        azure_tenant_id:                      # Azure Active Directory tenant ID (GUID or domain) of the Business Central SaaS tenant. $(azure_tenant_id)
        azure_app_client_id:                  # Application (client) ID of the Azure AD app registration used for OAuth authentication. $(azure_app_client_id)
        azure_app_client_secret:              # Client secret of the Azure AD app registration. Store this value in a pipeline secret variable or Azure Key Vault. $(azure_app_client_secret)
        azure_app_client_certificate:         # Path or base-64 encoded content of the certificate used instead of a client secret for Azure AD app authentication. $(azure_app_client_certificate)
        azure_app_client_certificate_password: # Password protecting the Azure AD client certificate. Store this in a pipeline secret variable. $(azure_app_client_certificate_password)
        username:                             # Business Central user account name for basic or usernamepassword authentication. Leave empty for OAuth Service-to-Service. $(username)
        password:                             # Password for the Business Central user account. Leave empty for OAuth authentication. Store this in a pipeline secret variable. $(password)
        publish_artifacts: True               # Upload the generated OpenAPI specification files as build artifacts in Azure DevOps. $(publish_artifacts)
        discover: True                        # When enabled, the task automatically discovers all available API routes from the endpoint. When disabled, only the routes listed in api_routes are processed. $(discover)
        api_routes:                           # One API route per line (or separated by a pipe character) to convert to OpenAPI. Used when discover is disabled. $(api_routes)
        api_exclude_routes:                   # One API route per line (or separated by a pipe character) to exclude from automatic discovery. Used when discover is enabled. $(api_exclude_routes)
        inspect_paths: False                  # When enabled, print all discovered API paths for each route to the pipeline log. Useful for auditing the available API surface. $(inspect_paths)
        api_servers:                          # One server URL per line (or separated by a pipe character) to include in the OpenAPI servers list, describing where the API is hosted. $(api_servers)
        export_edmx: False                    # Export the raw EDMX metadata document retrieved from the Business Central API alongside the OpenAPI specification. $(export_edmx)
        export_yaml: True                     # Export the OpenAPI specification in YAML format (.yaml). YAML is the default format and is widely supported by API tooling. $(export_yaml)
        export_json: False                    # Export the OpenAPI specification in JSON format (.json) in addition to or instead of YAML. $(export_json)
        exclude_company_paths: False          # Exclude company-scoped API paths (paths containing /companies({companyId})/) from the generated specification. Useful when generating a simplified specification for single-company scenarios. $(exclude_company_paths)
```

