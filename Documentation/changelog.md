# Change Log
All notable changes to the "ALOps" extension.

## [v1.421] - 2019-06-24
- ALOpsFobImport: Added parameter for NAV Server Instance name

## [v1.420] - 2019-06-17
- Added YAML templates for AL Projects: https://dev.azure.com/HodorNV/ALOps%20Templates
- ALOpsAppCompiler: Added boolean parameter 'download_test_symbols' for enabling explicit Test-Package download
- ALOpsAppCompiler: Added parameter 'al_analyzer', a comma separated list of Analyzers. Example: PerTenantExtensionCop,UICop,CodeCop
- ALOpsAppCompiler: Automatically add AssemblyProbingPath if projects contains external controls
- ALOpsAppSign: The PFX password should be linked to the environment variable 'pfx_password'
- ALOpsAppTest: added Auto-Retry on the "Warm-up" step for the Test-Client
- ALOpsAppTest: Added boolean parameter 'import_testtoolkit', can be used to skip the import of the default test-suite-objects.
- ALOpsDockerStart: Add -ltsc2019 or -ltsc2016 to Docker Image depending on OS
- ALOpsDockerStart: Added multi-line parameter 'docker_parameters', these will be added to the [docker run] command
- ALOpsDockerStart: Removed 'No container found' message when not working with Fixed-Docker-Tags

