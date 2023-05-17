```yaml
    - task: ALOpsAppTest@1
      displayName: 'ALOps App Test'
      inputs:
        usedocker: False                      # Run task in Docker container. $(usedocker)
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
        nav_serverinstance: BC140             # Business Central Server Instance Name. $(nav_serverinstance)
        tenant: default                       # Business Central Tenant. $(tenant)
        companyname:                          # Business Central Company. $(companyname)
        profile:                              # Business Central Profile. $(profile)
        bc_username:                          # BC Username for ServiceTier connection. $(bc_username)
        bc_password:                          # BC User Password for ServiceTier connection. $(bc_password)
        bc_authentication: NavUserPassword    # BC Authentication type of the ServiceTier. $(bc_authentication)
        bc_webclient_url:                     # BC WebClient Endpoint. $(bc_webclient_url)
        testfilter:                           # Filter codeunits to include in Test-Suite. $(testfilter)
        disabledtests:                        # Disabled Tests File. $(disabledtests)
        show_available_tests: True            # Show all available tests. $(show_available_tests)
        import_testtoolkit: True              # Import TestToolKit FOB. $(import_testtoolkit)
        import_action: Overwrite              # Import Action for importing Test-Suite FOB files. $(import_action)
        testpage: 130409                      # Set the PageId used for testing. $(testpage)
        testsuite: DEFAULT                    # Set target Test Suite to activate. $(testsuite)
        extensionid:                          # Set Extension ID. $(extensionid)
        installaltesttool: False              # Install the AL TestTool for v15. $(installaltesttool)
        failed_test_action: Warning           # Action to take when a Test failed. $(failed_test_action)
        override_finsql_path:                 # Overrule automatic detection of FinSql with fixed value. $(override_finsql_path)
        resultfilename: TestResults.xml       # Set filename for the Result XML. $(resultfilename)
        testrunnercodeunitid:                 # Set the Codeunit Id for the test-runner to use. $(testrunnercodeunitid)
```

