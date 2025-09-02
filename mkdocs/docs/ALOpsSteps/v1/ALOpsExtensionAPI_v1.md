```yaml
    - task: ALOpsExtensionAPI@1
      displayName: 'ALOps Extension API'
      inputs:
        usedocker: False                      # Run task in Docker container. $(usedocker)
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
        interaction: get                      # Set Interaction Method to use. (Get/Publish/Batch Publish). $(interaction)
        api_endpoint: https://api.businesscentral.dynamics.com/v2.0/$(azure_tenant_id)/Sandbox/api# Set API Endpoint. (protocol://host:port/serverinstance/api) $(api_endpoint)
        dev_endpoint:                         # Set DEV Endpoint. (protocol://host:port/serverinstance/dev) $(dev_endpoint)
        dev_schemeupdatemode: synchronize     # Set Schema Update Mode to use with DEVPort deploy. (synchronize/recreate/forcesync) $(dev_schemeupdatemode)
        dev_dependencypublishingoption: none  # Set Dependency Publishing Option for DEV Endpoint. $(dev_dependencypublishingoption)
        apiversion: v1.0                      # Version of the API to use (beta / v1.0 / v2.0) $(apiversion)
        authentication: oauth                 # Set authentication Method to use. Default [Windows]. $(authentication)
        azure_tenant_id:                      # Azure Tenant Id. Only required for BC SaaS $(azure_tenant_id)
        azure_app_client_id:                  # Azure AD Application Client Id. $(azure_app_client_id)
        azure_app_client_secret:              # Azure AD Application Client Secret. $(azure_app_client_secret)
        azure_app_client_certificate:         # Azure AD Application Client Certificate. $(azure_app_client_certificate)
        azure_app_client_certificate_password: # Azure AD Application Client Certificate Password. $(azure_app_client_certificate_password)
        username:                             # Business Central Username. Leave empty for Service-2-Service authentication. $(username)
        password:                             # Business Central User Password. Leave empty for Service-2-Service authentication. $(password)
        bccompany:                            # Business Central Company (Id or Name). $(bccompany)
        artifact_path: $(System.ArtifactsDirectory)# Path for App Artifact. If using 'Multistate Pipeline', use '$(Pipeline.Workspace)' instead. $(artifact_path)
        artifact_filter: *.app                # Filter used for locating App file relative to $(path_to_publish). $(artifact_filter)
        showdeploymentstatus: True            # Show Extension Deployment Status. $(showdeploymentstatus)
        vsix_only: False                      # Only use VSIX, do not use BC-Artifacts. $(vsix_only)
        checksecondsdelay: 30                 # Seconds of delay betweel deployment status checks. $(checksecondsdelay)
        maxtries: 20                          # Max tries for status check. $(maxtries)
        replacepackageid: False               # Force a new PackageID for each deployment. $(replacepackageid)
        blocksymbolsonly: False               # Check App, block if SymbolsOnly App. $(blocksymbolsonly)
        schedule: current                     # Set the Schedule. Requires API Version 2.0 $(schedule)
        schema_sync_mode: add                 # Set the Schema Update Mode. Requires API Version 2.0 $(schema_sync_mode)
        pwsh: False                           # Run task in Powershell Core. $(pwsh)
```

