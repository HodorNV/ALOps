```yaml
    - task: ALOpsAgentMaintenance@1
      displayName: 'ALOps Agent Maintenance'
      inputs:
        removeoldtasks: False                 # Remove stale ALOps pipeline task artifacts left over from previous pipeline runs on this agent. Helps keep the agent workspace clean over time. $(removeoldtasks)
        removeunusedcontainers: False         # Run Docker container pruning to remove all stopped or unused containers on the build agent. Frees disk space between pipeline runs. $(removeunusedcontainers)
        pruneimagesdayscreated: 0             # Remove Docker images that were created more than this many days ago. Set to 0 to disable image pruning by creation date. $(pruneimagesdayscreated)
        pruneimagesosbased: False             # Remove Docker images whose base operating system is outdated, for example images based on older Windows Server versions that have been superseded. $(pruneimagesosbased)
        removebcartifacts: False              # Delete Business Central artifact packages from the local cache folder to free disk space. Artifacts are re-downloaded automatically the next time they are needed. $(removebcartifacts)
        bcartifactscachefolder: C:\bcartifacts.cache# File system path of the BC artifact cache folder to clean. Change this only if you configured a non-default cache location. Default is C:\bcartifacts.cache. $(bcartifactscachefolder)
        daysunused: 30                        # Remove BC artifact packages that have not been accessed for more than this many days. More recently used packages are preserved. $(daysunused)
```

