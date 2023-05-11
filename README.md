## POWERSHELL

### Good to know

Using the PowerShell ISE is the preferred way to work with the scripting language, because it provides syntax highlighting, auto-filling of commands and other automation features that simplify script development and testing.

#### ISE
View modules use the ISE

![Screenshot](https://github.com/spawnmarvel/powershell-cmd/blob/master/x_images/power_ise.jpg)

#### Get-ExecutionPolicy

In addition, there is policy that restricts script execution. You can check this policy by running the Get-ExecutionPolicy command in PowerShell:
```ps1
Get-ExecutionPolicy
```

* Restricted— No scripts are allowed. This is the default setting, so you will see it the first time you run the command.
* AllSigned— You can run scripts signed by a trusted developer. With this setting in place, before executing, a script will ask you to confirm that you want to run it.
* RemoteSigned— You can run your own scripts or scripts signed by a trusted developer.
* Unrestricted— You can run any script you want.

#### Set-ExecutionPolicy RemoteSigned

To start working with ps1
```ps1 
Set-ExecutionPolicy RemoteSigned
```

## Powershell Tutorial (Tutorialspoint)

https://www.tutorialspoint.com/powershell/index.htm

View the Windows Powershell Language quick reference also

https://github.com/spawnmarvel/powershell-cmd/tree/master/x_quick_reference_pdf



### Cmdlets
A cmdlet is a PowerShell command with a predefined function, similar to an operator in a programming language, A cmdlet always consists of a verb (or a word that functions as a verb) and a noun, separated with a hyphen (the “verb-noun” rule). For example, some of the verbs include:

* Get — To get something
* Set — To define something
* Start — To run something
* Stop — To stop something that is running
* Out — To output something
* New — To create something (“new” is not a verb, of course, but it functions as one)

Good news — you don’t need to memorize all cmdlets, use Get-Command

```ps1
Get-Command
# CommandType     Name                                               Version    Source
# -----------     ----                                               -------    ------
# Alias           Add-AdlAnalyticsDataSource                         1.0.2      Az.DataLakeAnalytics
# [...]
```
The Get-Help cmdlet displays information about PowerShell concepts and commands, including cmdlets, functions, Common Information Model (CIM) commands, workflows, providers, aliases, and scripts.

```ps1
# Get-Help cmdlet
Get-Help Get-Service
# NAME
#    Get-Service
# SYNTAX
#    Get-Service [[-Name] <string[]>] [-DependentServices] [-RequiredServices] [-Include <string[]>] [-Exclude <string[]
#    >] [<CommonParameters>]
# [...]
```

If you forget a cmdlet’s parameters, use cmdlet | Get-Member, which will display the parameters for the Get-Process cmdlet:
```ps1
Get-Service | Get-Member
#    TypeName: System.Service.ServiceController#StartupType
# Name                      MemberType    Definition
# ----                      ----------    ----------
# Name                      AliasProperty Name = ServiceName

# We can then do the query
Get-Service -Name W*
# Status   Name               DisplayName
# ------   ----               -----------
# Running  W32Time            Windows Time
# Stopped  WaaSMedicSvc       Windows Update Medic Service
```

If you still don’t find the cmdlet you need, you can make sure the help is current and then get examples for a cmdlet

```ps1
# To update the help data
Update-Help

# Get examples for a cmdlet
Get-Help Get-Process -Examples
# --------- Example 1: Get all services on the computer ---------
#    Get-Service
#    --- Example 2: Get services that begin with a search string ---
#    Get-Service "wmi*"

```
#### Pipes
#### | (the “pipe”) A pipe passes data from one cmdlet to another
#### For example, if you execute the following script, you’ll get all services sorted by their status:
```ps1
# get service info and sort by status
Get-Service | Sort-Object -property Status
# output dir to text
"ftft" | Out-File out.txt
```



## Linux / BASH, Not a tutorial

View the BASH Language quick reference also

https://github.com/spawnmarvel/powershell-cmd/tree/master/x_quick_reference_pdf

## CMD, Not a tutorial, view postfix .cmd files

### Robocopy (just file structure)
``` CMD
robocopy C:\tmp C:\temp2 /e /xf *
```

### Robocopy copy all (run as admin to keep all properties)
``` CMD
REM /e copy subfolders including empty
REM /r:0  Number of retries (default:1000000)
REM /w:o wait time between retires
REM /sec copy files with SECurity
REM /secfix fix file SECurity on all files, even skipped files
REM /timfix fix file TIMes on all files, even skipped
REM /log the log file will come where your path is in cmd
REM /np Specifies that the progress of the copying operation (the number of files or directories copied so far) will not be displayed.
REM /np for faster copy, since it does not write % to log file
REM /mt:32 or 16, 8 is default, hm sometimes this is causing errors, must log all if this is used 
REM It is all about the bandwidth, the cloud can be quick or slow...mt could be danger and give errors!

REM NOTE: /sec /secfix could be problematic between Azure VM and Azure Storage Account File Share (but do you need them?), i.e access denied. 
REM NOTE: Check if you can edit in the container with your user, mainly the security on a folder

REM net use: connect, remove and configure connections to shared resources like mapped drives
net use z: \\WM01\f$
robocopy z:\datacatalog e:\datacatalog /e /r:1 /w:5 /sec /secfix /timfix /log:"F:\robo_log.log" /np
net use z: /del
pause

REM and not map it to z
robocopy \\WM01\f$\datacatalog e:\datacatalog /e /r:1 /w:5 /sec /secfix /timfix /log:"F:\robo_log.log" /np

REM "" path
Robocopy "c:\Program Files (x86)\folder\folder1" "c:\Program Files (x86)\folder\folder2" /e /r:1 /w:5 /sec /secfix /timfix /log:"c:\Program Files (x86)\folder\folder2\robo_log.log" /np
```

[Migrating Data to Microsoft Azure Files MT] [https://azure.microsoft.com/en-us/blog/migrating-data-to-microsoft-azure-files/]

#### MT
MT is the number of threads to use (see discussion below) When using robocopy, you should choose the “/mt” parameter to maximize throughput. This lets you control how many parallel threads do the copy, essentially controlling the queue depth of the IO requests to storage. A very low thread count does not queue enough requests on the server to let you take advantage of the inherent parallelism of our cloud architecture. A very high thread count risks server-side throttling, which end up reducing throughput. In our testing, we have found queue depths between 16 to 32 to be best for maximizing throughput. 

[robocopy-the-ultimate] [https://adamtheautomator.com/robocopy-the-ultimate/]

Note that if you do use /MT, you won’t be able to use /IPG or /EFSRAW. For better performance, don’t output the log to the console. Instead, use /LOG.

Robocopy does not copy open files. Any process may open files for exclusive read access by withholding the FILE_SHARE_READ flag during opening. Even Robocopy's Backup mode will not touch those files.

