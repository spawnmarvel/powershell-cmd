#https://blog.netwrix.com/2018/02/21/windows-powershell-scripting-tutorial-for-beginners/
Get-Process
Get-Service
Get-Content
Get-Service -Name W*
Get-Service | Get-Member
Update-Help #to update the help data
Get-Help Get-Process -Examples
#pipes
# For example, if you execute the following script, you’ll get all services sorted by their status:
Get-Service | Sort-Object -property Status
# all main links is in the head link
# https://blog.netwrix.com/2015/04/06/monitoring-event-logs-with-powershell/
Get-WinEvent –LogName application –MaxEvents 10
Get-WinEvent –LogName system –MaxEvents 10



