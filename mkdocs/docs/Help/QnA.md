# Q & A

## Do I need a license to run ALOps?
Yes and No.  It depends on the situation:
- No - if you run anything for community, which means, if you want to run pipelines on public repositories, the use of ALOps is completely free
- Yes - For any private repository, you need to pay for ALOps.  

More information on ALOps pricing, you can find [here](https://marketplace.visualstudio.com/items?itemName=Hodor.hodor-alops&ssr=false#pricing).

---

## Do I need to use Docker
No - all ALOps steps can run without Docker as well.  Though, we strongly recommend to use Docker, which will give you a much more stable build-experience.

---

## My pipeline hangs during app installation/publishing. How can I debug this?

When a pipeline hangs during the `ALOpsAppPublish` step, it's often caused by dependency issues or breaking changes during app sync. The Business Central PowerShell cmdlets may not return error messages, causing ALOps to wait indefinitely.

**Solution: Check the Event Log**

To diagnose the issue, configure the `ALOpsDockerRemove` task to save the event log:

```yaml
- task: ALOpsDockerRemove@1
  displayName: 'ALOPS - Remove Docker'
  enabled: true
  condition: always()
  inputs:
    createeventlogbackup: Always  # Options: OnFailure, Always, or Disabled
```

**Important:** The parameter value should be `Always`, `OnFailure`, or `Disabled` - NOT "enabled".

For complete documentation on the `ALOpsDockerRemove` task and all its parameters, see [ALOpsDockerRemove@1 documentation](../ALOpsSteps/Buildstepsv1.md#alops_docker_remove).

After the build completes, check your build artifacts for the event log file. The event log will contain error details that can help identify:
- Dependency issues during app installation
- Breaking schema changes that require data upgrade
- Missing prerequisites or incompatible versions
- Other installation/synchronization errors

**Related Resources:**
- See issue [#886](https://github.com/HodorNV/ALOps/issues/886) for a detailed example
- See also issue [#783](https://github.com/HodorNV/ALOps/issues/783) about timeout on sync with breaking changes

---

## Why are error logs published when publishartifact is set to false?

When using the `ALOpsAppCompiler@2` task with `alc_errorlog: true`, error log files are published as pipeline artifacts even when `publishartifact: false` is set.

**This is by design.** The `publishartifact` parameter controls only the publishing of **compiled .app files**, not error logs or other diagnostic outputs.

**Understanding the parameters:**
- `publishartifact: false` → Compiled .app files will NOT be published
- `alc_errorlog: true` → Error log files WILL be published (regardless of `publishartifact` setting)

**To prevent error logs from being published:**
- Set `alc_errorlog: false` (or omit the parameter, as `false` is the default)

**Example configuration:**
```yaml
- task: ALOpsAppCompiler@2
  displayName: 'Compile Apps'
  inputs:
    publishartifact: false    # Don't publish .app files
    alc_errorlog: false       # Don't publish error logs
```

**If you need error logs but want to control their naming/organization:**

You can generate error logs without automatic publishing and then manually copy/rename them in a subsequent step:

```yaml
- task: ALOpsAppCompiler@2
  inputs:
    alc_errorlog: true         # Generate error logs
    alc_continuebuildonerror: true
    publishartifact: false     # Don't auto-publish

# Then in a later step, manually publish with custom naming
- task: CopyFiles@2
  condition: failed()
  inputs:
    SourceFolder: '$(Build.ArtifactStagingDirectory)'
    Contents: '*_ALCErrorLog.txt'
    TargetFolder: '$(Build.ArtifactStagingDirectory)/ErrorLogs'
```

**Related:** See issue [#875](https://github.com/HodorNV/ALOps/issues/875) for the original discussion.

