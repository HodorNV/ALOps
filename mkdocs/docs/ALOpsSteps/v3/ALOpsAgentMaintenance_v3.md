```yaml
    - task: ALOpsAgentMaintenance@3
      displayName: 'ALOps Agent Maintenance'
      inputs:
        docker_containers: false              # Remove all stopped/exited Docker containers (docker container prune). $(docker_containers) $(docker_containers) $(docker_containers)
        docker_images: false                  # Remove Docker images older than the specified number of days. $(docker_images) $(docker_images) $(docker_images)
        prune_images_days_created: 0          # Remove Docker images older than this many days. Set to 0 to skip age-based image pruning. (Only applies when 'Prune Docker Images by Age' is enabled.) $(prune_images_days_created) $(prune_images_days_created) $(prune_images_days_created)
        docker_images_by_os: false            # Remove Docker images whose OS version does not match the host OS. Uses direct Docker inspect (no BcContainerHelper dependency). Primarily relevant for Windows containers. $(docker_images_by_os) $(docker_images_by_os) $(docker_images_by_os)
        docker_volumes: false                 # Remove all dangling (unused) Docker volumes. $(docker_volumes) $(docker_volumes) $(docker_volumes)
        docker_build_cache: false             # Remove all Docker build cache (docker builder prune). $(docker_build_cache) $(docker_build_cache) $(docker_build_cache)
        bc_artifacts: false                   # Remove unused BC Artifact cache folders, orphaned VSIX extractions, temp folders, and empty directories. $(bc_artifacts) $(bc_artifacts) $(bc_artifacts)
        bc_artifacts_cache_folder:            # Path to the BC Artifacts cache folder. Leave empty for auto-detection (checks bcaboragentartifactspath env var, then falls back to a platform default). (Only applies when 'Clean BC Artifacts Cache' is enabled.) $(bc_artifacts_cache_folder) $(bc_artifacts_cache_folder) $(bc_artifacts_cache_folder)
        package_cache: false                  # Remove old ALTool/compiler packages from the agent tools directory and old NuGet global cache packages. $(package_cache) $(package_cache) $(package_cache)
        old_tasks: false                      # Remove old ALOps task version folders from the agent. Auto-detects the current version and removes all older versions. (Azure DevOps agents only.) $(old_tasks) $(old_tasks) $(old_tasks)
        agent_temp: false                     # Remove old files and folders from the agent temp directory (AGENT_TEMPDIRECTORY / RUNNER_TEMP). $(agent_temp) $(agent_temp) $(agent_temp)
        windows_temp: false                   # Remove old files and folders from the Windows temp directory (TEMP). Windows agents only; no-ops on other platforms. $(windows_temp) $(windows_temp) $(windows_temp)
        days_unused: 30                       # Threshold in days for cleanup operations. Items not used within this period are removed. Applies to BC Artifacts, Agent Temp, Windows Temp, and Package Cache operations. $(days_unused) $(days_unused) $(days_unused)
        dry_run: false                        # When enabled, reports what would be cleaned without actually deleting anything. Use this for change-management review before running actual cleanup. $(dry_run) $(dry_run) $(dry_run)
        failure_action: Warn                  # How cleanup failures affect the task result. 'Error' fails the task on any cleanup error. 'Warn' logs warnings (SucceededWithIssues). 'Ignore' silently continues. $(failure_action) $(failure_action) $(failure_action)
```

