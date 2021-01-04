
$gr = New-AzResourceGroup -Name "bxoose-prod-rg" -Location "west europe" -Force
Write-Host "rg: " + $gr.ResourceGroupName

$templateFile = "C:\giti\powershell-cmd-bash\arm\Parameter-file\10-param-file\azure_template.json"
$paramterFile = "C:\giti\powershell-cmd-bash\arm\Parameter-file\10-param-file\azure_deploy.parameters.prod.json"

New-AzResourceGroupDeployment -Name testParameterProd -ResourceGroupName $gr.ResourceGroupName -TemplateFile $templateFile -TemplateParameterFile $paramterFile # -WhatIf 

$group = Get-AzResource -ResourceGroupName $gr.ResourceGroupName
foreach ($item in $group) {
    Write-Host "resource name: " $item.Name
}