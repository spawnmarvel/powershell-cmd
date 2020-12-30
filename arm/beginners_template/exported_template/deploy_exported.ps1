$resourceGr = "bxoose-rg"
$templateFile = "C:\giti\powershell-cmd-bash\arm\beginners_template\exported_template\azuredeploy_exported.json"

# New-AzResourceGroupDeployment -Name addExported -ResourceGroupName $resourceGr -TemplateFile $templateFile -storagePrefix "bxo" -WhatIf 
New-AzResourceGroupDeployment -Name addExported -ResourceGroupName $resourceGr -TemplateFile $templateFile -storagePrefix "bxo" -Debug