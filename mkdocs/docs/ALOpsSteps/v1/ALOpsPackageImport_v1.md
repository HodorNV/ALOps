```yaml
    - task: ALOpsPackageImport@1
      displayName: 'ALOps Package Import'
      inputs:
        usedocker: True                       # Run the RapidStart package import inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
        fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
        company_name:                         # Name of the Business Central company into which the RapidStart configuration package will be imported. Must exactly match the company name as it appears in Business Central. $(company_name)
```

