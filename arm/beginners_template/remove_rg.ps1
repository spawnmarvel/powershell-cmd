# -AsJob, Run cmdlet in the background
# -Force, Forces the command to run without asking for user confirmation.
# -WhatIf Shows what would happen if the cmdlet runs. The cmdlet is not run.

# Get all resources in a resource group
# $rv_result =  Get-AzResource -ResourceGroupName boose-rg | ft
# Write-Host $rv_result
# ***********************************************
# Remove all resources in a group and the group, this can take some time
# $rv_info = Get-AzResourceGroup -Name ‘boose*’ | Remove-AzResourceGroup -Force -AsJob
# Write-Host $rv_info
# **********************************************
# remove just a resource
$resourceGr = "boose-rg"
$plan = Get-AzResource -ResourceGroupName $resourceGr -ResourceName "boosec4ybsmchbhppi"
Write-Host $plan.ResourceId + " " $plan.Name
# $rv_resource  = Remove-AzResource -ResourceId $plan.ResourceId -WhatIf
$rv_resource  = Remove-AzResource -ResourceId $plan.ResourceId -Force # outputs true if success, else false
# $rv_resource  = Remove-AzResource -ResourceId $plan.ResourceId -Force -AsJob
Write-Host $rv_resource
