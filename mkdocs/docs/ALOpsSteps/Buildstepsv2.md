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

#### updateruntime
It could come in handy to control "runtime" from the pipeline.  You can do that with the "updateruntime" parameter, which will set the runtime in the app.json file.
Examples:
- `11.0`, `12.0` - will set it to a fixed runtime
- `Highest` - will set it to the highest runtime available - depending on the used VSIX!

#### publishartifact and alc_errorlog
The `publishartifact` parameter controls whether **compiled .app files** are published as pipeline artifacts. It does **NOT** control the publishing of error logs.

When `alc_errorlog: true` is set, error log files will **always** be published as artifacts, regardless of the `publishartifact` setting. This is by design to ensure error logs are available for debugging even when app files are not published.

**Example:**
```yaml
- task: ALOpsAppCompiler@2
  inputs:
    publishartifact: false    # .app files will NOT be published
    alc_errorlog: true        # Error logs WILL be published
```

**To prevent error logs from being published:**
- Set `alc_errorlog: false` (or omit it, as the default is `false`)

**Related:** See issue [#875](https://github.com/HodorNV/ALOps/issues/875) for discussion about this behavior.

### Examples

- [Default](https://github.com/HodorNV/ALOps/blob/master/Examples/Compiler%20V2/01_Default.yml)
- [NextMajor](https://github.com/HodorNV/ALOps/blob/master/Examples/Compiler%20V2/02_NextMajor.yml)
- [NextMinor](https://github.com/HodorNV/ALOps/blob/master/Examples/Compiler%20V2/02_NextMinor.yml)
- [Working with CodeCops](https://github.com/HodorNV/ALOps/blob/master/Examples/Compiler%20V2/03_CodeCops.yml)
- [Fail On Warnings](https://github.com/HodorNV/ALOps/blob/master/Examples/Compiler%20V2/04_FailonWarnings.yml)
- [Custom Visx](https://github.com/HodorNV/ALOps/blob/master/Examples/Compiler%20V2/07_CustomVisx.yml) - "latest" is also possible!
- [Custom CodeCops](https://github.com/HodorNV/ALOps/blob/master/Examples/Compiler%20V2/09_CustomCodeCops.yml)
- [Combine with App Signing](https://github.com/HodorNV/ALOps/blob/master/Examples/Compiler%20V2/06_AppSigning.yml)
