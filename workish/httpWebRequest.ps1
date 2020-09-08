function get_timestamp {
    return "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)   
}

Try {
  $url = "http://localhost:8080/AspenCoreSearch/"
  $req=[system.Net.HttpWebRequest]::Create($url);
  $res = $req.getresponse();
  $stat = $res.statuscode
  Add-Content http_check.txt "$(get_timestamp) : status :  $stat"
  $res.Close()
}
Catch {
  Write-output "Could not find url"
}
