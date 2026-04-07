```yaml
    - task: ALOpsInfo@3
      displayName: 'ALOps Info'
      inputs:
        free_mem_threshold: 0                 # Minimum free memory percentage required. Set to 0 to disable the check. $(free_mem_threshold) $(free_mem_threshold) $(free_mem_threshold)
        free_mem_threshold_action: Warn       # Action to take when free memory is below the threshold. $(free_mem_threshold_action) $(free_mem_threshold_action) $(free_mem_threshold_action)
        free_disk_threshold: 0                # Minimum free disk space percentage required per drive. Set to 0 to disable the check. $(free_disk_threshold) $(free_disk_threshold) $(free_disk_threshold)
        free_disk_threshold_action: Warn      # Action to take when free disk space is below the threshold. $(free_disk_threshold_action) $(free_disk_threshold_action) $(free_disk_threshold_action)
        docker_containers_action: Error       # Action to take when Docker containers are found on the agent. Set to Ignore to skip the check. $(docker_containers_action) $(docker_containers_action) $(docker_containers_action)
```

