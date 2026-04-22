```yaml
    - task: ALOpsAppPublish@3
      displayName: 'ALOps App Publish'
      inputs:
        nav_serverinstance: BC                # Business Central server instance name (e.g. BC). $(nav_serverinstance) $(nav_serverinstance) $(nav_serverinstance)
        install_published_apps: true          # Install apps after publishing. Disable to publish without installing. $(install_published_apps) $(install_published_apps) $(install_published_apps)
        skip_verification: true               # Skip code signing verification during publish. $(skip_verification) $(skip_verification) $(skip_verification)
        publish_scope: Global                 # Publishing scope: Global (all tenants) or Tenant (specific tenant only). $(publish_scope) $(publish_scope) $(publish_scope)
        tenant: default                       # Target tenant ID for publish and install operations. $(tenant) $(tenant) $(tenant)
        force_install: false                  # Reinstall app even if already installed. $(force_install) $(force_install) $(force_install)
        force_sync: false                     # Force schema synchronization mode. $(force_sync) $(force_sync) $(force_sync)
        artifact_path:                        # Path to the folder containing .app files. Leave empty to scan the workspace directory. $(artifact_path) $(artifact_path) $(artifact_path)
        nav_artifact_app_filter: *.app        # Glob filter for .app files to publish. $(nav_artifact_app_filter) $(nav_artifact_app_filter) $(nav_artifact_app_filter)
        batch_publish_folder:                 # Folder containing multiple .app files for batch publishing in dependency order. $(batch_publish_folder) $(batch_publish_folder) $(batch_publish_folder)
        block_symbols_only: false             # Block publishing of symbols-only app packages. $(block_symbols_only) $(block_symbols_only) $(block_symbols_only)
        exclude_microsoft_apps: true          # Skip publishing any app whose manifest Publisher is 'Microsoft' (case-insensitive). Applied after dependency ordering so manifest data is available. Works in Docker and non-Docker modes. $(exclude_microsoft_apps) $(exclude_microsoft_apps) $(exclude_microsoft_apps)
        usedocker: false                      # Run publish inside a Docker container. Apps are copied in, published, and results copied back. $(usedocker) $(usedocker) $(usedocker)
        fixed_tag:                            # Fixed container label. When set, uses this value to locate the Docker container instead of the build ID. $(fixed_tag) $(fixed_tag) $(fixed_tag)
        install_al_test_tool: false           # Install AL test libraries and test runner from the BC server's built-in apps. $(install_al_test_tool) $(install_al_test_tool) $(install_al_test_tool)
        install_al_app_names: Tests-TestLibraries
System Application Test
System Application Test Library
Any
Library Assert
Library Variable Storage
Test Runner# Names of test library apps to install (one per line). These are matched against the built-in apps on the BC server. $(install_al_app_names) $(install_al_app_names) $(install_al_app_names)
        strict_app_names: false               # Only install the exact apps listed in Test App Names. When disabled, version-specific test apps may be added automatically. $(strict_app_names) $(strict_app_names) $(strict_app_names)
        publisher_azure_ad_tenant_id:         # Azure AD tenant ID for per-tenant publisher authentication. Required when publishing to a multi-tenant environment with per-tenant isolation. $(publisher_azure_ad_tenant_id) $(publisher_azure_ad_tenant_id) $(publisher_azure_ad_tenant_id)
```

