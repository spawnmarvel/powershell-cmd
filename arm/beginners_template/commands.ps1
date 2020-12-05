# New rg
New-AzResourceGroup -Name boose-rg -Location "West Europe"
# Deploy template
$templateFile = "C:\giti\powershell-cmd-bash\arm\beginners_template\azuredeploy.json"
New-AzResourceGroupDeployment -Name blanktemplate -ResourceGroupName boose-rg -TemplateFile $templateFile
