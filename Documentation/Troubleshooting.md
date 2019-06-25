# Troubleshooting
Let's list some common problems and their solutions:

All troubleshooting items:
- [Unit tests seem to fail for some odd reason](#Unit-tests-seem-to-fail-for-some-odd-reason)
- [Failed publishing test results to DevOps ](#Failed-publishing-test-results-to-DevOps)

## Unit tests seem to fail for some odd reason
If you run unit tests - you might encounter weird problems, like:

<img src="Images\Troubleshooting1.png">

In many cases, the issues are caused because of not enough memory for the docker container that is used to run the tests.  Just assign more memory when you start the Docker container, like in this example:
```yaml
- task: ALOpsDockerStart@1
  inputs:
    docker_image: $(dockerimage)
    docker_pull: true
    memory_gb: 8
```

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


[Back To Main Page](../README.md)