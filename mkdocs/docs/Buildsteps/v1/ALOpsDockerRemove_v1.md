    ```yaml
        - task: ALOpsDockerRemove@1
          displayName: 'ALOps Docker Remove'
          inputs:
            usedocker: True                       # Run task in Docker container. $(usedocker)
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            print_logs: True                      # Print all container logs before remove. $(print_logs)
            createeventlogbackup: disabled        # Create EventLog Backup from Container. $(createeventlogbackup)
            createsqlbackup: disabled             # Create SQL Backup from Container Database. $(createsqlbackup)
            publishsqlbackup: True                # Published the SQL Backup as Build-Artifact. $(publishsqlbackup)
            sqlcompression: False                 # Create Compressed SQL Backup (does not work on SQL-Express). $(sqlcompression)
            zipsqlbackup: True                    # ZIP the SQL Backup. $(zipsqlbackup)
    ```

