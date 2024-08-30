# Global Variables

There are a few global variables ALOps can read during execution of all steps, that makes it a bit easier in some scenarios.  To use them, just create them globally in a variable group, or as pipeline variables to change behaviour of the pipeline accordingly.  Remark: a global variable can still be overruled by a task parameter.

## These Global Variables can be used with ALOps

* `alops_disable_urlencoding`: disables the .Net urlencoding to comply with some urls Microsoft uses for their symbol downloads.
* `alops_show_variable`: a variable mainly used in the "alopsShowInfo" task to show all variables that are current for your build pipeline.  Especially useful when the behaviour of a certain pipeline is not like expected, and you would like to investigate what is going on.
* `alops_LicenseId`: if you have bought a license, just set up a global variable (most convenient is to use a variable group that you use in all your pipelines) with this name, and paste your license-id as value.  All pipelines will use that license for alops.
* `alops_bc_license`: a global setting you could use for all your license-import steps.  This way, you don't need to set the variable for each step - it will take this as a default value.
* `alops_bc_serverinstance`: default value for all "bc_serverinstance" settings in all steps
* `alops_accept_image_eula`: accept eula for all necessary steps (mainly "Docker).
* `alops_PrintMemoryStats`: Print Memory Stats in checkEnvironment - useful for checking why certain pipelines are slow.
* `alops_OverrideFinSqlPath`: File path to finsql.exe for all steps that uses this.
* `alops_UpdateHostsFile`: When set true in de pipeline it will update the hostfile to make accessing the container easier
* `alops_PrintInputDetails`: Boolean, prints task inputs with all parameters in LIST form (default "true")
* `alops_disable_buildtags`: Disable all tags that are added by ALOps
* `alops_DisableParallelCompile`: Disable parallel compile as default setting
* `alops_webrequest_timeout_ms`: Default timeout is 30 seconds, but you can override it with this variable.
* `alops_interactiontimeout_minutes`: For when running testsuites, you can override the default with this variable.
* `alops_overrule_bcartifactversion`: Overrule of BC-Artifacts used for common tasks. Format `type:version:country`. Exmaple `onprem:14:w1`

## Overrides for anything OAuth (Any Step)
You can use below globals as a default for any OAuth settings in any step.  
This allows you to (for example) use KeyVault values for these settings, and/or simply set it up once in a variable group.
* `alops_tenant_id`
* `alops_application_id`
* `alops_application_certificate`
* `alops_application_certificate_password`

## During the pipeline run, there are a few global variables will fill for your convenience:
With the step "ALOpsInfo" you can get to all variables that are available.  These are some ALOps-specific variables we created during the run:
* `ALOPS_DOCKER_ADMINPASSWORD`
* `ALOPS_DOCKER_ADMINUSER`
* `ALOPS_DOCKER_CERTIFICATE`
* `ALOPS_DOCKER_CONTAINER_ID`
* `ALOPS_DOCKER_DNSNAME`
* `ALOPS_DOCKER_HOSTNAME`
* `ALOPS_DOCKER_IPADDRESS`
* `ALOPS_DOCKER_NAVSERVERINSTANCE`
* `ALOPS_DOCKER_VSIX`
* `ALOPS_DOCKER_WEBCLIENT`
* ... and more