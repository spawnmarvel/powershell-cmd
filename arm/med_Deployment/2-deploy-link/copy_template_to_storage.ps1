$projectName = "link2test"
$resourceGroupN = $projectName+ "-rg"
$location = "west europe"
$storageAccountName = $projectName + "store"
$containerName = "templates"

$linkedTemplateURL = "https://raw.githubusercontent.com/Azure/azure-docs-json-samples/master/get-started-deployment/linked-template/linkedStorageAccount.json"
$fileName = "linkedStorageAccount.json" # file for downloading and uploading the linked temp
# download the template
Invoke-WebRequest -Uri $linkedTemplateURL -OutFile "$home/$fileName"
# 1 Create rg
$resourGr = New-AzResourceGroup -Name $resourceGroupN -Location $location -Force

#  2 Create storage acc
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupN -Name $storageAccountName -Location $location -SkuName "Standard_LRS"
$context = $storageAccount.Context
# Create container
New-AzStorageContainer -Name $containerName -Context $context -Permission Container
# Upload the template
Set-AzStorageBlobContent -Container $containerName -File "$home/$filename" -Blob $fileName -Context $context


