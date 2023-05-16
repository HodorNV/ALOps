    ```yaml
        - task: ALOpsDockerCreate@1
          displayName: 'ALOps Docker Create'
          inputs:
            artifactspecification: Specific       # Set Artifact resolve method. $(artifactspecification)
            artifactversion:                      # BC/NAV Version, eg: 9, 10.4, NAV2016, 16.4.24524. $(artifactversion)
            artifacttype: OnPrem                  # Set Artifact Type. $(artifacttype)
            artifactcountry:                      # The Country for the Artifact. $(artifactcountry)
            versionselect: Latest                 # The version to be selected from the Artifacts. $(versionselect)
            artifacthint:                         # . $(artifacthint)
            multitenant: False                    # Create a Multi-Tenant image. $(multitenant)
            memory: 8G                            # Set maximum memory for Container. $(memory)
            imageprefix: myImage                  # New image name, tag defined by $(imagenametemplate). $(imageprefix)
            dockerregistry:                       # Docker registry Pull/Push, example: 'bcinsider.azurecr.io', or 'repo.mydomain.com' $(dockerregistry)
            dockerusername:                       # Docker login username. $(dockerusername)
            dockerpassword:                       # Docker login password. $(dockerpassword)
            storageaccount:                       # Non Default Storage Account. $(storageaccount)
            sastoken:                             # SAS Token used to access Storage Account. $(sastoken)
            forcecreateimage: False               # Forces image creation, skipping Pull image. $(forcecreateimage)
            myscripts:                            # Specify myScripts to be added to the image. $(myscripts)
            imagenametemplate: %IMAGE_PREFIX%:%ARTIFACT_TYPE%-%ARTIFACT_VERSION%-%ARTIFACT_COUNTRY%-%OS_VERSION%-%OS_LTSC%# Template for defining Image names or using a fixed name $(imagenametemplate)
            licensefile:                          # BC License File to be included in the Image $(licensefile)
            includetesttoolkit: False             # Included the TestToolkit in created image. $(includetesttoolkit)
            includetestlibrariesonly: False       # Included only the Test-Libraries in created image. $(includetestlibrariesonly)
            includetestframeworkonly: False       # Included only the Test-Framework in created image. $(includetestframeworkonly)
            includeperformancetoolkit: False      # Include Performance-Toolkit in created image. $(includeperformancetoolkit)
    ```

