$resourGr = New-AzResourceGroup -Name "bxoose-rg" -Location "west europe" -Force
Write-Host "rg: " + $gr.ResourceGroupName

$tempFile = "C:\giti\powershell-cmd-bash\arm\med_Deployment\1-deploy-local\azure-deploy.json"

New-AzResourceGroupDeployment -Name deployLocalTemplate -ResourceGroupName $resourGr.ResourceGroupName -projectName "deplocal" -TemplateFile $tempFile -Verbose #  -WhatIf
