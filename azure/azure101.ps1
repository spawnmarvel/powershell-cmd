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
