```yaml
    - task: ALOpsDockerRemove@3
      displayName: 'ALOps Docker Remove'
      inputs:
        fixed_tag:                            # Fixed container label. When set, the container is identified by this value instead of the build ID. $(fixed_tag) $(fixed_tag) $(fixed_tag)
        print_logs: true                      # Print all container logs before removal. Useful for post-mortem diagnostics. $(print_logs) $(print_logs) $(print_logs)
        createsqlbackup: disabled             # When to create a SQL database backup from the container. 'On Failure' requires job_status to be set (see Cleanup Options). $(createsqlbackup) $(createsqlbackup) $(createsqlbackup)
        sqlcompression: false                 # Use SQL backup compression. Not supported on SQL Server Express editions. $(sqlcompression) $(sqlcompression) $(sqlcompression)
        createeventlogbackup: disabled        # When to create an Application EventLog backup from the container. 'On Failure' requires job_status to be set (see Cleanup Options). $(createeventlogbackup) $(createeventlogbackup) $(createeventlogbackup)
        job_status: Succeeded                 # Pipeline job status for 'On Failure' backup logic. Set to 'Agent.JobStatus' in Azure DevOps or 'job.status' in GitHub Actions. $(job_status) $(job_status) $(job_status)
        docker_registry:                      # Docker registry URL for logout. Leave empty to skip logout. Should match the registry used in ALOps Docker Start. $(docker_registry) $(docker_registry) $(docker_registry)
```

