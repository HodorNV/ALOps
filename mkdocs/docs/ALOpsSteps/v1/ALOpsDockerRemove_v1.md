```yaml
    - task: ALOpsDockerRemove@1
      displayName: 'ALOps Docker Remove'
      inputs:
        usedocker: True                       # Identifies the Docker container to remove using the fixed tag. This must match the fixed_tag used when the container was started. $(usedocker)
        fixed_tag:                            # Fixed name tag of the Docker container to stop and remove. $(fixed_tag)
        print_logs: True                      # Print all container logs to the pipeline log before the container is removed. Useful for diagnosing failures without manually inspecting the container. $(print_logs)
        createeventlogbackup: disabled        # Create a Windows event log backup from the container before removing it. disabled never creates a backup. onfailure creates one only when the pipeline has failed. always creates one every run. $(createeventlogbackup)
        createsqlbackup: disabled             # Create a SQL Server database backup (.bak) from the container BC database before removing it. disabled skips the backup. onfailure creates one only on failure. always creates one every run. $(createsqlbackup)
        publishsqlbackup: True                # Upload the SQL backup file as a build artifact in Azure DevOps so it can be downloaded or restored later. $(publishsqlbackup)
        sqlcompression: False                 # Use SQL Server backup compression when creating the database backup. Significantly reduces backup file size. Not supported on SQL Server Express editions. $(sqlcompression)
        zipsqlbackup: True                    # Compress the SQL backup file into a zip archive before publishing it as a build artifact, reducing artifact storage size. $(zipsqlbackup)
```

