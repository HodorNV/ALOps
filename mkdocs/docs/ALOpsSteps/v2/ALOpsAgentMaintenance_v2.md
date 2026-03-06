```yaml
    - task: ALOpsAgentMaintenance@2
      displayName: 'ALOps Agent Maintenance'
      inputs:
        removeoldtasks: False                 # Remove old ALOps tasks. $(removeoldtasks) $(removeoldtasks)
        removeunusedcontainers: False         # Force docker container pruning. $(removeunusedcontainers) $(removeunusedcontainers)
        pruneimagesdayscreated: 0             # Force docker image pruning based on creation date (x days). $(pruneimagesdayscreated) $(pruneimagesdayscreated)
        pruneimagesosbased: False             # Prune images based on old OS. $(pruneimagesosbased) $(pruneimagesosbased)
        removebcartifacts: False              # Remove BC Artifacts. $(removebcartifacts) $(removebcartifacts)
        bcartifactscachefolder: C:\bcartifacts.cache# Set non-default BC Artifact Cache folder. $(bcartifactscachefolder) $(bcartifactscachefolder)
        daysunused: 30                        # Define date-range for cleanup BC-Artifacts. $(daysunused) $(daysunused)
```

