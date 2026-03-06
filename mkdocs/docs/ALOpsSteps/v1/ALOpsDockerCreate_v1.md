```yaml
    - task: ALOpsDockerCreate@1
      displayName: 'ALOps Docker Create'
      inputs:
        artifactspecification: Specific       # Method used to resolve the BC artifact. Specific resolves the artifact described by artifacttype, artifactversion, and artifactcountry. Hint resolves the artifact from a JSON hint file specified in artifacthint. $(artifactspecification)
        artifactversion:                      # Business Central or NAV version number to use for the container image, for example 22.5, NAV2018, or 16.4.24524. Leave empty when using versionselect to resolve automatically. $(artifactversion)
        artifacttype: OnPrem                  # Type of BC artifact to use. OnPrem provides on-premises binaries. Sandbox provides the same binaries used in Business Central cloud environments. $(artifacttype)
        artifactcountry:                      # Two-letter country code for the localized BC artifact, for example W1, DK, or US. Use W1 for the international base version. $(artifactcountry)
        versionselect: Latest                 # Version selection strategy when artifactversion is not pinned to an exact build. Use Latest to always pull the newest available version, or specify a partial version for the newest matching build. $(versionselect)
        artifacthint:                         # Path or URL of a JSON hint file that describes the artifact to use. Only applicable when artifactspecification is set to Hint. $(artifacthint)
        multitenant: False                    # Create a multi-tenant container image where each tenant is isolated in its own database. Required for multi-tenant test scenarios. $(multitenant)
        memory: 8G                            # Maximum memory assigned to the Docker container, for example 8G. Increase this for large databases or when the BC server runs out of memory during startup. $(memory)
        imageprefix: myImage                  # Prefix used as the base name for the created Docker image. Combined with imagenametemplate to form the full image tag. $(imageprefix)
        dockerregistry:                       # Docker registry to pull the base image from or push the created image to, for example bcinsider.azurecr.io. Leave empty to use Docker Hub. $(dockerregistry)
        dockerusername:                       # Username for authenticating to the Docker registry. Leave empty for public registries. $(dockerusername)
        dockerpassword:                       # Password for authenticating to the Docker registry. Store this in a pipeline secret variable. $(dockerpassword)
        storageaccount:                       # Azure Storage Account name that hosts the BC artifact files. Only required when using a non-default or private artifact storage location. $(storageaccount)
        sastoken:                             # Shared Access Signature token for authenticating to the Azure Storage Account. Leave empty when the storage account allows public access. $(sastoken)
        forcecreateimage: False               # When enabled, a new image is always built locally and the Docker pull step is skipped. Useful when the target registry is not reachable from the agent. $(forcecreateimage)
        myscripts:                            # One entry per line: paths or URLs of PowerShell scripts to embed in the created image as myScripts. These scripts run automatically when a container is started from this image. $(myscripts)
        imagenametemplate: %IMAGE_PREFIX%:%ARTIFACT_TYPE%-%ARTIFACT_VERSION%-%ARTIFACT_COUNTRY%-%OS_VERSION%-%OS_LTSC%# Template for the full Docker image tag. Available tokens: %IMAGE_PREFIX%, %ARTIFACT_TYPE%, %ARTIFACT_VERSION%, %ARTIFACT_COUNTRY%, %OS_VERSION%, %OS_LTSC%. $(imagenametemplate)
        use_generic_image:                    # Fully qualified name of a base Docker image to use instead of the default navcontainerhelper generic image. $(use_generic_image)
        licensefile:                          # Path or URL of a Business Central license file (.flf or .bclicense) to include in the created image. The license is applied automatically when a container starts. $(licensefile)
        includetesttoolkit: False             # Include the complete BC Test Toolkit (test libraries, test framework, and performance toolkit) in the created image. $(includetesttoolkit)
        includetestlibrariesonly: False       # Include only the test library apps in the created image, without the full test framework. Reduces image size when only library-dependent tests are needed. $(includetestlibrariesonly)
        includetestframeworkonly: False       # Include only the core test framework apps in the created image, without test libraries or performance toolkit. $(includetestframeworkonly)
        includeperformancetoolkit: False      # Include the BC Performance Toolkit in the created image to enable BCPT performance benchmarking. $(includeperformancetoolkit)
        accept_insider_eula: False            # Accept the insider program end-user license agreement required to access Business Central insider or preview artifacts. $(accept_insider_eula)
        alternativeartifacturl:               # Full artifact URL that overrides the URL resolved from artifacttype, artifactcountry, and versionselect. Use this to pin to an exact artifact URL. $(alternativeartifacturl)
```

