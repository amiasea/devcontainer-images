BeforeAll {
    $ErrorActionPreference = 'Stop'

    $Image = $env:IMAGE_REFERENCE

    if ([string]::IsNullOrWhiteSpace($Image)) {
        throw 'IMAGE_REFERENCE environment variable is required.'
    }
}

Describe 'Dev Container Image' {
    Context 'PowerShell dependencies' {
        It 'contains Microsoft.PowerShell.SecretManagement' {
            docker run --rm $Image pwsh -NoProfile -Command {
                if (-not (Get-Module -ListAvailable -Name Microsoft.PowerShell.SecretManagement)) {
                    exit 1
                }
            }

            $LASTEXITCODE | Should -Be 0
        }

        It 'contains Microsoft.PowerShell.SecretStore' {
            docker run --rm $Image pwsh -NoProfile -Command {
                if (-not (Get-Module -ListAvailable -Name Microsoft.PowerShell.SecretStore)) {
                    exit 1
                }
            }

            $LASTEXITCODE | Should -Be 0
        }
    }
}