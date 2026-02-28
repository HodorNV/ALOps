```yaml
    - task: ALOpsBCReplay@3
      displayName: 'ALOps BC Replay'
      inputs:
        tests: $(System.DefaultWorkingDirectory)\recordings\*.yml# File glob pattern to select the recording `.yml` files to run. Maps to the `-Tests` parameter of `npx replay`. $(tests) $(tests) $(tests)
        start_address:                        # URL to the deployed BC web client. For Docker: `http://localhost:<port>/`. For SaaS: `https://<tenant>.businesscentral.dynamics.com/`. Maps to `-StartAddress`. $(start_address) $(start_address) $(start_address)
        authentication: Windows               # Authentication method to use against the BC web client. `Windows` for on-prem/Docker, `AAD` for SaaS/cloud, `UserPassword` for basic auth. $(authentication) $(authentication) $(authentication)
        username_key:                         # Name of the environment variable containing the username. Required when Authentication is set to `AAD` or `UserPassword`. Maps to `-UserNameKey`. $(username_key) $(username_key) $(username_key)
        password_key:                         # Name of the environment variable containing the password or PAT. Required when Authentication is set to `AAD` or `UserPassword`. Maps to `-PasswordKey`. $(password_key) $(password_key) $(password_key)
        multifactor_type: None                # MFA mechanism. Only available with AAD authentication. Maps to `-MultiFactorType`. $(multifactor_type) $(multifactor_type) $(multifactor_type)
        multifactor_secret_key:               # Name of the environment variable storing the MFA secret. For TOTP: the TOTP secret key. For Certificate: Base64-encoded PFX certificate. Maps to `-MultiFactorSecretKey`. $(multifactor_secret_key) $(multifactor_secret_key) $(multifactor_secret_key)
        result_dir: $(Agent.TempDirectory)\bcreplay_results# Directory to write test results. Maps to `-ResultDir`. $(result_dir) $(result_dir) $(result_dir)
        npm_install: true                     # Automatically install `@microsoft/bc-replay` and Playwright browsers before running. When `false`, expects `@microsoft/bc-replay` to be pre-installed (e.g. in a prior pipeline step). Requires Node.js >= 16.14.0 on the agent. $(npm_install) $(npm_install) $(npm_install)
        bcreplay_version: latest              # Version of `@microsoft/bc-replay` to install. Use `latest` for the newest version or pin to a specific version (e.g. `0.1.119`). Only used when Auto-Install is enabled. $(bcreplay_version) $(bcreplay_version) $(bcreplay_version)
        failed_action: Error                  # Action to take when one or more replay recordings fail. `Error`: fail the task. `Warning`: succeed with issues. `Ignore`: succeed silently. $(failed_action) $(failed_action) $(failed_action)
        publish_results: true                 # Publish replay results as Azure DevOps test results (visible in the Tests tab). $(publish_results) $(publish_results) $(publish_results)
        publish_summary: true                 # Generate and publish a markdown summary report as a build artifact. $(publish_summary) $(publish_summary) $(publish_summary)
        pwsh: true                            # Run task in Powershell Core. $(pwsh) $(pwsh) $(pwsh)
```

