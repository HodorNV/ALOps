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

