# POWERSHELL / CMD

#### Using the PowerShell ISE is the preferred way to work with the scripting language, because it provides syntax highlighting, auto-filling of commands and other automation features that simplify script development and testing.
## CMD
Uptime:
``` CMD
systeminfo | find "System Boot Time"
```
Copy:
``` CMD
REM /e copy subfolders including empty
REM /r:0  Number of retries (default:1000000)
REM /w:o wait time between retires
REM /sec copy files with SECurity
REM /secfix fix file SECurity on all files, even skipped files
REM /timfix fix file TIMes on all files, even skipped

REM Share\drive
net use z: \\WM01\f$
robocopy z:\datacatalog e:\datacatalog /e /r:0 /w:0 /sec /secfix /timfix
net use z: /del
```



