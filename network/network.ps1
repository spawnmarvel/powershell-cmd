# loop, https://powertoe.wordpress.com/2009/12/14/powershell-part-4-arrays-and-for-loops/
$machine_adr = @("10.....", "10.......", "hostname")
$count = 0
try {
    for ($i = 0; $i -lt $machine_adr.length; $i++) {
        "Adr " + $machine_adr[$i]
        $rv= New-Object System.Net.Sockets.TcpClient($machine_adr[$i], 8080)
        $count++
    }
}
catch {
    write-output "Could not connect"
}
write-output "Connected success " $count
write-output "sleep for 15 sec"
Start-Sleep -s 15

