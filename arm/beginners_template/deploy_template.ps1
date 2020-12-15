# connect
# Connect-AzAccount
$resourceGr = "boose-rg"
$resourceGr1 = "boose-rg1"
# New rg
# New-AzResourceGroup -Name $resourceGr -Location "West Europe"
# Deploy template
$templateFile = "C:\giti\powershell-cmd-bash\arm\beginners_template\azuredeploy.json"

# ******************************************************************    1 Create first, add resource
# New-AzResourceGroupDeployment -Name addStorage -ResourceGroupName $resourceGr -TemplateFile $templateFile
# ****************************************************************** 2 add paramter
# New-AzResourceGroupDeployment -Name addName -ResourceGroupName $resourceGr -TemplateFile $templateFile -storageName "boosestorage1" -storageSKU Standard_LRS

# ******************************************************************    3 Add template functions
# New-AzResourceGroupDeployment -Name addLocationParameter -ResourceGroupName $resourceGr -TemplateFile $templateFile -storageName "boosestorage" -storageSKU Standard_LRS

# move a resurce, view move_resource.ps1

# ******************************************************************    4 Add variables
# New-AzResourceGroupDeployment -Name addnameVariable -ResourceGroupName $resourceGr -TemplateFile $templateFile -storagePrefix "boose" -storageSKU Standard_LRS -Debug
# $operations = New-AzResourceGroupDeployment -Name addnameVariable -ResourceGroupName $resourceGr -TemplateFile $templateFile -storagePrefix "boose" -storageSKU Standard_LRS -Debug

# this will give you all the operations of this deploy
# foreach ($oper in $operations) {
#    Write-Host $oper.id
#    Write-Host "Request"
#    $oper.Properties.Request | ConvertTo-Json -Depth 10
#    Write-Host "Respons"
#    $oper.Properties.Response | ConvertTo-Json -Depth 10
#}

# ******************************************************************  5Add output
New-AzResourceGroupDeployment -Name addOutputs -ResourceGroupName $resourceGr -TemplateFile $templateFile -storagePrefix "boose" -storageSKU Standard_LRS -Verbose


# *****************************************************************

