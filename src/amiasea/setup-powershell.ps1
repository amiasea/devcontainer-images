$ErrorActionPreference = 'Stop'

Install-PSResource `
    -Name Microsoft.PowerShell.SecretManagement, Microsoft.PowerShell.SecretStore `
    -Repository PSGallery `
    -TrustRepository `
    -Scope CurrentUsers