```yaml
    - task: ALOpsAppValidation@1
      displayName: 'ALOps App Validation'
      inputs:
        license_path:                         # Path of the FLF license to import. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory) or a downloadable Url. $(license_path)
        countries:                            # Comma seperated array of countries to validate. When blank SupportedCountries value from AppSourceCop.json is used. $(countries)
        affixes:                              # Comma seperated array of affixes. $(affixes)
        artifact_path: $(System.ArtifactsDirectory)# Path for App Artifact(s). $(artifact_path)
        artifact_filter: *.app                # Filter used for locating App file relative to $(artifact_path). $(artifact_filter)
        installapps_path: $(System.ArtifactsDirectory)# Path for InstallApps Artifact(s). $(installapps_path)
        installapps_filter: *.app             # Filter used for locating App file relative to $(installapps_path). $(installapps_filter)
        previousapps_path: $(System.ArtifactsDirectory)# Path for PreviousApps Artifact(s). $(previousapps_path)
        previousapps_filter: *.app            # Filter used for locating App file relative to $(previousapps_path). $(previousapps_filter)
        memory: 8G                            # Set maximum memory for Container. $(memory)
        validateversion:                      # Full or partial version number. If specified, apps will also be validated against this version. $(validateversion)
        validatecurrent: False                # Validate against current version of Business Central. $(validatecurrent)
        validatenextminor: False              # Validate against Next Minor version of Business Central. $(validatenextminor)
        validatenextmajor: False              # Validate against Next Major version of Business Central. $(validatenextmajor)
        sastoken:                             # SAS Token used to access Storage Account. $(sastoken)
        skipverification: False               #  $(skipverification)
        skipappsourcecop: False               #  $(skipappsourcecop)
        includewarnings: False                # Include this switch if you want to include Warnings. $(includewarnings)
        failonerror: True                     # Include this switch if you want to fail on the first error instead of returning all errors to the caller. $(failonerror)
        containername: bcserver               # Only required when running multiple DevOps Agents on the same server. (Not recommended) $(containername)
```

