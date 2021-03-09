    # Build Steps Overview
    Let's describe all the Build Steps that we have at our disposal

    ## List and describe all build steps
    Here is a list of all build steps you have at your disposal when you use ALOps

        ### ALOps Tasks
    - ALOps Agent Maintenance
  * Cleanup and maintain DevOps a Agent for Business Central.
  * YAML Template: 
    ```yaml
            - task: ALOpsAgentMaintenance@3
            displayName: 'ALOps Agent Maintenance'
          inputs:
            prunedockercontainers: False          # Remove unused container from Agent. $(prunedockercontainers) $(prunedockercontainers) $(prunedockercontainers)
            prunedockerimages: False              # Remove unused images from Agent. $(prunedockerimages) $(prunedockerimages) $(prunedockerimages)
            removeoldtasks: False                 # Remove old ALOps tasks. $(removeoldtasks) $(removeoldtasks) $(removeoldtasks)
    ```
- ALOps Docker Create
  * Validate App from Business Central AppSource.
  * YAML Template: 
    ```yaml
            - task: ALOpsAppValidation@3
            displayName: 'ALOps Docker Create'
          inputs:
            artifactpath: $(System.ArtifactsDirectory)# Path for App Artifact. $(artifactpath) $(artifactpath) $(artifactpath)
            artifactfilter: *.app                 # Filter used for locating App file relative to $(path_to_publish). $(artifactfilter) $(artifactfilter) $(artifactfilter)
            containername: bcserver               # Only required when running multiple DevOps Agents on the same server. (Not recommended) $(containername) $(containername) $(containername)
            imagename:                            # If imageName is specified it will be used to build an image. $(imagename) $(imagename) $(imagename)
            licensefile:                          # Path of the FLF license to import. $(licensefile) $(licensefile) $(licensefile)
            memorylimit: 8G                       # Set maximum memory for Container. $(memorylimit) $(memorylimit) $(memorylimit)
            validateversion:                      # Full or partial version number. If specified, apps will also be validated against this version. $(validateversion) $(validateversion) $(validateversion)
            sastoken:                             # SAS Token used to access Storage Account. $(sastoken) $(sastoken) $(sastoken)
            validatecurrent: False                # Validate against current version of Business Central. $(validatecurrent) $(validatecurrent) $(validatecurrent)
            validatenextminor: False              # Validate against Next Minor version of Business Central. $(validatenextminor) $(validatenextminor) $(validatenextminor)
            validatenextmajor: False              # Validate against Next Major version of Business Central. $(validatenextmajor) $(validatenextmajor) $(validatenextmajor)
            failonerror: True                     # Include this switch if you want to fail on the first error instead of returning all errors to the caller. $(failonerror) $(failonerror) $(failonerror)
            includewarnings: False                # Include this switch if you want to include Warnings. $(includewarnings) $(includewarnings) $(includewarnings)
            countries: W1                         # Comma seperated array of countries to validate. $(countries) $(countries) $(countries)
            affixes:                              # Comma seperated array of affixes. $(affixes) $(affixes) $(affixes)
            supportedcountries:                   # Comma seperated array of countries to support. $(supportedcountries) $(supportedcountries) $(supportedcountries)
            vsixfile:                             #  Specify a URL or path to a .vsix file in order to override the .vsix file in the image with this. $(vsixfile) $(vsixfile) $(vsixfile)
            skipverification: False               # Include this parameter to skip verification of code signing certificate. $(skipverification) $(skipverification) $(skipverification)
            skipupgrade: False                    # Include this parameter to skip upgrade. $(skipupgrade) $(skipupgrade) $(skipupgrade)
            skipappsourcecop: False               # Include this parameter to skip appSourceCop. $(skipappsourcecop) $(skipappsourcecop) $(skipappsourcecop)
            skipconnectiontest: False             # Include this parameter to skip the connection test. $(skipconnectiontest) $(skipconnectiontest) $(skipconnectiontest)
            multitenant: False                    # Create a Multi-Tenant image. $(multitenant) $(multitenant) $(multitenant)
    ```
- ALOps Docker Create
  * Create Docker image based on NAV/BC Artifacts.
  * YAML Template: 
    ```yaml
            - task: ALOpsDockerCreate@3
            displayName: 'ALOps Docker Create'
          inputs:
            artifactversion:                      # BC/NAV Version, eg: 9, 10.4, NAV2016, 16.4.24524. $(artifactversion) $(artifactversion) $(artifactversion)
            artifacttype: OnPrem                  # Set Artifact Type. $(artifacttype) $(artifacttype) $(artifacttype)
            artifactcountry:                      # The Country for the Artifact. $(artifactcountry) $(artifactcountry) $(artifactcountry)
            versionselect: Latest                 # The version to be selected from the Artifacts. $(versionselect) $(versionselect) $(versionselect)
            imagenametemplate: %IMAGE_PREFIX%:%ARTIFACT_TYPE%-%ARTIFACT_VERSION%-%ARTIFACT_COUNTRY%-%OS_VERSION%-%OS_LTSC%# Template for defining Image names or using a fixed name $(imagenametemplate) $(imagenametemplate) $(imagenametemplate)
            imageprefix: myImage                  # New image name, tag defined by $(imagenametemplate). $(imageprefix) $(imageprefix) $(imageprefix)
            forcecreateimage: False               # Forces image creation, skipping Pull image. $(forcecreateimage) $(forcecreateimage) $(forcecreateimage)
            multitenant: False                    # Create a Multi-Tenant image. $(multitenant) $(multitenant) $(multitenant)
            memory: 8G                            # Set maximum memory for Container. $(memory) $(memory) $(memory)
            licensefile:                          # BC License File to be included in the Image. $(licensefile) $(licensefile) $(licensefile)
            skipdatabase: False                   # Adding this parameter creates an image without a database. $(skipdatabase) $(skipdatabase) $(skipdatabase)
            includetesttoolkit: False             # Included the TestToolkit in created image. $(includetesttoolkit) $(includetesttoolkit) $(includetesttoolkit)
            includetestlibrariesonly: False       # Included only the Test-Libraries in created image. $(includetestlibrariesonly) $(includetestlibrariesonly) $(includetestlibrariesonly)
            includetestframeworkonly: False       # Included only the Test-Framework in created image. $(includetestframeworkonly) $(includetestframeworkonly) $(includetestframeworkonly)
            includeperformancetoolkit: False      # Include Performance-Toolkit in created image. $(includeperformancetoolkit) $(includeperformancetoolkit) $(includeperformancetoolkit)
            storageaccount:                       # Non Default Storage Account. $(storageaccount) $(storageaccount) $(storageaccount)
            sastoken:                             # SAS Token used to access Storage Account. $(sastoken) $(sastoken) $(sastoken)
    ```
- ALOps Docker Execute
  * Execute powershell script in container.
  * YAML Template: 
    ```yaml
            - task: ALOpsDockerExec@3
            displayName: 'ALOps Docker Execute'
          inputs:
            inlinescript: # Write your powershell commands here.
    Write-Host "Hello World"
    # Inline Powershell Script. $(inlinescript) $(inlinescript) $(inlinescript)
    ```
- ALOps Docker Remove
  * Remove Business Central docker container.
  * YAML Template: 
    ```yaml
            - task: ALOpsDockerRemove@3
            displayName: 'ALOps Docker Remove'
    ```
- ALOps Docker Start
  * Start Business Central docker container.
  * YAML Template: 
    ```yaml
            - task: ALOpsDockerStart@3
            displayName: 'ALOps Docker Start'
          inputs:
            dockerimage: $(ALOPS_BC_IMAGE)        # Docker Image to Start. $(dockerimage) $(dockerimage) $(dockerimage)
            memorygb: 0                           # Set maximum memory for container in GB. $(memorygb) $(memorygb) $(memorygb)
            acceptimageeula: False                # Accept EULA of docker image. $(acceptimageeula) $(acceptimageeula) $(acceptimageeula)
            acceptimageoutdated: False            # Accept Outdated image. $(acceptimageoutdated) $(acceptimageoutdated) $(acceptimageoutdated)
            waitforcontainer: True                # Wait for Container startup. $(waitforcontainer) $(waitforcontainer) $(waitforcontainer)
    ```
- ALOps Docker Wait
  * Wait until the Business Central container is started.
  * YAML Template: 
    ```yaml
            - task: ALOpsDockerWait@3
            displayName: 'ALOps Docker Wait'
          inputs:
            printlogs: True                       # Print all container logs. $(printlogs) $(printlogs) $(printlogs)
    ```
- ALOps Info
  * Print information about ALOps and executing host.
  * YAML Template: 
    ```yaml
            - task: ALOpsInfo@3
            displayName: 'ALOps Info'
          inputs:
            showyaml: False                       # Print the YAML of the current pipeline. $(showyaml) $(showyaml) $(showyaml)
            showenvironmentvariables: False       # Print Environment Variables. $(showenvironmentvariables) $(showenvironmentvariables) $(showenvironmentvariables)
            showtaskinputs: False                 # Print Task Inputs. $(showtaskinputs) $(showtaskinputs) $(showtaskinputs)
            showdockercontainers: False           # Print Docker Containers. $(showdockercontainers) $(showdockercontainers) $(showdockercontainers)
            showdockerimages: False               # Print Docker Images. $(showdockerimages) $(showdockerimages) $(showdockerimages)
    ```

