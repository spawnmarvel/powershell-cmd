
$gr = New-AzResourceGroup -Name "bxoose-rg" -Location "west europe" -Force
Write-Host "rg: " + $gr.ResourceGroupName


$templateFile = "C:\giti\powershell-cmd-bash\arm\quickstart-template\azuredeploy_merged_tags.json"

New-AzResourceGroupDeployment -Name testWithMergeRepository -ResourceGroupName $gr.ResourceGroupName -TemplateFile $templateFile -storagePrefix "bxo" -webAppName "jeklApp" # -WhatIf 

$group = Get-AzResource -ResourceGroupName $gr.ResourceGroupName
foreach ($item in $group) {
    Write-Host "resource name: " $item.Name
}