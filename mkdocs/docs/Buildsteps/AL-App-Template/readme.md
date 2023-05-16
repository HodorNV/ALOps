# Important information for all developers

## Workitems
Analysts create a workitem in tfs (will be automated frrom DEVOPS in the future)
URL: https://tfs.ifacto.be/tfs/ktn%20apps



## Design Guidelines
### Number Ranges
**Renumbering is not allowed!** - This would cause major problems when going live!

### Folder Structure
- Each module a new folder.  All objects in the root of this folder.

## Use following VSCode Extensions
- AL Language Extension (https://ktn.ifacto.be/allanguage.vsix)
- CRS AL Language Extension (`ext install crs-al-language-extension`)

## Source Control
URL: https://tfs.ifacto.be/tfs/ktn%20apps

### Step 1 - Clone
Use these URLs to clone:
- URL for W1: https://tfs.ifacto.be/tfs/ktn%20apps/_git/W1
- URL for BE: https://tfs.ifacto.be/tfs/ktn%20apps/_git/BE

### Step 2 - Branch & Publish

### Step 3 - Commit & Push

### Stop 4 - Pull Request
You can only get your developments in the master-branch by creating a pull request.
- For W1: https://tfs.ifacto.be/tfs/ktn%20apps/_git/W1/branches
- For BE: https://tfs.ifacto.be/tfs/ktn%20apps/_git/BE/branches

## NAV Environments
Webclient are published on public endpoints, the base url for KTN is https://ktn.ifacto.be/
For each Localisation Branch combination, a WebClient endpoint is created:
- https://ktn.ifacto.be/W1_MASTER/
- https://ktn.ifacto.be/BE_MASTER/

Other endpoints (OData, SOAP, DEV) are mounted on the same base-urls.
- https://ktn.ifacto.be/W1_MASTER/WS/Services
- https://ktn.ifacto.be/W1_MASTER/OData/
- https://ktn.ifacto.be/W1_MASTER/ODatav4/
- https://ktn.ifacto.be/W1_MASTER/Dev/