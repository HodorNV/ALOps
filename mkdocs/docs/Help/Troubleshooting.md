# Troubleshooting
Let's list some common problems and their solutions:

## Unit tests seem to fail for some odd reason
If you run unit tests - you might encounter weird problems, like:

<img src="..\img\Troubleshooting1.png">

In many cases, the issues are caused because of not enough memory for the docker container that is used to run the tests.  Just assign more memory when you start the Docker container, like in this example:
```yaml
- task: ALOpsDockerStart@1
  inputs:
    docker_image: $(dockerimage)
    docker_pull: true
    memory_gb: 8
```

---

## Failed publishing test results to DevOps 
Publishing the test results is a default DevOps step, but for publishing AL Test Results (XUnit), it is important to use at least version 2 of the step (indicated in yml with "@2" at the name of the step).  Like:
```yaml
- task: PublishTestResults@2
  displayName: 'Publish Test Results **/TestResults.xml'
  inputs:
    testResultsFormat: XUnit
    testResultsFiles: '**/TestResults.xml'
    testRunTitle: 'BC Test Results: $(Build.BuildId)'
```

---

## I have unclear problems with compiling my app or imorting a fob
There are a lot of problems caused by a Windows update (Feb 2020) that makes Docker fail to run 32-bit application like finsql.exe or alc.exe.  Familiar errors are:
- `AL Compiler Exit Code: -1073741502`
- `Exception calling "GetResponse" with "0" argument(s)`
- `##[error]!`

Most of these problems are solved by setting up the containers with Hyper-V isolation:
```yaml
- task: ALOpsDockerStart@1
  inputs:
    docker_image: 'mcr.microsoft.com/businesscentral/onprem:de'
    docker_pull: true
    memory_gb: '8'
    docker_parameters: '--isolation=hyperv'
```
It's important to understand that this problem is caused by the combination of the Docker image and the state of Windows Server of your build agent.
