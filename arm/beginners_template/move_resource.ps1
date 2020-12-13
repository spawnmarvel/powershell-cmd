# https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/move-resource-group-and-subscription

# $resourceNew = "boose-rg"
# $resourceOld = "boose-rg1"
$storageToMove = Get-AzResource -ResourceGroupName $resourceOld -ResourceName "boosestorage2"

Write-Host $storageToMove.ResourceName+ " " + $storageToMove.Sku.Name
# our plan
$plan = Get-AzResource -ResourceGroupName $resourceOld -ResourceName "boosestorage2"
# execute the move
$result = Move-AzResource -DestinationResourceGroupName $resourceNew -ResourceId $plan.ResourceId
Write-Host $result