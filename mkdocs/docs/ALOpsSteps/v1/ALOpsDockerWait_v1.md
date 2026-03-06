```yaml
    - task: ALOpsDockerWait@1
      displayName: 'ALOps Docker Wait'
      inputs:
        fixed_tag:                            # Fixed name tag of the Docker container to monitor. Must match the fixed_tag used when starting the container. $(fixed_tag)
        search_string: Ready for connections! # String to search for in the container log output. The task waits until this string appears, indicating that BC is ready. The default Ready for connections! is emitted by the BC server when startup completes. $(search_string)
        warning_string:                       # String to watch for in the container log. When found, the task logs a pipeline warning but continues. Useful for surfacing non-fatal startup issues. $(warning_string)
        error_string:                         # String to watch for in the container log. When found, the task fails immediately with an error. Use this to catch critical startup failures early. $(error_string)
        setup_working_folder: True            # Copy the local agent working folder into the container after BC is ready. Required when subsequent tasks inside the container need access to source files or artifacts. $(setup_working_folder)
        usecompression: True                  # Compress the working folder into a zip archive before transferring it into the container. Reduces transfer time for large source trees. $(usecompression)
        printlogs: True                       # Print all container log output to the pipeline log after the wait condition is met. Useful for auditing the BC startup sequence. $(printlogs)
        exclude_git_folder: False             # Exclude the .git folder when copying the working folder into the container. Reduces transfer size and avoids exposing repository metadata inside the container. $(exclude_git_folder)
```

