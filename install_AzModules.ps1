<#
Super basic script to simply install the desired Azure PowerShell modules.

TODO:
-----
More to follow as the use case develops
#>

$modules = @('Az.Accounts', 'Az.Compute', 'Az.ConnectedMachine')

$modules | ForEach-Object { Install-Module $_ -Scope AllUsers -Force }
