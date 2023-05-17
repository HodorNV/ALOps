```yaml
    - task: ALOpsFobImport@1
      displayName: 'ALOps Import FOB'
      inputs:
        usedocker: False                      # Run task in Docker container. $(usedocker)
        fixed_tag:                            # Allows recycling of docker containers. $(fixed_tag)
        nav_serverinstance: BC140             # Business Central Server Instance Name. $(nav_serverinstance)
        filePath:                             # Path of the FOB to import. Must be a fully qualified path or relative to $(System.DefaultWorkingDirectory). $(filePath)
        import_action: Default                # Import action for importing FOB files. $(import_action)
        synchronize_schema_changes: Yes       # Synchronize Schema Changes setting for importing FOB files. $(synchronize_schema_changes)
        generate_symbol_reference: False      # Enable Generate Symbol References. $(generate_symbol_reference)
        force_full_generate_symbol_reference: False# Generate Symbol Reference for All Objects. $(force_full_generate_symbol_reference)
        override_finsql_path:                 # Overrule automatic detection of FinSql with fixed value. $(override_finsql_path)
```

