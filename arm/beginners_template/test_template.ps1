# test the template, As the ARM template above is valid and test is successful, which returns NOTHING.
Test-AzResourceGroupDeployment -ResourceGroupName boose-rg -TemplateFile .\azuredeploy.json -ErrorAction Stop
# but that is not enough for testing
# From this point, we only know that the ARM template deployment ITSELF will be successful. 
# But, let’s think about this. Even if the ARM template has been deployed successfully, 
# we still can’t guarantee that the deployed Azure resources are correctly configured or not. 
# Therefore, merely running Test-AzureRmResourceGroupDeployment won’t help much for testing.
# There’s still a hope. If we use the debugging mode while running the cmdlet and capture those debugging messages, we might be able to get some clues.

$DebugPreference = "Continue"
$output = Test-AzResourceGroupDeployment -ResourceGroupName boose-rg -TemplateFile .\azuredeploy.json -ErrorAction Stop 5>$1
# Write-Host $output.GetType()
# for ($i=0;$i -le 10;$i++) {
#    Write-Host $output[$i]
# }

$DebugPreference = "SilentlyContinue"
#Write-Host $output
#for ($i=0;$i -le 10;$i++) {
#    Write-Host $i
#}
