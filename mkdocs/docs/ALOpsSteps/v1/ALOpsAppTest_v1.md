```yaml
    - task: ALOpsAppTest@1
      displayName: 'ALOps App Test'
      inputs:
        usedocker: False                      # Run tests inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
        fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
        nav_serverinstance:                   # Name of the Business Central Server instance to run tests against, for example BC140 or BC230. $(nav_serverinstance)
        tenant: default                       # Business Central tenant to run tests in. Use default for a single-tenant setup. $(tenant)
        companyname:                          # Name of the Business Central company to use when running tests. Leave empty to use the first available company. $(companyname)
        profile:                              # Business Central role center profile ID used for the test session. Leave empty to use the default profile. $(profile)
        bc_username:                          # User account name for connecting to Business Central to run tests. Leave empty to use Windows authentication. $(bc_username)
        bc_password:                          # Password for the Business Central test user. Store this in a pipeline secret variable. $(bc_password)
        bc_authentication: NavUserPassword    # Authentication type for the Business Central service tier connection. NavUserPassword is the default for containers. AAD is required for SaaS environments. $(bc_authentication)
        bc_webclient_url:                     # URL of the Business Central web client. Required when the test runner needs to resolve the web client endpoint for UI tests. $(bc_webclient_url)
        testfilter:                           # Filter to select which test codeunits to include in the test suite. Supports codeunit ID ranges, names, or patterns separated by semicolons. $(testfilter)
        disabledtests:                        # Path to a JSON file listing individual test methods to skip. Useful for temporarily disabling known-failing or unstable tests without modifying AL source code. $(disabledtests)
        show_available_tests: True            # When enabled, print a list of all discovered test methods to the pipeline log before running. Helpful for diagnosing which tests are picked up. $(show_available_tests)
        import_testtoolkit: True              # Import the Test ToolKit FOB file into Business Central before running tests. Required when the Test Toolkit is not already present in the environment. $(import_testtoolkit)
        import_action: Overwrite              # Action to take when importing the Test Toolkit FOB. Overwrite replaces existing objects. Skip aborts the import if the objects already exist. Default uses the server default behavior. $(import_action)
        testpage: 130409                      # Page ID of the test runner page used to execute tests. The standard AL Test Runner page is 130409. $(testpage)
        testsuite: DEFAULT                    # Name of the test suite in Business Central to activate and run. The DEFAULT suite covers all available tests. $(testsuite)
        extensionid:                          # GUID of the specific Business Central extension to test. When set, only tests from this extension are included in the run. $(extensionid)
        installaltesttool: False              # Install the AL Test Tool and test library apps required for running BC unit tests on version 15 and later. $(installaltesttool)
        failed_test_action: Warning           # Action to take when a test method fails. Ignore continues without flagging. Warning marks the task as partially succeeded. Error fails the pipeline task. $(failed_test_action)
        override_finsql_path:                 # Override the automatic detection of finsql.exe with a fixed path. Use this if the executable is in a non-standard location. $(override_finsql_path)
        resultfilename: TestResults.xml       # Filename for the XML test results file written to the working directory. This file is published as a test result artifact and can be consumed by the Azure DevOps test results tab. $(resultfilename)
        testrunnercodeunitid:                 # Codeunit ID of a custom test runner to use instead of the default AL test runner. Leave empty to use the standard runner. $(testrunnercodeunitid)
        allow_zero_tests: False               # When enabled, the task succeeds even if no test methods are found in the target extension. Disable this to catch misconfigured test setups. $(allow_zero_tests)
```

