    # Build Steps Overview
    Let's describe all the Build Steps that we have at our disposal

    ## List and describe all build steps
    Here is a list of all build steps you have at your disposal when you use ALOps

        ### ALOps Tasks
    - ALOps App Compiler
  * Compile Business Central extension(s) from AL code.
  * YAML Template: 
    ```yaml
        - task: ALOpsAppCompiler@2
          displayName: 'ALOps App Compiler'
          inputs:
            artifactversion:                      # BC/NAV Version, eg: 9, 10.4, NAV2016, 16.4.24524. $(artifactversion) $(artifactversion)
            artifacttype: OnPrem                  # Set Artifact Type. $(artifacttype) $(artifacttype)
            artifactcountry:                      # The Country for the Artifact. $(artifactcountry) $(artifactcountry)
            versionselect: Latest                 # The version to be selected from the Artifacts. $(versionselect) $(versionselect)
            updateruntime:                        # Updates the Runtime parameter in app.json. $(updateruntime) $(updateruntime)
            alternativeartifacturl:               # Overrule the ArtifactUrl which would be determined by [artifacttype/artifactcountry/versionselect]. $(alternativeartifacturl) $(alternativeartifacturl)
            alternativevsixurl:                   # Alternative VSIX download url. Overrules BC Artificat VSIX. 'Latest' can be specified. $(alternativevsixurl) $(alternativevsixurl)
            alsourcepath: $(System.DefaultWorkingDirectory)# Set the root folder for findings App.json's recursivly $(alsourcepath) $(alsourcepath)
            ruleset:                              # Overrule the Ruleset from VSCode settings. Path relative to [alsourcepath] $(ruleset) $(ruleset)
            suppresswarnings: KEEP                # Overrule the 'suppresswarnings' setting. $(suppresswarnings) $(suppresswarnings)
            appversiontemplate: 1.0.*.0           # Template for versioning Apps. '*' is replaced by the current Build Number. $(appversiontemplate) $(appversiontemplate)
            updatebuildnumber: True               # Update the Build number with the current version. $(updatebuildnumber) $(updatebuildnumber)
            appfilenametemplate: %APP_PUBLISHER%_%APP_NAME%_%APP_VERSION%_%BC_TYPE%_%BC_VERSION%_%BC_COUNTRY%.app# Template for App filename. $(appfilenametemplate) $(appfilenametemplate)
            alcodeanalyzer:                       # AL Analyzer(s) used for compiling. (Example: CodeCop,UICop) $(alcodeanalyzer) $(alcodeanalyzer)
            ignorepragmas:                        # Report Suppressed Diagnostics: diagnostics suppressed in source code should be emitted. $(ignorepragmas) $(ignorepragmas)
            enable_external_rulesets: False       # Enable External Rulesets. $(enable_external_rulesets) $(enable_external_rulesets)
            showmycode: Keep                      # Overrule ShowMyCode by setting other option than 'Keep'. $(showmycode) $(showmycode)
            resourceexposurepolicy_allowdebugging: Keep# Overrule allowDebugging by setting other option than 'Keep'. $(resourceexposurepolicy_allowdebugging) $(resourceexposurepolicy_allowdebugging)
            resourceexposurepolicy_allowdownloadingsource: Keep# Overrule allowDownloadingSource by setting other option than 'Keep'. $(resourceexposurepolicy_allowdownloadingsource) $(resourceexposurepolicy_allowdownloadingsource)
            resourceexposurepolicy_includesourceinsymbolfile: Keep# Overrule includeSourceInSymbolFile by setting other option than 'Keep'. $(resourceexposurepolicy_includesourceinsymbolfile) $(resourceexposurepolicy_includesourceinsymbolfile)
            internalsvisibleto: Keep              # Remove internalsVisibleTo by setting other option than 'Keep'. $(internalsvisibleto) $(internalsvisibleto)
            preprocessorsymbols:                  # Overwrite the preprocessorSymbols in app.json, comma seperated string. Set to 'NONE' to remove. $(preprocessorsymbols) $(preprocessorsymbols)
            generatereportlayouts: True           # Set Generate Report Layouts compiler option. $(generatereportlayouts) $(generatereportlayouts)
            applicationinsightskey:               # Overwrite the ApplicationInsightsKey in app.json. Set to 'NONE' to remove InsightsKey. $(applicationinsightskey) $(applicationinsightskey)
            alcachepath: $(System.DefaultWorkingDirectory)#  $(alcachepath) $(alcachepath)
            publishartifact: True                 # Publish generated App Artifact to DevOps. $(publishartifact) $(publishartifact)
            publishxlif: False                    # Publish generated XLIF to DevOps. $(publishxlif) $(publishxlif)
            failonwarnings: False                 # Fail task when any warning occurs. $(failonwarnings) $(failonwarnings)
            failonany: False                      # Fail task when any message occurs. $(failonany) $(failonany)
            storageaccount:                       # Non Default Storage Account. $(storageaccount) $(storageaccount)
            sastoken:                             # SAS Token used to access Storage Account. $(sastoken) $(sastoken)
            printappmanifest: True                # Print the final app.json before compile. $(printappmanifest) $(printappmanifest)
            outputalclogs: True                   # Output ALC logs. $(outputalclogs) $(outputalclogs)
            additionalprobingpaths:               # Add additional Assembly probing Paths. $(additionalprobingpaths) $(additionalprobingpaths)
            allowed_publisher_names:              # Allowed Publisher names. $(allowed_publisher_names) $(allowed_publisher_names)
            allowed_publisher_names_separator: ,  # Allowed Publisher names Separator. $(allowed_publisher_names_separator) $(allowed_publisher_names_separator)
            accept_insider_eula: False            # Accept Insider EULA. $(accept_insider_eula) $(accept_insider_eula)
            track_source_build_metadata: True     # Track Source and Build Metadata $(track_source_build_metadata) $(track_source_build_metadata)
            alc_continuebuildonerror: False       # Set ALC Continue Build On Error option. $(alc_continuebuildonerror) $(alc_continuebuildonerror)
            alc_errorlog: False                   # Set ALC Error Log option. When enabled will publish the log as an Artifact. $(alc_errorlog) $(alc_errorlog)
            pwsh: False                           # Run task in Powershell Core. $(pwsh) $(pwsh)
    ```
- ALOps Package Import
  * Import and Process RapidStart/Configuration Package
  * YAML Template: 
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
- ALOps Repository Publish Extension
  * Publish extension to ALOps Repository.
  * YAML Template: 
    ```yaml
        - task: ALOpsRepositoryPublish@2
          displayName: 'ALOps Repository Publish Extension'
    ```

