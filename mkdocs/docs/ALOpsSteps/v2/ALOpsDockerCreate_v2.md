```yaml
    - task: ALOpsDockerCreate@2
      displayName: 'ALOps Docker Create'
      inputs:
        artifactspecification: Specific       # Set Artifact resolve method. $(artifactspecification) $(artifactspecification)
        artifactversion:                      # BC/NAV Version, eg: 9, 10.4, NAV2016, 16.4.24524. $(artifactversion) $(artifactversion)
        artifacttype: OnPrem                  # Set Artifact Type. $(artifacttype) $(artifacttype)
        artifactcountry:                      # The Country for the Artifact. $(artifactcountry) $(artifactcountry)
        versionselect: Latest                 # The version to be selected from the Artifacts. $(versionselect) $(versionselect)
        artifacthint:                         # . $(artifacthint) $(artifacthint)
        multitenant: False                    # Create a Multi-Tenant image. $(multitenant) $(multitenant)
        memory: 8G                            # Set maximum memory for Container. $(memory) $(memory)
        imageprefix: myImage                  # New image name, tag defined by $(imagenametemplate). $(imageprefix) $(imageprefix)
        dockerregistry:                       # Docker registry Pull/Push, example: 'bcinsider.azurecr.io', or 'repo.mydomain.com' $(dockerregistry) $(dockerregistry)
        dockerusername:                       # Docker login username. $(dockerusername) $(dockerusername)
        dockerpassword:                       # Docker login password. $(dockerpassword) $(dockerpassword)
        storageaccount:                       # Non Default Storage Account. $(storageaccount) $(storageaccount)
        sastoken:                             # SAS Token used to access Storage Account. $(sastoken) $(sastoken)
        forcecreateimage: False               # Forces image creation, skipping Pull image. $(forcecreateimage) $(forcecreateimage)
        myscripts:                            # Specify myScripts to be added to the image. $(myscripts) $(myscripts)
        imagenametemplate: %IMAGE_PREFIX%:%ARTIFACT_TYPE%-%ARTIFACT_VERSION%-%ARTIFACT_COUNTRY%-%OS_VERSION%-%OS_LTSC%# Template for defining Image names or using a fixed name $(imagenametemplate) $(imagenametemplate)
        use_generic_image:                    # The base image to use for Image creation. $(use_generic_image) $(use_generic_image)
        licensefile:                          # BC License File to be included in the Image $(licensefile) $(licensefile)
        includetesttoolkit: False             # Included the TestToolkit in created image. $(includetesttoolkit) $(includetesttoolkit)
        includetestlibrariesonly: False       # Included only the Test-Libraries in created image. $(includetestlibrariesonly) $(includetestlibrariesonly)
        includetestframeworkonly: False       # Included only the Test-Framework in created image. $(includetestframeworkonly) $(includetestframeworkonly)
        includeperformancetoolkit: False      # Include Performance-Toolkit in created image. $(includeperformancetoolkit) $(includeperformancetoolkit)
        accept_insider_eula: False            # Accept Insider EULA. $(accept_insider_eula) $(accept_insider_eula)
        alternativeartifacturl:               # Overrule the ArtifactUrl which would be determined by [artifacttype/artifactcountry/versionselect]. $(alternativeartifacturl) $(alternativeartifacturl)
```

