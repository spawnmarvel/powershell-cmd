# https://gsilt.blogspot.com/2018/12/automating-rabbitmq-cluster-deployment.html


# vars
$rmq_dir = "c:\RabbitMqDirectory"
$rmq_base = "RABBITMQ_BASE"
$rmq_conf = "RABBITMQ_CONFIG_FILE"
$rmq_conf_adv = "RABBITMQ_ADVANCED_CONFIG_FILE"


Write-Host "#### V1.0"
Write-Host "#### 0 RUN AS ADMIN"
Write-Host "#### 1 Install RabbitMQ or verify already installed"
Write-Host "#### 2 Check or set env before install"
Write-Host "#### 3 Check or install RabbitMQ from local dir (must be in same folder as script)"
Write-Host "#### 5 Set variables for before you start"


# Make a directory for base
if(Test-Path -Path $rmq_dir){
    Write-Host "Directory exists: " $rmq_dir

}
else {
   Write-Host "Creating direcotry: " $rmq_dir
   New-Item $rmq_dir -ItemType Directory
}

# Add base to path
$rmq_base_home = [System.Environment]::GetEnvironmentVariable($rmq_base, "Machine")

if ($null -eq $rmq_base_home) 
{
   Write-Host "Adding to path: " $rmq_base
   Write-Host $rmq_dir
   $rv = [System.Environment]::SetEnvironmentVariable($rmq_base,$rmq_dir,'Machine')
   Write-Host $rv
   
}
else {
   Write-Host $rmq_base " : " $rmq_base_home
  
}

# Add conf to path
$rmq_conf_home = [System.Environment]::GetEnvironmentVariable($rmq_conf, "Machine")

if ($null -eq $rmq_conf_home) 
{
   Write-Host "Adding to path: " $rmq_conf
   $tmp_conf = $rmq_dir + "\rabbitmq.conf"
   Write-Host $tmp_conf
   $rv = [System.Environment]::SetEnvironmentVariable($rmq_conf,$tmp_conf,'Machine')
   Write-Host $rv
}
else {
   Write-Host $rmq_conf " : " $rmq_conf_home
}

# Add adv conf to path
$rmq_conf_adv_home = [System.Environment]::GetEnvironmentVariable($rmq_conf_adv, "Machine")

if ($null -eq $rmq_conf_adv_home) 
{
   Write-Host "Adding to path: " $rmq_conf_adv
   $tmp_conf_adv = $rmq_dir + "\advanced.config"
   Write-Host $tmp_conf_adv
   $rv = [System.Environment]::SetEnvironmentVariable($rmq_conf_adv,$tmp_conf_adv,'Machine')
   Write-Host $rv
}
else {
   Write-Host $rmq_conf_adv " : " $rmq_conf_adv_home

}


Write-Host "Check if RabbitMQ service is installed:"
# Rabbitmq
$service = Get-Service -Name RabbitMQ -ErrorAction SilentlyContinue
# if($service -eq $null)
if ($null -eq $service) {
    # Service does not exist
    Write-Host "RabbitMQ not found, need to install it"
    # set env rabbitmq.conf
    # advancec.config
    # C:\> rabbitmq-server-2.7.1.exe /S
    # enable plugins
    # https://stackoverflow.com/questions/39201172/how-to-install-rabbitmq-silent
}
else {
    # Service does exist
    Write-Host "RabbitMQ is installed"
    
}
