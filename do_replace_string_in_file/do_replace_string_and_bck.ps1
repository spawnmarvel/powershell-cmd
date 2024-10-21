
# Set destination
Write-Host "-----------------------"
$fileName = "File.Consume.Service.exe.config"
$configFile = "C:\Users\File.Consume.Service.exe.config"
$destination =  "C:\Users\"

$content = Get-Content $configFileName # -Raw

# Take a Backup
$date = Get-Date -Format "yyyy-MM-dd-hh-mm-ss"
$newFileName = $fileName + "_" + $date + ($configFile | Split-Path -Leaf).Extension
Write-Host "New file name "$newFileName
Copy-Item -Path $configFile -Destination ($destination + $newFileName)


# Current string, when seraching for this, the return array sould be 1
$string_current = "a-user-name; Password = jippidif#7864564;"

$searchStr = Select-String -Path $configFile -Pattern $string_current
# OracleConnectionString
# write-host $searchStr[0]
# EventTaskConnectionString
# write-host $searchStr[1]
# there are only two in each file
Write-Host $searchStr.Length
Write-Host $searchStr

$string_new = "a-user-name; Password = querty789456;"
$content = $content -replace $string_current, $string_new

# Write the updated content back to the file
$content | Set-Content $configFile

# Read the file and verfy new string
$searchStr = Select-String -Path $configFile -Pattern $string_new
Write-Host $searchStr.Length
Write-Host $searchStr


