# connect
# Connect-AzAccount
$resourceGr = "boose-rg"
$resourceGr1 = "boose-rg1"
# New rg
# New-AzResourceGroup -Name $resourceGr -Location "West Europe"
# Deploy template
$templateFile = "C:\giti\powershell-cmd-bash\arm\beginners_template\azuredeploy.json"
# create first, add resource, add paramter
# New-AzResourceGroupDeployment -Name addName -ResourceGroupName $resourceGr -TemplateFile $templateFile -storageName "boosestorage1" -storageSKU Standard_LRS

# add template functions
New-AzResourceGroupDeployment -Name SetItBack -ResourceGroupName $resourceGr -TemplateFile $templateFile -storageName "boosestorage" -storageSKU Standard_LRS

# move a resurce

