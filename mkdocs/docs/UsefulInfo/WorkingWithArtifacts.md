# How to work with Artifacts
This page explains a bit more on how to work with Artifacts.

We support creating Docker images from  NAV v9.0 to BC v17.0 (and upcoming) with the new task `ALOpsDockerCreate`.
The task includes:
- Creating BC Docker images on the local repository
- Creating Docker Images for NAV: 2016 (v9), 2017 (v10), 2018 (v11)
- Creating Docker Images for BC: v13, v14, v15, v16
- Creating Docker Images for BC-Insider: v17  (SASToken / StorageAccount)
- Pull/Push images with public/private registry.
- Supports a "Hint", where the old name of docker images can be supplied, we'll try and figure out the correct new parameters
- The new task should be inserted in the pipeline above "ALOpsDockerStart"

## BcContainerHelper
We will need BcContainerHelper to build the images.  ALOps will install and maintain it, you don't have to do anything - although, you can, of course.  If you see anything fails in ALOps regarding the installation of BcContainerHelper, these scripts can help you to cleanly install it (with thanks to Kasper):
- to uninstall all instances of NavContainerHelper
```powershell
$ModuleName = 'navcontainerhelper';
$Latest = Get-InstalledModule $ModuleName; 
Get-InstalledModule $ModuleName -AllVersions | 
    ? {$_.Version -ne $Latest.Version} | 
        Uninstall-Module -WhatIf
```
- to install BcContainerHelper manually:
```powershell
Install-Module BcContainerHelper -AllowClobber -force
```


## Some Examples:

Most basic Image creation based possible, only based on the old container naming.
```yaml
- task: ALOpsDockerCreate@1
  inputs:
    artifacthint: 'mcr.microsoft.com/businesscentral/onprem:16.2.13509.13779-be-ltsc2019'
```

The proper, new way of defining the version/type/country you want can be done very easy:
```yaml
- task: ALOpsDockerCreate@1
  inputs:
    artifactversion: '16.2'
    artifactcountry: 'be'
    artifacttype: OnPrem
```

Also not all parameters are required, if for example "Version" is not specified, we automatically take the latest.
Example below will (today) resolve to "onprem-16.4.14693.15445-be"
```yaml
- task: ALOpsDockerCreate@1
  inputs:
    artifactcountry: 'be'
```

For BC-Insider you just have to specify the [sastoken] parameter, if [StorageAccount] is blank we assume "bcinsider".
Do of course make sure to set the type to "Sandbox" as there are no OnPrem builds in insider.
```yaml
- task: ALOpsDockerCreate@1
  inputs:
    artifactcountry: 'be'
    artifacttype: Sandbox
    sastoken: $(bcinsider_sas_token)
```

To work with docker registries, specify the [dockerregistry] parameter, if its secured additionally specify [dockerusername] and [dockerpassword]. Tested on Docker registries [onprem/hosted] and Microsoft Container Registry (Azure)
```yaml
- task: ALOpsDockerCreate@1
  inputs:
    artifactversion: '16.2'
    artifactcountry: 'be'
    artifacttype: OnPrem
    dockerregistry: 'alops.azurecr.io'
    dockerusername: $(dtr_username)
    dockerpassword: $(dtr_password)
```

When using the new "ALOpsDockerCreate" in a pipeline, you have to clear the [docker_image] parameter on ALOpsDockerStart.
ALOpsDockerStart with automatically pickup the image-name from the the ALOpsDockerCreate task.
```yaml
- task: ALOpsDockerStart@1
  inputs:
    docker_pull: false
    memory_gb: 8
    docker_parameters: '--isolation=hyperv'
```


## Migrating your old build pipeline
To update your pipeline, it should just be a matter of adding the new task.

The easiest is to reuse the exact image you were using, like in:
```yaml
- task: ALOpsDockerCreate@1
  inputs:
    artifacthint: 'mcr.microsoft.com/businesscentral/onprem:16.2.13509.13779-be-ltsc2019'
```

But better would be to specify the exact parameters you need to find the Artifact:
```yaml
- task: ALOpsDockerCreate@1
  inputs:
    artifactversion: '16.2'
    artifactcountry: 'be'
    artifacttype: OnPrem
```

If you have any issues or suggestions, please put them [on GitHub](https://github.com/HodorNV/ALOps/issues)
