# Troubleshooting
Let's list some common problems and their solutions:

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


[Back To Main Page](../README.md)