```yaml
    - task: ALOpsAgentMaintenance@3
      displayName: 'ALOps Agent Maintenance'
      inputs:
        dockercontainers: False               # Remove all stopped/exited Docker containers (docker container prune). $(dockercontainers) $(dockercontainers) $(dockercontainers)
        dockerimages: False                   # Remove Docker images older than the specified number of days. $(dockerimages) $(dockerimages) $(dockerimages)
        pruneimagesdayscreated: 0             # Remove Docker images older than this many days. Set to 0 to skip age-based image pruning. $(pruneimagesdayscreated) $(pruneimagesdayscreated) $(pruneimagesdayscreated)
        dockerimagesbyos: False               # Remove Docker images whose OS version does not match the host OS. Uses direct Docker inspect (no BcContainerHelper dependency). $(dockerimagesbyos) $(dockerimagesbyos) $(dockerimagesbyos)
        dockervolumes: False                  # Remove all dangling (unused) Docker volumes. $(dockervolumes) $(dockervolumes) $(dockervolumes)
        dockerbuildcache: False               # Remove all Docker build cache (docker builder prune). $(dockerbuildcache) $(dockerbuildcache) $(dockerbuildcache)
        bcartifacts: False                    # Remove unused BC Artifact cache folders, orphaned VSIX extractions, temp folders, and empty directories. $(bcartifacts) $(bcartifacts) $(bcartifacts)
        bcartifactscachefolder:               # Path to the BC Artifacts cache folder. Leave empty for auto-detection (checks bcaboragentartifactspath env var, then falls back to C:\bcartifacts.cache). $(bcartifactscachefolder) $(bcartifactscachefolder) $(bcartifactscachefolder)
        packagecache: False                   # Remove old ALTool/compiler packages from the agent tools directory and old NuGet global cache packages. $(packagecache) $(packagecache) $(packagecache)
        oldtasks: False                       # Remove old ALOps task version folders from the agent. Auto-detects the current version and removes all older versions. $(oldtasks) $(oldtasks) $(oldtasks)
        agenttemp: False                      # Remove old files and folders from the agent temp directory (AGENT_TEMPDIRECTORY). $(agenttemp) $(agenttemp) $(agenttemp)
        windowstemp: False                    # Remove old files and folders from the Windows temp directory (TEMP). $(windowstemp) $(windowstemp) $(windowstemp)
        daysunused: 30                        # Threshold in days for cleanup operations. Items not used within this period are removed. Applies to BCArtifacts, AgentTemp, WindowsTemp, and PackageCache operations. $(daysunused) $(daysunused) $(daysunused)
        dryrun: False                         # When enabled, reports what would be cleaned without actually deleting anything. Use this for change management review before running actual cleanup. $(dryrun) $(dryrun) $(dryrun)
        erroraction: Warn                     # How cleanup failures affect the task result. 'Error' fails the task on any cleanup error. 'Warn' marks the task as SucceededWithIssues. 'Ignore' silently continues. $(erroraction) $(erroraction) $(erroraction)
```

