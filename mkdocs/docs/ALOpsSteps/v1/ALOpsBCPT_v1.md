```yaml
    - task: ALOpsBCPT@1
      displayName: 'ALOps BCPT'
      inputs:
        usedocker: False                      # Run task in Docker container. $(usedocker)
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
        export_results: False                 # Export BCPT Results. $(export_results)
        suite_code:                           # BCPT Suite to run. $(suite_code)
        test_runner_page: 149002              # BCPT Page to run. $(test_runner_page)
```

