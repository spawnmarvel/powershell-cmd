## POWERSHELL

#### Using the PowerShell ISE is the preferred way to work with the scripting language, because it provides syntax highlighting, auto-filling of commands and other automation features that simplify script development and testing.

#### View modules use the ISE:
![Screenshot](power_ise.jpg)

#### In addition, there is policy that restricts script execution. You can check this policy by running the Get-ExecutionPolicy command in PowerShell:
```ps1
Get-ExecutionPolicy
```

* Restricted— No scripts are allowed. This is the default setting, so you will see it the first time you run the command.
* AllSigned— You can run scripts signed by a trusted developer. With this setting in place, before executing, a script will ask you to confirm that you want to run it.
* RemoteSigned— You can run your own scripts or scripts signed by a trusted developer.
* Unrestricted— You can run any script you want.

#### To start working with ps1
```ps1 
Set-ExecutionPolicy RemoteSigned
```

### Cmdlets
#### A cmdlet is a PowerShell command with a predefined function, similar to an operator in a programming language, A cmdlet always consists of a verb (or a word that functions as a verb) and a noun, separated with a hyphen (the “verb-noun” rule). For example, some of the verbs include:

* Get — To get something
* Set — To define something
* Start — To run something
* Stop — To stop something that is running
* Out — To output something
* New — To create something (“new” is not a verb, of course, but it functions as one)

#### Good news — you don’t need to memorize all cmdlets. You can list all cmdlets by executing the Get-Help -Category cmdlet
```ps1
Get-Help
```
#### Parameter
```ps1
Get-Service -Name W*
```
#### If you forget a cmdlet’s parameters, just use a script like the following, which will display the parameters for the Get-Process cmdlet:
```ps1
Get-Process | Get-Member
```
#### If you still don’t find the cmdlet you need, you can make sure the help is current and then get examples for a cmdlet
```ps1
Update-Help #to update the help data
Get-Help Get-Process -Examples
```
#### Pipes
#### A pipe passes data from one cmdlet to another
#### For example, if you execute the following script, you’ll get all services sorted by their status:
```ps1
Get-Service | Sort-Object -property Status
# output dir to text
"ftft" | Out-File out.txt
```


## CMD
### Robocopy copy all
#### ROBOCOPY Source_folder Destination_folder [files_to_copy] [options]
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

REM net use: connect, remove and configure connections to shared resources like mapped drives
net use z: \\WM01\f$
robocopy z:\datacatalog e:\datacatalog /e /r:1 /w:5 /sec /secfix /timfix /maxage:182 /log:"F:\robo_log.log" /np
net use z: /del

REM and not map it to z
robocopy \\WM01\datacatalog e:\datacatalog /e /r:1 /w:5 /sec /secfix /timfix /maxage:182 /log:"F:\robo_log.log" /np
```

### Robocopy (just file structure)
``` CMD
REM /XF file [file]... : eXclude Files matching given names/paths/wildcards.
robocopy C:\tmp C:\temp2 /e /xf *
```
[Migrating Data to Microsoft Azure Files MT] [https://azure.microsoft.com/en-us/blog/migrating-data-to-microsoft-azure-files/]

#### MT
MT is the number of threads to use (see discussion below) When using robocopy, you should choose the “/mt” parameter to maximize throughput. This lets you control how many parallel threads do the copy, essentially controlling the queue depth of the IO requests to storage. A very low thread count does not queue enough requests on the server to let you take advantage of the inherent parallelism of our cloud architecture. A very high thread count risks server-side throttling, which end up reducing throughput. In our testing, we have found queue depths between 16 to 32 to be best for maximizing throughput. 

[robocopy-the-ultimate] [https://adamtheautomator.com/robocopy-the-ultimate/]

Note that if you do use /MT, you won’t be able to use /IPG or /EFSRAW. For better performance, don’t output the log to the console. Instead, use /LOG.

Robocopy does not copy open files. Any process may open files for exclusive read access by withholding the FILE_SHARE_READ flag during opening. Even Robocopy's Backup mode will not touch those files.




## Linux

