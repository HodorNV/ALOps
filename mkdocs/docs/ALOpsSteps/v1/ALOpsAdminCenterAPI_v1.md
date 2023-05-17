    ```yaml
        - task: ALOpsAdminCenterAPI@1
          displayName: 'ALOps AdminCenter API'
          inputs:
            azure_tenant_id:                      # Azure Tenant Id. Only required for BC SaaS $(azure_tenant_id)
            azure_app_client_id:                  # Azure AD Application Client Id. $(azure_app_client_id)
            azure_app_client_secret:              # Azure AD Application Client Secret. $(azure_app_client_secret)
            azure_app_client_certificate:         # Azure AD Application Client Certificate. $(azure_app_client_certificate)
            azure_app_client_certificate_password: # Azure AD Application Client Certificate Password. $(azure_app_client_certificate_password)
            username:                             # Business Central Username. Leave empty for Service-2-Service authentication. $(username)
            password:                             # Business Central User Password. Leave empty for Service-2-Service authentication. $(password)
            checksecondsdelay: 30                 # Seconds of delay betweel deployment status checks. $(checksecondsdelay)
            maxtries: 20                          # Max tries for status check. $(maxtries)
            interaction: environment_list         # Set Interaction to use. $(interaction)
            wait_for_operation: True              # Wait for operation. $(wait_for_operation)
            environment:                          # Source Environment. $(environment)
            target_environment:                   # Target Environment. $(target_environment)
            use_update_window: False              # Use update window. $(use_update_window)
            app_id:                               # App ID. $(app_id)
            accept_isv_eula: False                # Accept ISV Eula. $(accept_isv_eula)
            force_dependencies: False             # Force Dependencies. $(force_dependencies)
            confirm_delete_data: False            # Confirm Delete Data. $(confirm_delete_data)
    ```

