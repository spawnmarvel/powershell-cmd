# Remove all resources in a group and the group, this can take some time
Get-AzResourceGroup -Name ‘boose*’ | Remove-AzResourceGroup -Force -AsJob
# Get all resources in a resource group
Get-AzResource -ResourceGroupName boose-rg | ft