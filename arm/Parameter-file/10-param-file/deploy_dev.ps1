
$gr = New-AzResourceGroup -Name "bxoose-dev-rg" -Location "west europe" -Force
Write-Host "rg: " + $gr.ResourceGroupName

$templateFile = "C:\giti\powershell-cmd-bash\arm\Parameter-file\10-param-file\azure_template.json"
$paramterFile = "C:\giti\powershell-cmd-bash\arm\Parameter-file\10-param-file\azure_deploy.parameters.dev.json"

New-AzResourceGroupDeployment -Name testParameterDev -ResourceGroupName $gr.ResourceGroupName -TemplateFile $templateFile -TemplateParameterFile $paramterFile # -WhatIf 

$group = Get-AzResource -ResourceGroupName $gr.ResourceGroupName
foreach ($item in $group) {
    Write-Host "resource name: " $item.Name
}