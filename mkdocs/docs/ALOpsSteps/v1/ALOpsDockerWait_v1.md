    ```yaml
        - task: ALOpsDockerWait@1
          displayName: 'ALOps Docker Wait'
          inputs:
            fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
            search_string: Ready for connections! # String to match in Docker Logs and return. $(search_string)
            warning_string:                       # Show as Warning when the container logs contain the warning string. $(warning_string)
            error_string:                         # Throw error when the container logs contain the error string. $(error_string)
            setup_working_folder: True            # Copy working folder to Docker container. $(setup_working_folder)
            usecompression: True                  # Compress Source-Folder for transfer to docker container. $(usecompression)
            printlogs: True                       # Print all container logs. $(printlogs)
    ```

