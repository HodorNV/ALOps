```yaml
    - task: ALOpsDockerRemove@3
      displayName: 'ALOps Docker Remove'
      inputs:
        fixed_tag:                            # Fixed container label. When set, the container is identified by this value instead of the build ID. $(fixed_tag) $(fixed_tag) $(fixed_tag)
        print_logs: true                      # Print all container logs before removal. Useful for post-mortem diagnostics. $(print_logs) $(print_logs) $(print_logs)
        createsqlbackup: disabled             # When to create a SQL database backup from the container. 'On Failure' requires job_status to be set (see Cleanup Options). $(createsqlbackup) $(createsqlbackup) $(createsqlbackup)
        sqlcompression: false                 # Use SQL backup compression. Not supported on SQL Server Express editions. Only applies when 'SQL Backup' is not 'Disabled'. $(sqlcompression) $(sqlcompression) $(sqlcompression)
        zipsqlbackup: true                    # Compress the SQL backup into a zip archive, reducing artifact storage size. When disabled the raw .bak file is kept instead. Only applies when 'SQL Backup' is not 'Disabled'. $(zipsqlbackup) $(zipsqlbackup) $(zipsqlbackup)
        publishsqlbackup: true                # Upload the SQL backup as a build artifact so it can be downloaded or restored later. When disabled the backup is still created and kept in the agent artifact directory — its path is always published as variable 'ALOPS_CONTAINER_SQLBACKUP' and output 'sqlbackup_path'. Only applies when 'SQL Backup' is not 'Disabled'. $(publishsqlbackup) $(publishsqlbackup) $(publishsqlbackup)
        createeventlogbackup: disabled        # When to create an Application EventLog backup from the container. 'On Failure' requires job_status to be set (see Cleanup Options). $(createeventlogbackup) $(createeventlogbackup) $(createeventlogbackup)
        job_status: Succeeded                 # Pipeline job status for 'On Failure' backup logic. Set to 'Agent.JobStatus' in Azure DevOps or 'job.status' in GitHub Actions. $(job_status) $(job_status) $(job_status)
        docker_registry:                      # Docker registry URL for logout. Leave empty to skip logout. Should match the registry used in ALOps Docker Start. $(docker_registry) $(docker_registry) $(docker_registry)
```

