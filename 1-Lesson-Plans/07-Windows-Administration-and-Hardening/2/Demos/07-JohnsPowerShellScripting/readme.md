# PowerShell Scripting

**Use the Azure Windows Host or your own Windows PC for this activity.**

## Scripting with PowerShell

Writing Bash scripts to automate and make repetitive tasks easier and less error prone was demonstrated in previous weeks.  PowerShell also allows administrators and users to write scripts for tasks on Windows.  While CMD does have some scripting capabilities, they don't provide the functionality that Bash or PowerShell do.

- PowerShell scripts:

    - allow system administrators and security professionals to automate and execute basic and advanced procedures and operations.

    - can do everything from setting basic firewall rules to standing up entire cloud virtual machine environments with networking, storage, and users.

    - allow us to script many commands in sequence and also perform programmatic logic using variables, conditionals and loops.

By default, PowerShell does not allow scripts to run. This is a security measure to prevent malware, attackers, and improperly constructed scripts from potentially compromising a system.  To enable these PowerShell exercises, these machines have already been configured to allow scripts to run.

- Use `nano` in GitBash on the Azure Windows Host to create or modify the PowerShell scripts.

- Run the scripts in a PowerShell window.

- Running the two windows side by side may make moving between them easier.

### Creating and Executing a PowerShell Script to Run a Humorous Script

- Change to the user's desktop directory in both the GitBash and PowerShell windows.

- Use `nano` to create a blank file named `script.ps1` in the current directory.  `.ps1` is the default extension indicating that a file is a PowerShell script similar to `.sh` for Bash scripts or `.bat` for CMD batch files.

    - Run the appropriate command in the GitBash terminal to edit the `example_script.ps1` file.

        -  `nano example_script.ps1`.

- Comment the lines as you enter them to explain what you think they are doing.

```
Set-StrictMode -Version 3.0
# Example of a simple variable
$thisstr = 'This is a string.'

# Example of a list or array
$thislist = 1, 2, 3, 4
$numlist = 5.6, 4.5, 3.3, 13.2, 4.0, 34.33, 34.0, 45.45, 99.993, 11123
$beerlist = 99..1

# Example of a `Hash Table` or `Dictionary`
$staffdata = @{
    "JOHN" = 'Instructor'
    "CARINA" = 'TA'
    "JEFF" = 'TA'
    "ANDREW" = 'TA'
    "BRENT" = 'TA'
}

Write-Host 'After each prompt, type the answer and press the <Enter> key.'
$yourname = Read-Host -Prompt 'Type a first and last name'
$nameup = Read-Host -Prompt 'Print the names in all upper case (Y/n)?'
if(($nameup).ToUpper() -like "N*") {
    Write-Host 'Your name as entered is:  ' $yourname
}
else {
    $yourname = $yourname.ToUpper()
    Write-Host 'Your name in all upper case is:  ' $yourname
}

$beer1 = " bottles of beer on the wall.  "
$beer2 = " bottles of beer....  Take one down, pass it around, "
$beer3 = " bottle of beer on the wall.  "
$beer4 = " bottle of beer....  Take one down, pass it around, "
foreach($beer in $beerlist) {
    if($beer -ne 99) {
	if($beer -eq 1) {
            Write-Host $beer $beer3
	}
	else {
            Write-Host $beer $beer1
	}
    }
    Write-Host
    Write-Host $yourname " sings:"
    if($beer -eq 1) {
      Write-Host $beer $beer3
      Write-Host $beer $beer4
    }
    else {
      Write-Host $beer $beer1
      Write-Host $beer $beer2
    }
}
Write-Host
Write-Host $yourname " sadly sings:"
Write-Host "No more" $beer1 "Time to go home."
```

- In the PowerShell window, navigate to the working directory and run the script.

    - Run `.\example_script.ps1`
