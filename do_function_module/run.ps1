Import-Module .\custom_module.psm1


Add-CustPSLogInfoOut("some information")
Add-CustPSLogErrorOut("some error")
Get-CustPSServices("wa")