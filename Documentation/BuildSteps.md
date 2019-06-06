# Build Steps Overview
Let's describe all the Build Steps that we have at our disposal

## List and describe all build steps
Here is a list of all build steps you have at your disposal when you use ALOps

### AL 
- APP Compiler
  * Compile AL Source to .APP file
  * Example in yaml: 
    ```yaml
    - task: ALOpsAppCompiler@1
      displayName: 'Compile Extension'
      inputs:
        usedocker: true
        nav_app_version: $(AppVersion)
        failed_on_warnings: true 
    ```

- APP Sign
  * Sign AL-App with PFX

- App Sign Verify
  * Verify the Sign-State of an App
  * Validate publisher
  * Validate Timestamp

- APP Publish
  * Publish and Install AL-App on environment
  * Example in yaml: 
    ```yaml
    - task: ALOpsAppPublish@1
      displayName: 'Publish AL-App'
      inputs:
        usedocker: true
        nav_artifact_app_filter: '*.app'   
        skip_verification: true  
    ```

- APP TestSuite
  * Run TestSuite 
  * Example in yaml: 
    ```yaml
    - task: ALOpsAppTest@1
      displayName: 'Run TestSuite'
      inputs:
        usedocker: true
        import_action: "Skip"
        testfilter: $(TestFilter)
        show_available_tests: true
      continueOnError: true    
    ```


- APP Cleaner
  * Remove AL-Apps from environment

- APP Copy
  * Copy AL-Apps between environments  

### Business Central
- Package Import 
  * Import Configuration Packages (RapidStart)

- Import License
  * Import Business Central License

### Docker Commands
- Docker Start
  * Start a BC docker container
  * Example in yaml: 
    ```yaml
    - task: ALOpsDockerStart@1
      inputs:
        docker_image: mcr.microsoft.com/businesscentral/sandbox
        docker_pull: true   
    ```

- Docker Wait
  * Wait for BC docker container startup
  * Example in yaml: 
    ```yaml
    - task: ALOpsDockerWait@1
      inputs:
        search_string: 'Ready for connections!'  
    ```

- Docker Remove
  * Cleanup BC docker container
  * Example in yaml: 
    ```yaml
    - task: ALOpsDockerRemove@1
      displayName: 'Remove Docker Container'
      enabled: true
      condition: always()
      inputs:
        docker_login: 'Insider Docker Registry'
    ```


### DevEnv Objects
- Object Import
  * Import .fob files
  * Import .txt files
  * Example in yaml: 
    ```yaml
    - task: ALOpsFobImport@1
      displayName: 'ALOPS Import FOB'
      inputs:
        usedocker: true
        fixed_tag: $(dockerContainerTag)
        filePath: '.fob/NoTable.fob'
        import_action: 'Overwrite'
        synchronize_schema_changes: 'Yes'
        generate_symbol_reference: true
    ```

- Object Export
  * Export .fob files
  * Export .txt files

- Compile 
  * Compile a range of C/AL Objects