# https://www.varonis.com/blog/how-to-use-powershell-objects-and-data-piping/

# Ps uses objects (structured data)
# Object.properties, aspect and details, size, name etc
# Object.method, actions to perform, tostring, getindex, count etc

# What’s the PowerShell Pipeline?
# 1 Make each program do one thing well. To do a new job, build afresh rather than complicated old ones
# 2 Expect the output of every program to become the input to another, as yet unknown, program
# Create lost of small scripts do to on a task
# Every time you go to put an if/else, flag og branch logic, SHOULD THIS BE A NEW SCRIPT?

# Example, do not make a script that download a file and parses it, make two
# 1 One for dowloading data -download.ps1
# 2 Second for parsing the data into something else -parse.ps

# To get the data from 1 to 2, pipe the data....


# https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.1
