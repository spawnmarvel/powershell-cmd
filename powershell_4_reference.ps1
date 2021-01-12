# Powershell all in one 4.0

write-host "1 Useful commands"
# 1 Download/install newest help
# Update-Help
# 2 Display info about cmd and concepts
# Get-Help Get-Service
# 3
# Get-Help Get-Member -Examples
# $x = "string"
# $x | Get-Member # returns methods: Clone, Contains, Replace etc
# 4 Gets the module that is imported / or can be imported
# Get-Module

write-host "`n2 Operators"
$x = 2
Write-Host $x
$x +=10
Write-Host $x
$x -= 5
write-host $x
$x *=2
Write-Host $x
$x %=3 # 14 % 3
Write-Host $x
$x++
Write-Host $x
$x--
Write-Host $x
$y = $x -ge 10 # >=
Write-Host $y
$y = $x -le 10 # <=
Write-Host $y
$y = $x -gt 10 # >
Write-Host $y
$y = $x -lt 10 # <
Write-Host $y
$y = $x -eq 10 # equal
Write-Host $y
$y = $x -ne 10 # na equal
Write-Host $y
$name = "Espen"
$name -replace "en" # Esp
$name -match "en"
$name -match "sp"
$name -notmatch "Kim"
$name -in "sp"
$name -notin "Tim"
$splitt_string = "Test-Azure" -split "-"
$splitt_string
$join_string = "Test", "Azure", "Now" -join ";"
$join_string

1..10 | foreach{$_ +2}
42 -is [int]
$a = 42 -as [String]
Write-Host $a


Write-Host "`n4"

$ar = @(1,2,3,4)
$ar -contains 4


# itemsray
$items = @(99, 101)
Write-Host $items
Write-Host $items.Count
Write-Host $items.IsFixedSize
Write-Host $items.Contains(55)

foreach ($item in $items) {
    Write-Host $item
    Write-Host $item.ToString()
    if ($item -ge 100) {
    Write-Host $item + "is -ge"
        }
    else {
    Write-Host $item " is -le"
    }
}


