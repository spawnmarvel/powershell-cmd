# https://thesysadminchannel.com/powershell-module/


# store all functions in .psm1 file

Function Add-LogOut1($txt) {
    Add-Content log.txt $txt
}

Function Add-ErrorOut($txt) {
    Add-Content log.txt $txt
}

function Add-Logger($txt) {
    $dt = Get-Date
    $rv = $dt.ToString() + ":" + $txt
    Add-Content log.txt $rv
    
}

Function Add-CustPSLogOut {
    param (
        [string]$ParameterText
    )
    Add-Content log.txt $ParameterText
}

