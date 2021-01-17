$projectName = "link2test"
$resourceGroupN = $projectName+ "-rg"
$location = "west europe"
$storageAccountName = $projectName + "store"
$containerName = "templates"

$fileName = "linkedStorageAccount.json" # file for downloading and uploading the linked temp
$templateFile = "C:\giti\powershell-cmd-bash\arm\med_Deployment\2-deploy-link\azure-deploy-main.json"

$key = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroupN -nam $storageAccountName).Value[0]
$context = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $key

# Generate SAS token
$linkedTemplateUri = New-AzStorageBlobSASToken -Context $context -Container $containerName -Blob $fileName -Permission r -ExpiryTime (Get-Date).AddHours(2.0) -FullUri

# Deploy the main template with the linked template
# New-AzResourceGroupDeployment -Name DeployLinkedTemplate -ResourceGroupName $resourceGroupN -TemplateFile $templateFile -projectName $projectName -linkedTemplateUri $linkedTemplateUri -WhatIf

# Deploy the main template with the linked template
New-AzResourceGroupDeployment -Name DeployLinkedTemplate -ResourceGroupName $resourceGroupN -TemplateFile $templateFile -projectName $projectName -linkedTemplateUri $linkedTemplateUri -Verbose



