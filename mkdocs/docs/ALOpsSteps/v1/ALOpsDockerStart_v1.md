```yaml
    - task: ALOpsDockerStart@1
      displayName: 'ALOps Docker Start'
      inputs:
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
        ignore_no_container_warning: False    # Do not trigger warning when container with [fixed_tag] is not found. $(ignore_no_container_warning)
        docker_image: $(ALOPS_BC_IMAGE)       # Business Central docker Image to Start. $(docker_image)
        accept_image_eula: True               # Accept Eula of docker image. $(accept_image_eula)
        accept_image_outdated: True           # Accept Outdated image. $(accept_image_outdated)
        enable_symbol_loading: False          # Enable Symbol Loading. $(enable_symbol_loading)
        enable_api_services: False            # Enable API Services. $(enable_api_services)
        multitenant: False                    # Create a Multi-Tenant container. $(multitenant)
        docker_pull: True                     # Force Pull docker image. $(docker_pull)
        dockerauthentication: None            # Set authentication Method to use. $(dockerauthentication)
        docker_login:                         # Select the generic login to use for docker. If needed, click on 'manage', and add a new Service Endpoint of type 'Generic' $(docker_login)
        docker_username:                      # Docker login username. $(docker_username)
        docker_password:                      # Docker login password. $(docker_password)
        docker_registry:                      # Docker registry for login, example: 'bcinsider.azurecr.io' $(docker_registry)
        memory_gb: -1                         # Set maximum memory for container in GB. $(memory_gb)
        container_restart: no                 # Set docker container restart preference. $(container_restart)
        licensefile:                          # Set the BC License File. Path or Url. $(licensefile)
        docker_parameters:                    # Specify additional docker parameters. $(docker_parameters)
        sql_server:                           # External SQL Server. $(sql_server)
        sql_server_instance:                  # External SQL Server Instance. $(sql_server_instance)
        sql_database:                         # External SQL Database. $(sql_database)
        sql_database_user:                    # External SQL Database User. $(sql_database_user)
        sql_database_user_password:           # External SQL Database Password. $(sql_database_user_password)
        sql_backup_file:                      # Restore BAK file on startup. $(sql_backup_file)
        encryption_key:                       # Encryption key for Service Tier. $(encryption_key)
        taskscheduler: Keep                   # Overrule EnableTaskScheduler by setting other option than 'Keep'. $(taskscheduler)
```

