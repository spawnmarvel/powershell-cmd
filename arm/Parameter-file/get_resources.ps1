$resourceGr = "bxoose-rg"
$group = Get-AzResource -ResourceGroupName $resourceGr

foreach ($g in $group) {
    Write-Host $g.Name + " " $g.Sku.Name
    
}