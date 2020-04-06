# ALOps License Setup
To register your ALOps installation, inject the "License Key" printed on the invoice in your pipelines via the Environment variable "ALOps_LicenseId".

The variable can be set per Pipeline, or via Variable Groups from the library.

We recommend keeping the LicenseId as a Azure Key Vault secret and injecting it using Variable Groups, this will also allow for easy updating of the LicenseId if required.