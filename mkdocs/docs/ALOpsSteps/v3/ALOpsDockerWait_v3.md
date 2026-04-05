```yaml
    - task: ALOpsDockerWait@3
      displayName: 'ALOps Docker Wait'
      inputs:
        fixed_tag:                            # Fixed container label. When set, the container is identified by this value instead of the build ID. $(fixed_tag) $(fixed_tag) $(fixed_tag)
        search_string: Ready for connections! # Log line(s) that indicate the container is ready. One pattern per line. $(search_string) $(search_string) $(search_string)
        warning_string:                       # Log line(s) that trigger a warning. One pattern per line. $(warning_string) $(warning_string) $(warning_string)
        error_string:                         # Log line(s) that trigger an immediate failure. One pattern per line. $(error_string) $(error_string) $(error_string)
        printlogs: true                       # Print container log lines to the build output while polling. $(printlogs) $(printlogs) $(printlogs)
        setup_working_folder: true            # Copy the workspace into the container after it becomes ready. $(setup_working_folder) $(setup_working_folder) $(setup_working_folder)
        usecompression: true                  # Compress the workspace before copying into the container. Faster for large workspaces. $(usecompression) $(usecompression) $(usecompression)
        exclude_git_folder: false             # Exclude the .git folder when copying the workspace into the container. $(exclude_git_folder) $(exclude_git_folder) $(exclude_git_folder)
```

