```yaml
    - task: ALOpsAppPublish@2
      displayName: 'ALOps App Publish'
      inputs:
        usedocker: False                      # Run task in Docker container. $(usedocker) $(usedocker)
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag) $(fixed_tag)
        installpublishedapps: True            # Install Published Applications. $(installpublishedapps) $(installpublishedapps)
        installaltesttool: False              # Install the AL TestTool for v15. $(installaltesttool) $(installaltesttool)
        install_al_app_names: Tests-TestLibraries
System Application Test
System Application Test Library
Any
Library Assert
Test Runner
# Specify additional docker parameters. $(install_al_app_names) $(install_al_app_names)
        strictappnames: False                 # Only install Specified Apps. $(strictappnames) $(strictappnames)
        nav_serverinstance: BC140             # Business Central Server Instance Name. $(nav_serverinstance) $(nav_serverinstance)
        artifact_path:                        # Path for storing App Artifact. $(artifact_path) $(artifact_path)
        nav_artifact_app_filter: *.app        # Filter used for locating App file relative to $(path_to_publish). $(nav_artifact_app_filter) $(nav_artifact_app_filter)
        skip_verification: True               # Skip CodeSign Verification of Business Central App. $(skip_verification) $(skip_verification)
        forceinstall: False                   # Always install Apps regards of current state. $(forceinstall) $(forceinstall)
        forcesync: False                      # Sets the Sync-Mode to Force, enables pushing breaking changes. $(forcesync) $(forcesync)
        publish_scope: Global                 # Set the scope for publishing extensions. $(publish_scope) $(publish_scope)
        tenant: default                       # Tenant to publish to when Scope is set to Tenant. $(tenant) $(tenant)
        batch_publish_folder:                 # Path containing Apps to publish. $(batch_publish_folder) $(batch_publish_folder)
        publisherazureactivedirectorytenantid: # Publisher Azure AD TenantId. $(publisherazureactivedirectorytenantid) $(publisherazureactivedirectorytenantid)
        blocksymbolsonly: False               # Check App, block if SymbolsOnly App. $(blocksymbolsonly) $(blocksymbolsonly)
        pwsh: False                           # Run task in Powershell Core. $(pwsh) $(pwsh)
```

