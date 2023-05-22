```yaml
    - task: ALOpsAgentMaintenance@1
      displayName: 'ALOps Agent Maintenance'
      inputs:
        removeoldtasks: False                 # Remove old ALOps tasks. $(removeoldtasks)
        removeunusedcontainers: False         # Force docker container pruning. $(removeunusedcontainers)
        pruneimagesdayscreated: 0             # Force docker image pruning based on creation date (x days). $(pruneimagesdayscreated)
        pruneimagesosbased: False             # Prune images based on old OS. $(pruneimagesosbased)
        removebcartifacts: False              # Remove BC Artifacts. $(removebcartifacts)
        bcartifactscachefolder: C:\bcartifacts.cache# Set non-default BC Artifact Cache folder. $(bcartifactscachefolder)
        daysunused: 30                        # Define date-range for cleanup BC-Artifacts. $(daysunused)
```

