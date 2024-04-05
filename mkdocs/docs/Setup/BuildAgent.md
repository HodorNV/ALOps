# Set up a Build Agent

waldo described how to set up a Build agent here: https://www.waldo.be/2020/07/13/installing-a-devops-agent-with-docker-with-the-most-chance-of-success/
We recommend to follow these steps.

In addition, since Business Central version v24, you need to install the following dependencies on the Build Agent:

- [PowerShell 7](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4) ([direct link](https://download.visualstudio.microsoft.com/download/pr/9e753d68-7701-4ddf-b358-79d64e776945/2a58564c6d0779a7b443a692c520782f/dotnet-sdk-8.0.203-win-x64.exe))
- [.Net 8.0](https://dotnet.microsoft.com/en-us/download/dotnet/8.0) ([direct link](https://github.com/PowerShell/PowerShell/releases/download/v7.4.1/PowerShell-7.4.1-win-x64.msi))

Just install both and reboot.