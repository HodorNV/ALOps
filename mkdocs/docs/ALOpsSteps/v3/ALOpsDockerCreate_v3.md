```yaml
    - task: ALOpsDockerCreate@3
      displayName: 'ALOps Docker Create'
      inputs:
        artifact_specification: Specific      # How to resolve BC artifacts. 'Specific' uses the version/type/country fields directly. 'Hint' reads them from a JSON hint file. $(artifact_specification) $(artifact_specification) $(artifact_specification)
        artifact_version:                     # BC artifact version, for example '24.0'. Leave empty for latest. $(artifact_version) $(artifact_version) $(artifact_version)
        artifact_type: Sandbox                # Type of BC artifact to download. $(artifact_type) $(artifact_type) $(artifact_type)
        artifact_country:                     # Country code for the BC artifact (e.g. 'us', 'w1'). Leave empty for W1. $(artifact_country) $(artifact_country) $(artifact_country)
        version_select: Latest                # Version selection strategy when multiple versions match. $(version_select) $(version_select) $(version_select)
        artifact_hint:                        # Path to a JSON hint file containing Version, Type, and Country fields. Used when Artifact Specification is 'Hint'. $(artifact_hint) $(artifact_hint) $(artifact_hint)
        alternative_artifact_url:             # Direct URL to BC artifacts. Overrides all other artifact resolution fields. $(alternative_artifact_url) $(alternative_artifact_url) $(alternative_artifact_url)
        storage_account:                      # Azure storage account for artifact downloads. Leave empty for default. $(storage_account) $(storage_account) $(storage_account)
        sas_token:                            # SAS token for private artifact storage. Store this in a pipeline secret variable. $(sas_token) $(sas_token) $(sas_token)
        image_prefix:                         # Prefix for the Docker image name (e.g. registry hostname). Can include registry path. $(image_prefix) $(image_prefix) $(image_prefix)
        image_name_template: %IMAGE_PREFIX%-%ARTIFACT_TYPE%-%ARTIFACT_VERSION%-%ARTIFACT_COUNTRY%-%OS_LTSC%# Template for generating the image name. Tokens: %IMAGE_PREFIX%, %ARTIFACT_TYPE%, %ARTIFACT_VERSION%, %ARTIFACT_COUNTRY%, %OS_VERSION%, %OS_LTSC%. $(image_name_template) $(image_name_template) $(image_name_template)
        use_generic_image:                    # Override the base generic image. Leave empty for auto-detection based on host OS. $(use_generic_image) $(use_generic_image) $(use_generic_image)
        memory: 8G                            # Docker build memory limit (e.g. '8G', '16G'). $(memory) $(memory) $(memory)
        force_create_image: false             # Force image rebuild even if the image already exists locally or in the registry. $(force_create_image) $(force_create_image) $(force_create_image)
        my_scripts:                           # Scripts to embed in the image's c:\run\my folder. One path or URL per line. Supports | delimiter for backward compatibility. $(my_scripts) $(my_scripts) $(my_scripts)
        docker_registry:                      # Docker registry URL for push/pull. Leave empty if not using a private registry. $(docker_registry) $(docker_registry) $(docker_registry)
        docker_username:                      # Username for Docker registry authentication. $(docker_username) $(docker_username) $(docker_username)
        docker_password:                      # Password for Docker registry authentication. Store this in a pipeline secret variable. $(docker_password) $(docker_password) $(docker_password)
        include_test_toolkit: false           # Include the full BC test toolkit in the image. $(include_test_toolkit) $(include_test_toolkit) $(include_test_toolkit)
        include_test_libraries_only: false    # Include only test libraries (not the full test toolkit). $(include_test_libraries_only) $(include_test_libraries_only) $(include_test_libraries_only)
        include_test_framework_only: false    # Include only the test framework (not test libraries or full toolkit). $(include_test_framework_only) $(include_test_framework_only) $(include_test_framework_only)
        include_performance_toolkit: false    # Include the BC performance toolkit in the image. $(include_performance_toolkit) $(include_performance_toolkit) $(include_performance_toolkit)
        license_file:                         # Path or URL to a BC license file (.flf or .bclicense) to embed in the image. $(license_file) $(license_file) $(license_file)
        accept_insider_eula: false            # Accept the Insider EULA for preview/insider artifact builds. $(accept_insider_eula) $(accept_insider_eula) $(accept_insider_eula)
        multitenant: false                    # Build a multitenant BC Docker image. $(multitenant) $(multitenant) $(multitenant)
```

