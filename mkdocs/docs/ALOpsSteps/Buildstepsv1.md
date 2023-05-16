# Build Steps Overview
    Let's describe all the Build Steps that we have at our disposal
## ALOps AdminCenter API
  * Interact with BC SaaS AdminCenter API.
  * YAML Template:
   
!INCLUDE "ALOpsAdminCenterAPI_v1.md"
    
## ALOps Agent Maintenance
  * Cleanup and maintain DevOps a Agent for Business Central.
  * YAML Template:
   
!INCLUDE "ALOpsAgentMaintenance_v1.md"
    
## ALOps App License Check
  * Check App files agains a license.
  * YAML Template:
  
!INCLUDE "ALOpsAppLicenseCheck_v1.md"
    
## ALOps App Runtime Package
  * Get a NAV App runtime package for onprem deployment.
  * YAML Template:

!INCLUDE "ALOpsAppRuntimePackage_v1.md"
    
## ALOps App Sign
  * Codesign Business Central extension with .pfx.
  * YAML Template:
   
!INCLUDE "ALOpsAppSign_v1.md"
    
## ALOps App Sign Verify
  * Verify CodeSign of Business Central extension.
  * YAML Template:
   
!INCLUDE "ALOpsAppSignVerify_v1.md"
    
## ALOps App Test
  * Run Business Central Test-Suite and collect results.
  * YAML Template:
   
!INCLUDE "ALOpsAppTest_v1.md"
    
## ALOps App Validation
  * Validate App from Business Central AppSource.
  * YAML Template:
   
!INCLUDE "ALOpsAppValidation_v1.md"
    
## ALOps App Clean
  * Remove all extensions from Business Central service tier.
  * YAML Template:
   
!INCLUDE "ALOpsAppClean_v1.md"
    
## ALOps App Copy
  * Copy Business Central extensions from one service tier to another.
  * YAML Template:
   
!INCLUDE "ALOpsAppCopy_v1.md"
    
## ALOps App Compiler
  * Compile a Business Central extension from AL code.
  * YAML Template:
   
!INCLUDE "ALOpsAppCompiler_v1.md"
    
## ALOps Docker Create
  * Create Docker image based on NAV/BC Artifacts.
  * YAML Template:
   
!INCLUDE "ALOpsDockerCreate_v1.md"
    
## ALOps Docker Execute
  * Execute powershell script in container.
  * YAML Template:
   
!INCLUDE "ALOpsDockerExec_v1.md"
    
## ALOps Docker Remove
  * Remove Business Central docker container.
  * YAML Template:
   
!INCLUDE "ALOpsDockerRemove_v1.md"
    
## ALOps Docker Start
  * Start Business Central docker container.
  * YAML Template:
   
!INCLUDE "ALOpsDockerStart_v1.md"
    
## ALOps Docker Wait
  * Wait until the Business Central container is started.
  * YAML Template:
   
!INCLUDE "ALOpsDockerWait_v1.md"
    
## ALOps Extension API
  * Get/Publish extensions with the Business Central API.
  * YAML Template:
   
!INCLUDE "ALOpsExtensionAPI_v1.md"
    
## ALOps Fob Import
  * Import objects from .FOB file.
  * YAML Template:
   
!INCLUDE "ALOpsFobImport_v1.md"
    
## ALOps Info
  * Print information about ALOps and executing host.
  * YAML Template:
   
!INCLUDE "ALOpsInfo_v1.md"
    
## ALOps License Import
  * Import Business Central license (.flf).
  * YAML Template:
   
!INCLUDE "ALOpsLicenseImport_v1.md"
    
## ALOps OpenAPI
  * Generate OpenAPI descriptions from Business Central API's.
  * YAML Template:
   
!INCLUDE "ALOpsOpenAPI_v1.md"
    
## ALOps Package Import
  * Import and Process RapidStart/Configuration Package
  * YAML Template:
   
!INCLUDE "ALOpsPackageImport_v1.md"
    
## ALOps App Publish
  * Publish Business Central extension to service tier.
  * YAML Template:
   
!INCLUDE "ALOpsAppPublish_v1.md"
    
## ALOps Repository Publish
  * Publish extension to ALOps Repository.
  * YAML Template:
   
!INCLUDE "ALOpsRepositoryPublish_v1.md"
    
## ALOps SaaS Get Extensions
  * Replaced by Task [ALOps Extension API]
  * YAML Template:
   
!INCLUDE "ALOpsSaaSGetExtensions_v1.md"
    
## ALOps SaaS Publish Extension
  * Replaced by Task [ALOps Extension API]
  * YAML Template:
   
!INCLUDE "ALOpsSaaSPublishExtension_v1.md"

