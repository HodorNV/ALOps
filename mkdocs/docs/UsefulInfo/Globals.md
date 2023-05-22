# Global Variables

There are a few global variables ALOps can read during execution of all steps, that makes it a bit easier in some scenarios.  To use them, just create them globally in a variable group, or as pipeline variables to change behaviour of the pipeline accordingly.  Remark: a global variable can still be overruled by a task parameter.

## These Global Variables can be used with ALOps

* `alops_disable_urlencoding`: disables the .Net urlencoding to comply with some urls Microsoft uses for their symbol downloads.
* `alops_disable_amsi`: disables windows defender, which sometimes blocks the execution of certain steps with errors like "his script contains malicious content and has been blocked by your antivirus software".
* `alops_show_variable`: a variable mainly used in the "ALOpsShowInfo" task to show all variables that are current for your build pipeline.  Especially useful when the behaviour of a certain pipeline is not like expected, and you would like to investigate what is going on.
* `alops_LicenseId`: if you have bought a license, just set up a global variable (most convenient is to use a variable group that you use in all your pipelines) with this name, and paste your license-id as value.  All pipelines will use that license for ALOps.
* `alops_bc_license`: a global setting you could use for all your license-import steps.  This way, you don't need to set the variable for each step - it will take this as a default value.
* `alops_bc_serverinstance`: default value for all "bc_serverinstance" settings in all steps
* `alops_accept_image_eula`: accept eula for all necessary steps (mainly "Docker).
* `Alops_PrintMemoryStats`: Print Memory Stats in checkEnvironment - useful for checking why certain pipelines are slow.
* `Alops_OverrideFinSqlPath`: File path to finsql.exe for all steps that uses this.
* `Alops_UpdateHostsFile`: When set true in de pipeline it will update the hostfile to make accessing the container easier
* `Alops_PrintInputDetails`: Boolean, prints task inputs with all parameters in LIST form

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
