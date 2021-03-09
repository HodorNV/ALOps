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
            alternativevsixurl:                   # Alternative VSIX download url. Overrules BC Artificat VSIX. $(alternativevsixurl) $(alternativevsixurl)
            alsourcepath: $(System.DefaultWorkingDirectory)#  $(alsourcepath) $(alsourcepath)
            ruleset:                              # Overrule the Ruleset from VSCode settings. Path relative to [alsourcepath] $(ruleset) $(ruleset)
            appversiontemplate: 1.0.*.0           # Template for versioning Apps. '*' is replaced by the current Build Number. $(appversiontemplate) $(appversiontemplate)
            appfilenametemplate: %APP_PUBLISHER%_%APP_NAME%_%APP_VERSION%_%BC_TYPE%_%BC_VERSION%_%BC_COUNTRY%.app# Template for App filename. $(appfilenametemplate) $(appfilenametemplate)
            alcodeanalyzer:                       # AL Analyzer(s) used for compiling. (Example: CodeCop,UICop) $(alcodeanalyzer) $(alcodeanalyzer)
            showmycode: Keep                      # Overrule ShowMyCode by setting other option than 'Keep'. $(showmycode) $(showmycode)
            alcachepath: $(System.DefaultWorkingDirectory)#  $(alcachepath) $(alcachepath)
            publishartifact: True                 # Publish generated App Artifact to DevOps. $(publishartifact) $(publishartifact)
            publishxlif: False                    # Publish generated XLIF to DevOps. $(publishxlif) $(publishxlif)
            failonwarnings: False                 # Fail task when any warning occurs. $(failonwarnings) $(failonwarnings)
            storageaccount:                       # Non Default Storage Account. $(storageaccount) $(storageaccount)
            sastoken:                             # SAS Token used to access Storage Account. $(sastoken) $(sastoken)
    ```
- ALOps Repository Publish Extension
  * Publish extension to ALOps Repository.
  * YAML Template: 
    ```yaml
            - task: ALOpsRepositoryPublish@2
            displayName: 'ALOps Repository Publish Extension'
    ```

