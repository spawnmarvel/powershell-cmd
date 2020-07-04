# https://docs.microsoft.com/en-us/powershell/module/nettcpip/test-netconnection?view=win10-ps

# # if we run the simple http server in python network_http_server, we get connected is true, if we stop the server we get an connection refused
# check port and connection

try {
    New-Object System.Net.Sockets.TcpClient("10.0.0.104", 8080)
}
catch {
    write-output "Could not connect"
}