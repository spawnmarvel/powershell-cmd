# https://thesysadminchannel.com/powershell-module/


# store all functions in .psm1 file

Function Add-CustPSLogInfoOut {
    param (
        [string]$ParameterText
    )
    $dt = Get-Date
    $rv= -join("Info: ", $dt, ":", $ParameterText)
    Add-Content log.txt $rv
}

Function Add-CustPSLogErrorOut {
    param (
        [string]$ParameterText
    )
    $dt = Get-Date
    $rv= -join("Error: ",$dt, ":", $ParameterText)
    Add-Content log.txt $rv
}

function Get-CustPSServices {
    param (
        [string]$ParameterText
    )
    
        $ParameterTextTemp = -join($ParameterText, "*")
        $rv = Get-Service | where-Object {$_.Status -eq "Stopped" -AND $_.Name -like $ParameterTextTemp}
        Add-Content log_service.txt $rv
        
}

