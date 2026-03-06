```yaml
    - task: ALOpsInfo@1
      displayName: 'ALOps Info'
      inputs:
        scanforsymbolonlyapps: Disabled       # Scan build artifacts for symbols-only .app packages. Disabled skips the check. Warn reports a pipeline warning when symbols-only apps are found. Error fails the task, preventing accidental deployment of symbols-only placeholders. $(scanforsymbolonlyapps)
        pwsh: False                           # Run the task using PowerShell Core (pwsh) instead of Windows PowerShell. Required on Linux-hosted build agents. $(pwsh)
```

