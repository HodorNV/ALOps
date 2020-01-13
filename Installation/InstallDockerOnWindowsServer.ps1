# If you set up your own agent to run build pipelines, it makes sense to set up Docker.  
# The below script is the one we always use to install Docker on Windows Server.

# Execute line per line
Install-WindowsFeature Hyper-V, Containers -Restart
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Confirm:$false -Force
Install-Module DockerProvider -Confirm:$false -Force
Install-Package Docker -ProviderName DockerProvider -Confirm:$false -Force
