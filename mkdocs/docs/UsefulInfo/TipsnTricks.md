# Tips and Tricks regarding DevOps and ALOps

## ALOps Global Variables

With ALOps Global Variables, the behavior of the pipeline can be changed.  These variables can be set in a variable group, or as pipeline variables.  You can vind an overview of the available global variables [here](./Globals.md).

## Compiler Versions

You can work with different compiler versions.  By default, ALOps will use the compiler of the BC Artifacts you use to get the symbols from.  But VSCode will always use the latest, or the prerelease.  You can do that too, with the `alternativevsixurl` parameter in the Compiler Step.  More information [here](../ALOpsSteps/Buildstepsv2.md#alternativevsixurl)

## Compiler V1 or V2

V1 is our first compiler, which needs Docker to be able to run.  It was basically based on how BCCH worked.  
V2 is a complete rewrite, and doesn't need Docker anymore.  It's faster, and more flexible.  

You can find more information [here](../ALOpsSteps/Buildstepsv2.md)

Our recommendation is to abandon the V1 compiler, and use the V2 compiler early in the pipeline.  This way, you can benefit from the speed and flexibility of the V2 compiler, and the pipeline will fail fast (if compile fails), which means you'll only set up a container when you really need it.

