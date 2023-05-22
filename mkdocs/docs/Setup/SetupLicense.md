# ALOps License Setup
To register your ALOps installation, create a variable "ALOps_LicenseId" with value the provided licensekey.
inject the "License Key" printed on the invoice in your pipelines via the Environment variable "alops_licenseid" or "alops-licenseid".

You can do this in either a pipeline, or by using a variable group from the library (preferred)

## Pipeline variable
```yaml
variables:
- name: 'alops-licenseid'
  value: '<your_license_uid>'
```

## Variable group
Create a variable group in the pipelines "Library", you can give this group any valid name.
Import this variable group in the pipeline with the following yaml.
Set a variable 'alops-licenseid' in this group with '<your_license_uid>' or link it to an Azure Key Vault.
If you use Azure Key Vault, make sure you name the variable exactly 'alops-licenseid'.

```yaml
variables:
- group: 'ALOps License'
```

## Recommended
We recommend to use 'Azure Key Vault' to keep the ALOps License UID in a central secure place, you can link this Key Vault into multiple collections, projects,... This scenario is the most secure and allows for central management of your License key.