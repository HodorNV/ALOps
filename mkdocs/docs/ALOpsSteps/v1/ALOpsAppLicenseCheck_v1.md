```yaml
    - task: ALOpsAppLicenseCheck@1
      displayName: 'ALOps App License Check'
      inputs:
        usedocker: False                      # Run this task inside the Business Central Docker container identified by the fixed tag. The container provides the BC platform assemblies needed for FLF license parsing. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
        fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
        licensefile:                          # Path or URL of the Business Central license file (.flf or .bclicense) to validate against. Supports fully qualified paths, paths relative to $(System.DefaultWorkingDirectory), and HTTP/HTTPS URLs. $(licensefile)
        artifact_path: $(System.ArtifactsDirectory)# Folder containing the .app files to validate against the license. Supports pipeline variables such as $(System.ArtifactsDirectory). $(artifact_path)
        artifact_filter: *.app                # Glob filter applied inside artifact_path to select which .app files to check, for example *.app. $(artifact_filter)
        artifact_include:                     # Comma-separated include patterns applied in addition to artifact_filter when selecting .app files, for example MyApp*.app. $(artifact_include)
        artifact_exclude:                     # Comma-separated exclude patterns to omit specific .app files from the license check, for example *Test*.app. $(artifact_exclude)
        exclude_ranges:                       # Comma-separated list of object ID ranges to exclude from the license check. Useful for buffer tables or temporary object ranges. Format: 60000..60099,70000..70100. $(exclude_ranges)
        expiry_text:                          # Text string to search for in the license file to locate the expiry date, for example Expiration Date. Required together with expiry_dateformat for the expiry check. $(expiry_text)
        expiry_dateformat:                    # Date format of the expiry date found in the license file, for example dd.MM.yyyy or MM/dd/yyyy. Required together with expiry_text for the expiry check. $(expiry_dateformat)
        expiry_dayswarning:                   # Number of days before license expiry at which a warning is issued in the pipeline. Set to 0 to only raise an error on the actual expiry date. $(expiry_dayswarning)
        expiry_checkonly: False               # When enabled, only the license expiry date is checked and the full object-level license validation is skipped. Useful when you need a quick expiry check without a full app analysis. $(expiry_checkonly)
        exclude_tables: False                 # Exclude Table objects from the license coverage check. Useful when tables are intentionally unlicensed, for example temporary tables used only at runtime. $(exclude_tables)
        exclude_codeunits: False              # Exclude Codeunit objects from the license coverage check. $(exclude_codeunits)
        exclude_pages: False                  # Exclude Page objects from the license coverage check. $(exclude_pages)
        exclude_reports: False                # Exclude Report objects from the license coverage check. $(exclude_reports)
        exclude_xmlports: False               # Exclude XMLPort objects from the license coverage check. $(exclude_xmlports)
        exclude_queries: False                # Exclude Query objects from the license coverage check. $(exclude_queries)
        warning_only: False                   # When enabled, unlicensed objects produce a pipeline warning instead of a build failure. The pipeline continues and the check result is only advisory. $(warning_only)
        pwsh: False                           # Run the task using PowerShell Core (pwsh) instead of Windows PowerShell. Required on Linux-hosted build agents. $(pwsh)
```

