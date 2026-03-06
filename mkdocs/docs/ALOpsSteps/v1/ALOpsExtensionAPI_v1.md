```yaml
    - task: ALOpsExtensionAPI@1
      displayName: 'ALOps Extension API'
      inputs:
        usedocker: False                      # Run this task inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
        fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
        interaction: get                      # API operation to perform. get lists extensions currently installed on the environment. publish deploys a single .app file. batch deploys multiple .app files in dependency order. $(interaction)
        api_endpoint: https://api.businesscentral.dynamics.com/v2.0/$(azure_tenant_id)/Sandbox/api# Base URL of the Business Central API, for example https://api.businesscentral.dynamics.com/v2.0/{tenant}/Sandbox/api for SaaS or http://server:port/BC/api for on-premises. $(api_endpoint)
        dev_endpoint:                         # URL of the Business Central development endpoint used when deploying via the DEV port, for example http://server:7049/BC/dev. $(dev_endpoint)
        dev_schemeupdatemode: synchronize     # Schema update mode when publishing via the DEV endpoint. synchronize adds new schema objects. recreate drops and recreates tables. forcesync allows breaking changes. $(dev_schemeupdatemode)
        dev_dependencypublishingoption: none  # Dependency handling when publishing via the DEV endpoint. none skips dependencies. default resolves them automatically. ignore skips dependency checks. strict fails if any dependency is missing. $(dev_dependencypublishingoption)
        apiversion: v1.0                      # Version of the Business Central API to use. Supported values are beta, v1.0, and v2.0. Use v2.0 for access to schedule and schema sync mode features. $(apiversion)
        authentication: oauth                 # Authentication method for the API connection. oauth uses Azure AD service-to-service tokens (recommended for SaaS). basic and usernamepassword use user credentials. windows uses Windows integrated authentication. $(authentication)
        azure_tenant_id:                      # Azure Active Directory tenant ID (GUID or domain) of the Business Central SaaS tenant. $(azure_tenant_id)
        azure_app_client_id:                  # Application (client) ID of the Azure AD app registration used for OAuth authentication. $(azure_app_client_id)
        azure_app_client_secret:              # Client secret of the Azure AD app registration. Store this value in a pipeline secret variable or Azure Key Vault. $(azure_app_client_secret)
        azure_app_client_certificate:         # Path or base-64 encoded content of the certificate used instead of a client secret for Azure AD app authentication. $(azure_app_client_certificate)
        azure_app_client_certificate_password: # Password protecting the Azure AD client certificate. Store this in a pipeline secret variable. $(azure_app_client_certificate_password)
        username:                             # Business Central user account name for basic or usernamepassword authentication. Leave empty for Service-to-Service OAuth authentication. $(username)
        password:                             # Password for the Business Central user account. Leave empty for Service-to-Service authentication. Store this in a pipeline secret variable. $(password)
        bccompany:                            # Name or GUID of the Business Central company context for the API call. Leave empty to use the default company. $(bccompany)
        artifact_path: $(System.ArtifactsDirectory)# Folder containing the .app files to deploy. In multi-stage pipelines, use $(Pipeline.Workspace) to access artifacts from earlier stages. $(artifact_path)
        artifact_filter: *.app                # Glob filter applied inside artifact_path to select which .app files to deploy, for example *.app. $(artifact_filter)
        showdeploymentstatus: True            # When enabled, the task polls and displays the extension deployment status after publishing until the operation completes or times out. $(showdeploymentstatus)
        vsix_only: False                      # Use only the AL compiler VSIX for symbol resolution and skip BC artifact downloads. Enable this to speed up pipelines that do not need full BC artifact packages. $(vsix_only)
        checksecondsdelay: 30                 # Number of seconds to wait between polls when checking deployment status. Increase this for environments with slower deployment operations. $(checksecondsdelay)
        maxtries: 20                          # Maximum number of deployment status polls before the task times out. Multiply by checksecondsdelay for the total maximum wait time. $(maxtries)
        replacepackageid: False               # Generate a new package GUID for each deployment. This forces Business Central to treat each deploy as a fresh installation rather than an upgrade. $(replacepackageid)
        blocksymbolsonly: False               # When enabled, the task checks whether the .app is a symbols-only package and blocks deployment if it is, preventing accidental publishing of placeholder apps. $(blocksymbolsonly)
        schedule: current                     # Deployment schedule for the extension. current deploys immediately. nextminor schedules for the next minor BC update. nextmajor schedules for the next major update. Requires API version 2.0. $(schedule)
        schema_sync_mode: add                 # Schema synchronization mode for the extension deployment. add only adds new schema objects. forcesync allows breaking schema changes. Requires API version 2.0. $(schema_sync_mode)
        pwsh: False                           # Run the task using PowerShell Core (pwsh) instead of Windows PowerShell. Required on Linux-hosted build agents. $(pwsh)
```

