# Get all resources in the current subscription
# ft = format table
Get-AzResource | ft
# Get all resources in a resource group
Get-AzResource -ResourceGroupName bose-rg | ft
# Get all resources whose resource group matches the provided wildcard
Get-AzResource -ResourceGroupName bose* | ft
# Get a resource group by wildcard
Get-AzResourceGroup -Name ‘bose*’
# Remove all resources in a group and the group
Get-AzResourceGroup -Name ‘bose*’ | Remove-AzResourceGroup -Force -AsJob

# time zone
Get-TimeZone -ListAvailable
Get-TimeZone -ListAvailable | where ({$_.Id -like "Russian*"})
Set-TimeZone -Id "Russian Standard Time"
Get-Date

#Rm storage account
#First list it
Get-AzResource -ResourceGroupName boos* | ft
# Name         ResourceGroupName ResourceType                      Location
# ----         ----------------- ------------                      --------
# boosestorage boose-rg          Microsoft.Storage/storageAccounts westus
# boosewe      boose-rg          Microsoft.Storage/storageAccounts westus
# rm it, boosestorage
Remove-AzureRmResource -ResourceName boosestorage -ResourceType Microsoft.Storage/storageAccounts -ResourceGroupName boose-rg
