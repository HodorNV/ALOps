```yaml
    - task: ALOpsAppPublish@1
      displayName: 'ALOps App Publish'
      inputs:
        usedocker: False                      # Run this task inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
        fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
        installpublishedapps: True            # After publishing, automatically install all published apps so they become active in the Business Central tenant. $(installpublishedapps)
        installaltesttool: False              # Install the AL Test Tool and associated test libraries required for running BC unit tests on version 15 and later. $(installaltesttool)
        install_al_app_names: Tests-TestLibraries
System Application Test
System Application Test Library
Any
Library Assert
Test Runner
# Line-separated list of AL test library app names to install together with the AL Test Tool. Only used when installaltesttool is enabled. $(install_al_app_names)
        strictappnames: False                 # When enabled, only the apps explicitly listed in install_al_app_names are installed. All other apps are skipped, even if they are available. $(strictappnames)
        nav_serverinstance: BC140             # Name of the Business Central Server instance to publish to, for example BC140 or BC230. $(nav_serverinstance)
        artifact_path:                        # Folder containing the .app files to publish. Leave empty to use the artifact staging directory. $(artifact_path)
        nav_artifact_app_filter: *.app        # Glob filter applied inside artifact_path to select which .app files to publish, for example *.app. $(nav_artifact_app_filter)
        skip_verification: True               # Skip Authenticode code-signing verification of the .app file before publishing. Enable this when publishing unsigned development builds. $(skip_verification)
        forceinstall: False                   # Always reinstall apps regardless of whether they are already installed at the same version. Useful for forcing a clean state. $(forceinstall)
        forcesync: False                      # Set the schema sync mode to Force when publishing, enabling breaking schema changes such as removing fields or tables. $(forcesync)
        publish_scope: Global                 # Scope at which the extension is published. Global makes the app available to all tenants on the server. Tenant restricts it to a specific tenant. $(publish_scope)
        tenant: default                       # Tenant ID to publish to when publish_scope is set to Tenant. $(tenant)
        batch_publish_folder:                 # Folder containing multiple .app files to publish in a single batch operation. All matching apps in this folder are published in dependency order. $(batch_publish_folder)
        publisherazureactivedirectorytenantid: # Azure AD tenant ID of the app publisher. Required for apps that use per-tenant authorization in Business Central online. $(publisherazureactivedirectorytenantid)
        blocksymbolsonly: False               # When enabled, the task checks whether the app is a symbols-only package and blocks publishing if it is, preventing accidental deployment of placeholder apps. $(blocksymbolsonly)
        pwsh: False                           # Run the task using PowerShell Core (pwsh) instead of Windows PowerShell. Required on Linux-hosted build agents. $(pwsh)
```

