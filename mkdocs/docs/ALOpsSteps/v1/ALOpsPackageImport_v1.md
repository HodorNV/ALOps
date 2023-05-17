```yaml
    - task: ALOpsPackageImport@1
      displayName: 'ALOps Package Import'
      inputs:
        usedocker: True                       # Run task in Docker container. $(usedocker)
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
        company_name:                         # Company name for Package import. $(company_name)
```

