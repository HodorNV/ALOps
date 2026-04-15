```yaml
    - task: ALOpsAppLicenseCheck@3
      displayName: 'ALOps App License Check'
      inputs:
        licensefile:                          # Set the BC License File. Path or Url. $(licensefile) $(licensefile) $(licensefile)
        expiry_text:                          # String to find in license to match for ExpiryDate. $(expiry_text) $(expiry_text) $(expiry_text)
        expiry_dateformat:                    # Date Format of the Expiry date, example: dd.MM.yyyy $(expiry_dateformat) $(expiry_dateformat) $(expiry_dateformat)
        expiry_dayswarning:                   # Amount of days before License-Expiry for triggering a warning $(expiry_dayswarning) $(expiry_dayswarning) $(expiry_dayswarning)
        expiry_checkonly: false               # When enabled, only the license expiry check is performed and the full license object check is skipped. $(expiry_checkonly) $(expiry_checkonly) $(expiry_checkonly)
        artifact_path:                        # Path for App Artifact. $(artifact_path) $(artifact_path) $(artifact_path)
        artifact_filter: *.app                # Filter used for locating App file relative to $(artifact_path). $(artifact_filter) $(artifact_filter) $(artifact_filter)
        artifact_include:                     # Include-Filter used for locating App file relative to $(artifact_path). $(artifact_include) $(artifact_include) $(artifact_include)
        artifact_exclude:                     # Exclude-Filter used for locating App file relative to $(artifact_path). $(artifact_exclude) $(artifact_exclude) $(artifact_exclude)
        use_alops_compiler_apps: false        # When enabled, `artifact_path` and `artifact_filter` are ignored. Instead, the task reads app paths from the `ALOPS_COMPILE_ARTIFACT_ARRAY` environment variable (comma-separated), which is populated by a preceding ALOpsAppCompiler task. $(use_alops_compiler_apps) $(use_alops_compiler_apps) $(use_alops_compiler_apps)
        exclude_ranges:                       # Exclude-Ranges from LicenseCheck (Buffer / Temporary tables). Format: 60000..60099,70000..70100 $(exclude_ranges) $(exclude_ranges) $(exclude_ranges)
        exclude_tables: false                 # Exclude Table objects from LicenseCheck. $(exclude_tables) $(exclude_tables) $(exclude_tables)
        exclude_codeunits: false              # Exclude Codeunit objects from LicenseCheck. $(exclude_codeunits) $(exclude_codeunits) $(exclude_codeunits)
        exclude_pages: false                  # Exclude Page objects from LicenseCheck. $(exclude_pages) $(exclude_pages) $(exclude_pages)
        exclude_reports: false                # Exclude Report objects from LicenseCheck. $(exclude_reports) $(exclude_reports) $(exclude_reports)
        exclude_xmlports: false               # Exclude XMLPort objects from LicenseCheck. $(exclude_xmlports) $(exclude_xmlports) $(exclude_xmlports)
        exclude_queries: false                # Exclude Query objects from LicenseCheck. $(exclude_queries) $(exclude_queries) $(exclude_queries)
        altool_package_version: 18.0.33.65164-beta# Version of the microsoft.dynamics.businesscentral.development.tools NuGet package to use for altool.exe and CodeAnalysis DLL. $(altool_package_version) $(altool_package_version) $(altool_package_version)
        warning_only: false                   # Only post warning, do not fail pipeline. $(warning_only) $(warning_only) $(warning_only)
```

