```yaml
    - task: ALOpsFobImport@1
      displayName: 'ALOps Import FOB'
      inputs:
        usedocker: False                      # Run the FOB import inside the Business Central Docker container identified by the fixed tag. Requires a running container started by ALOps Docker Start or ALOps Docker Create. $(usedocker)
        fixed_tag:                            # Fixed name tag for the Docker container. Allows the same container to be reused across multiple pipeline tasks instead of creating a new container each time. $(fixed_tag)
        nav_serverinstance: BC140             # Name of the Business Central or NAV Server instance to import the FOB into, for example BC140 or DynamicsNAV110. $(nav_serverinstance)
        filePath:                             # Path to the FOB file to import. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(filePath)
        import_action: Default                # Action to take when an object from the FOB already exists in the database. Default uses the server default. Overwrite replaces the existing object. Skip leaves the existing object unchanged. $(import_action)
        synchronize_schema_changes: Yes       # Whether to synchronize schema changes after import. Yes applies pending schema changes safely. No defers synchronization. Force applies changes immediately, including destructive ones. $(synchronize_schema_changes)
        generate_symbol_reference: False      # Generate AL symbol references for the imported NAV objects. Required when the NAV objects need to be accessible from AL extensions. $(generate_symbol_reference)
        force_full_generate_symbol_reference: False# Force symbol reference generation for all objects in the database, not only the newly imported ones. Use this after a bulk import to ensure all symbols are up to date. $(force_full_generate_symbol_reference)
        override_finsql_path:                 # Override the automatic detection of finsql.exe with a hard-coded path. Use this when the executable is not in the standard installation location. $(override_finsql_path)
```

