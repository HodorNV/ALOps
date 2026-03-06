```yaml
    - task: ALOpsAppValidation@1
      displayName: 'ALOps App Validation'
      inputs:
        license_path:                         # Path or URL of the Business Central FLF license file to import before validation. Must be a fully qualified path, a path relative to $(System.DefaultWorkingDirectory), or an HTTP/HTTPS URL. $(license_path)
        countries:                            # Comma-separated list of country codes to validate the app against, for example W1,DK,BE. When empty, the countries listed in AppSourceCop.json are used. $(countries)
        affixes:                              # Comma-separated list of object name affixes the app is required to use, for example ABC. AppSourceCop enforces that these affixes are present in all custom object names. $(affixes)
        artifact_path: $(System.ArtifactsDirectory)# Folder containing the .app files to validate. Supports pipeline variables such as $(System.ArtifactsDirectory). $(artifact_path)
        artifact_filter: *.app                # Glob filter applied inside artifact_path to select the .app files to validate, for example *.app. $(artifact_filter)
        installapps_path: $(System.ArtifactsDirectory)# Folder containing dependency .app files that must be installed before the validated app can be published. $(installapps_path)
        installapps_filter: *.app             # Glob filter applied inside installapps_path to select which dependency apps to install. $(installapps_filter)
        previousapps_path: $(System.ArtifactsDirectory)# Folder containing the previous version of the app. Used for upgrade compatibility validation and data upgrade testing. $(previousapps_path)
        previousapps_filter: *.app            # Glob filter applied inside previousapps_path to select which previous-version apps to use for upgrade validation. $(previousapps_filter)
        memory: 8G                            # Maximum memory allocated to the Docker container used for validation, for example 8G. Increase this for larger apps or when memory pressure causes failures. $(memory)
        validateversion:                      # Full or partial Business Central version to validate against, for example 22.0 or 22.3.12345. When set, the app is also validated against this specific BC version in addition to the standard targets. $(validateversion)
        validatecurrent: False                # When enabled, validate the app against the currently released version of Business Central. $(validatecurrent)
        validatenextminor: False              # When enabled, validate the app against the next upcoming minor version of Business Central. Useful for early compatibility testing. $(validatenextminor)
        validatenextmajor: False              # When enabled, validate the app against the next upcoming major version of Business Central. Useful for forward-compatibility testing before a new wave. $(validatenextmajor)
        sastoken:                             # Shared Access Signature token used to authenticate access to an Azure Storage Account containing BC artifacts. Leave empty for public artifact storage. $(sastoken)
        skipverification: False               # When enabled, skip Authenticode signature verification of the .app file before validation. Use this for unsigned development builds. $(skipverification)
        skipappsourcecop: False               # When enabled, skip the AppSource code analysis rules (AppSourceCop) during validation. Use this to focus on functional validation only. $(skipappsourcecop)
        includewarnings: False                # When enabled, AppSource validation warnings are included in the result output. By default only errors are reported. $(includewarnings)
        failonerror: True                     # When enabled, the task stops on the first validation error instead of collecting all errors and reporting them together at the end. $(failonerror)
        containername: bcserver               # Name assigned to the Docker container used for validation. Only change this when multiple DevOps pipeline agents run simultaneously on the same host to avoid container name conflicts. $(containername)
        accept_insider_eula: False            # Accept the insider EULA required to access next-minor and next-major Business Central artifacts. Required when validatenextminor or validatenextmajor is enabled. $(accept_insider_eula)
```

