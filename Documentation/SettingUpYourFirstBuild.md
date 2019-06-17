# Setting Up Your FirstBuild
The intention of this document is to help you build your first build pipeline with ALOps.  This means we will make ALOps available to your DevOps, and import one of the template repos to start building an app for ALOps, including a build pipeline in DevOps.

## Download ALOps to DevOps
You can simply download ALOps to your DevOps environment by:
- Open [DevOps](https://devops.azure.com) and log in with your account
- Open the organization you want to work in
- On the right top corner, click the right basket to browse the marketplace. 

<img src="Images\FirstBuildPipeline1.png">

- Search for "ALOps" and open that page
- Click "Get"

<img src="Images\FirstBuildPipeline2.png">

- select your collection/organization and click "Install"

<img src="Images\FirstBuildPipeline8.png">

The tool is being downloaded to your marketplace.  If you go to "Manage Extensions", you'll find it in your "Installed" Extensions.

<img src="Images\FirstBuildPipeline3.png">

You are now good to go to add steps from ALOps in your build pipelines!

## Create a new repository, based on one of the templates from ALOps
ALOps provides templates for AL Apps in [this public project](https://dev.azure.com/HodorNV/ALOps%20Templates/).  We will import the code from one of the repos into our own repo.  This can simply be done by:
- Navigate to one of the repos of the above link, like

<img src="Images\FirstBuildPipeline4.png">

- Now, copy the "clone" link.

<img src="Images\FirstBuildPipeline5.png">

- Time to create your own repository, so open your own DevOps organization, and create a new repository (or project)
- When you have don that, your files-page will show a few options.  We will use the import-option.

<img src="Images\FirstBuildPipeline6.png">

- Paste the copied url and click "Import"

<img src="Images\FirstBuildPipeline7.png">

You have now a new repo, with the code imported from the template project from ALOps.

## And now?
There is a big chance you're all done now.  Because of the "azure-pipelines.yml", it should have created a build pipeline automatically.

If not, you can easily create it yourself:
- Go to Pipelines / Builds
- Click New / New Build Pipeline
- CLick "Azure Repos Git"
- select your new repo
- Change the "Pool / name" to your own agent pool 
- Now it will detect your yml file.  Click "Run" to save and run the build pipelin


[Back To Main Page](../README.md)