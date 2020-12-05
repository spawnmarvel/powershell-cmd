# Remove all resources in a group and the group, this can take some time
$rv_info = Get-AzResourceGroup -Name ‘boose*’ | Remove-AzResourceGroup -Force -AsJob
Write-Host $rv_info
# Get all resources in a resource group
$rv_result =  Get-AzResource -ResourceGroupName boose-rg | ft
Write-Host $rv_result