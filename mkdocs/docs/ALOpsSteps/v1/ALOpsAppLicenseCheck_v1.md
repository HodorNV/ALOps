```yaml
    - task: ALOpsAppLicenseCheck@1
      displayName: 'ALOps App License Check'
      inputs:
        usedocker: False                      # Run task in Docker container. $(usedocker)
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
        licensefile:                          # Set the BC License File. Path or Url. $(licensefile)
        artifact_path: $(System.ArtifactsDirectory)# Path for App Artifact. $(artifact_path)
        artifact_filter: *.app                # Filter used for locating App file relative to $(artifact_path). $(artifact_filter)
        artifact_include:                     # Include-Filter used for locating App file relative to $(artifact_path). $(artifact_include)
        artifact_exclude:                     # Exclude-Filter used for locating App file relative to $(artifact_path). $(artifact_exclude)
        exclude_ranges:                       # Exclude-Ranges from LicenseCheck (Buffer / Tempory tables). Format: 60000..60099,70000..70100 $(exclude_ranges)
        expiry_text:                          # String to find in license to match for ExpiryDate. $(expiry_text)
        expiry_dateformat:                    # Date Format of the Expiry date, example: dd.MM.yyyy $(expiry_dateformat)
        expiry_dayswarning:                   # Amount of days before License-Expiry for triggering a warning $(expiry_dayswarning)
        exclude_tables: False                 # Exclude Table objects from LicenseCheck. $(exclude_tables)
        exclude_codeunits: False              # Exclude Codeunit objects from LicenseCheck. $(exclude_codeunits)
        exclude_pages: False                  # Exclude Page objects from LicenseCheck. $(exclude_pages)
        exclude_reports: False                # Exclude Report objects from LicenseCheck. $(exclude_reports)
        exclude_xmlports: False               # Exclude XMLPort objects from LicenseCheck. $(exclude_xmlports)
        exclude_queries: False                # Exclude Query objects from LicenseCheck. $(exclude_queries)
        warning_only: False                   # Only post warning, do not fail pipeline. $(warning_only)
        pwsh: False                           # Run task in Powershell Core. $(pwsh)
```

