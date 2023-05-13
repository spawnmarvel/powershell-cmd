# https://gist.github.com/chgeuer/8342314

Write-Host "#### V1.0"
Write-Host "#### 0 Install Erlang or verify already installed, otp_win64_R16B03.exe must be in same folder as this script"
Write-Host "#### 1 Verify ERLANG_HOME or set it"
# Notice that erlsrv is not a general service utility for Windows, but designed for embedded Erlang systems

Write-Host "Check if Erlang is installed:"

$erlangkey = Get-ChildItem HKLM:\SOFTWARE\Wow6432Node\Ericsson\Erlang -ErrorAction SilentlyContinue
if ($null -eq $erlangkey ) { 
    Write-Host "Erlang not found, need to install it"
    # Start-Process -Wait otp_win64_R16B03.exe /S
}
else {
    Write-Host "Erlang is installed."
}

Write-Host "Check ERLANG_HOME:"
# Check erlang path
$system_erl_home = [System.Environment]::GetEnvironmentVariable("ERLANG_HOME", "Machine")

if ($system_erl_home -eq $null) {
    Write-Host "ERLANG_HOME is not in path, must set path"
    
}
else {
    Write-Host "ERLANG_HOME is in path" $system_erl_home
}


