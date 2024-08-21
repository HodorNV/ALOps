# Build Steps Overview

ALOps provides a set of building blocks that enables you to create your own build and deployment pipelines. The building blocks are called **Build Steps** and are defined in YAML files.  Let's take a look at the build steps that are available in ALOps.

Related:
[Build steps v1](Buildstepsv1.md)

## ALOps App Compiler
Compile Business Central extension(s) from AL code.

Full Yaml Description: 

!INCLUDE "ALOpsAppCompiler_v2.md"
### Parameters
#### alternativevsixurl
By default, it will take the compiler from the BC artifacts.  If you want to use a different version, you can specify the URL here. Some keywords are also possible, like:

- `latest` - will always take the latest version
- `prerelease` - will take the latest prerelease version

#### nav_app_version
Same as described in [v1](Buildstepsv1.md#nav_app_version)

#### applicationinsightskey
Depending on the BC Version, ALOps will either set the "ApplicationInsightsKey" or the "ApplicationInsightsConnectionString".  So to keep it simple, you can use this parameter for both cases.


### Examples

- [Default](https://github.com/HodorNV/ALOps/blob/master/Examples/Compiler%20V2/01_Default.yml)
- [NextMajor](https://github.com/HodorNV/ALOps/blob/master/Examples/Compiler%20V2/02_NextMajor.yml)
- [NextMinor](https://github.com/HodorNV/ALOps/blob/master/Examples/Compiler%20V2/02_NextMinor.yml)
- [Working with CodeCops](https://github.com/HodorNV/ALOps/blob/master/Examples/Compiler%20V2/03_CodeCops.yml)
- [Fail On Warnings](https://github.com/HodorNV/ALOps/blob/master/Examples/Compiler%20V2/04_FailonWarnings.yml)
- [Custom Visx](https://github.com/HodorNV/ALOps/blob/master/Examples/Compiler%20V2/07_CustomVisx.yml) - "latest" is also possible!
- [Custom CodeCops](https://github.com/HodorNV/ALOps/blob/master/Examples/Compiler%20V2/09_CustomCodeCops.yml)
- [Combine with App Signing](https://github.com/HodorNV/ALOps/blob/master/Examples/Compiler%20V2/06_AppSigning.yml)
