```yaml
    - task: ALOpsBCPT@1
      displayName: 'ALOps BCPT'
      inputs:
        usedocker: False                      # Run the BCPT test suite inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
        fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
        export_results: False                 # Export the BCPT test results to a file after the run. When enabled, results are saved to the working directory and can be published as pipeline artifacts. $(export_results)
        suite_code:                           # Code of the BCPT suite to execute, as configured in Business Central. Leave empty to run all available BCPT suites. $(suite_code)
        test_runner_page: 149002              # Page ID of the BCPT test runner page in Business Central. The standard BCPT runner page is 149002. $(test_runner_page)
```

