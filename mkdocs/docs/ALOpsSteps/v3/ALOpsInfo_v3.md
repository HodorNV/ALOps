```yaml
    - task: ALOpsInfo@3
      displayName: 'ALOps Info'
      inputs:
        freemem_threshold: 0                  # Minimum required free memory percentage. Set to 0 to disable. When free memory drops below this value, a warning or error is generated based on the threshold action. $(freemem_threshold) $(freemem_threshold) $(freemem_threshold)
        freemem_threshold_action: Warn        # Action to take when the free memory threshold is not met. Warn = task succeeds with issues. Error = task fails. $(freemem_threshold_action) $(freemem_threshold_action) $(freemem_threshold_action)
        freedisk_threshold: 0                 # Minimum required free disk space percentage. Set to 0 to disable. When any drive's free space drops below this value, a warning or error is generated based on the threshold action. $(freedisk_threshold) $(freedisk_threshold) $(freedisk_threshold)
        freedisk_threshold_action: Warn       # Action to take when the free disk threshold is not met. Warn = task succeeds with issues. Error = task fails. $(freedisk_threshold_action) $(freedisk_threshold_action) $(freedisk_threshold_action)
        docker_containers_action: Error       # Action to take when existing Docker containers are found on the agent. Ignore = no action. Warn = task succeeds with issues. Error = task fails. $(docker_containers_action) $(docker_containers_action) $(docker_containers_action)
```

