```yaml
    - task: ALOpsBCPT@2
      displayName: 'ALOps BCPT'
      inputs:
        usedocker: False                      # Run task in Docker container. $(usedocker) $(usedocker)
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag) $(fixed_tag)
        export_results: False                 # Export BCPT Results. $(export_results) $(export_results)
        suite_code:                           # BCPT Suite to run. $(suite_code) $(suite_code)
        test_runner_page: 149002              # BCPT Page to run. $(test_runner_page) $(test_runner_page)
```

