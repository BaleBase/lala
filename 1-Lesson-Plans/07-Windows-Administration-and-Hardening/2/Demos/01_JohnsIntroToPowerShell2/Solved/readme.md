# PowerShell Introduction (Part Two)

**Use the Azure Windows Host or your own Windows PC for this activity.**

## Introduction to Parameters

Some cmdlets can accept `Parameters` to modify their action like `options` in Bash commands.  Previously, the `New-Item` cmdlet to create an object with the item-type of file. This is the default behavior of `New-Item` - to act like the Linux command `touch`.  If we want the item-type to be a directory, with a specific name and location (like the mkdir command), we can add a parameter to the `New-Item` cmdlet.

- Go to the current user's Desktop directory.

- Run `New-Item temp -ItemType Directory`.  What do you think this command did?
    
    - The parameter `-ItemType` modified the original function of `New-Item` by altering the object it will create, in this case creating the directory `temp` instead of a file called "temp."

    - Break down the syntax:

        - `New-Item` is similar to `Move-Item` in that it can create a file or, now, a directory.

        - `temp` is the name of the new directory to create.

        - `-ItemType` lastly, is the type of item we want to create. If we don't specify `"Directory"` it will default to file, like before.

- Run `Get-ChildItem`.  Does the output confirm your thought?

    - The output should show a new directory `temp`.

    - With the power of PowerShell parameters, we can achieve the effects of `touch` and `mkdir` commands with the `New-Item` cmdlet.

- Press the Up key or run `New-Item temp -ItemType Directory`.  What did the command do?  Why?

    - The command showed the error message: `New-Item : An item with the specified name <path> already exists.`

    - The directory already exists.

- Run `New-Item temp -ItemType Directory -Force`.  What did the command do?  Why?

    - It ran the directory creation command with no error.

    - The `-Force` suppressed the error message even though the directory already existed.

- Run `Get-Command -Name *Process`.  What does the command do?  What was the effect of using `-Name *Process`?

    - `*Process` is a wildcard parameter value that we're giving to the parameter `-Name`. This translates to: give me all the commands with the word "process" in them.

    - The output shows all commands with "process" in their name.

        ```
        CommandType     Name                                               Version    Source
        -----------     ----                                               -------    ------
        Function        Get-AppvVirtualProcess                             1.0.0.0    AppvClient
        Function        Start-AppvVirtualProcess                           1.0.0.0    AppvClient
        Cmdlet          Debug-Process                                      3.1.0.0    Microsoft.PowerShell.Management
        Cmdlet          Enter-PSHostProcess                                3.0.0.0    Microsoft.PowerShell.Core
        Cmdlet          Exit-PSHostProcess                                 3.0.0.0    Microsoft.PowerShell.Core
        Cmdlet          Get-Process                                        3.1.0.0    Microsoft.PowerShell.Management
        Cmdlet          Start-Process                                      3.1.0.0    Microsoft.PowerShell.Management
        Cmdlet          Stop-Process                                       3.1.0.0    Microsoft.PowerShell.Management
        Cmdlet          Wait-Process                                       3.1.0.0    Microsoft.PowerShell.Management
        ```

- Run `Start-Process -FilePath CMD -Verb RunAs`.  What is the name of the cmdlet?  What are the parameters?  What does each one do?

    - `Start-Process` is a cmdlet that starts a new process.

    - `-FilePath CMD` is a parameter that specifies the process to be started is a CMD shell.

    - `-Verb RunAs` is a parameter that specifies that the command is to be started as the `Administrator` giving the CMD shell administrator privileges.

- Run `Stop-Process -Name CMD`.  What is the name of the cmdlet?  What are the parameters?  What does each one do?

    - `Stop-Process` is a cmdlet that stops a process, similar to the `kill` command in Bash.

    - `-Name CMD` is a parameter that specifies that the process to be stopped is the CMD process.

## Introduction to Objects and Variables

- Run `Get-ChildItem C:\Windows\notepad.exe`.

    - While in Bash and CMD, everything used on the command line is a `string` that is just a sequence of characters, everything in PowerShell is an `object`, a `noun-verb` command that works on an object or a programming keyword such as `if` or `for`.  Therefore, each file and directory listed here is has been retrieved as an object due to the `Get` verb and the `ChildItem` noun.  Each object has its own properties, such as file size or file name for a file object.  For example: The file's name is a `property` of the file `object`.

- Run `$notepad = Get-ChildItem C:\Windows\notepad.exe`.

    - What did this command do?

        - Each `object` can be retrieved and assigned to a variable just as strings could in Bash or CMD.  In this case, it assigned the object returned by the `Get-ChildItem C:\Windows\notepad.exe` command to the variable `$notepad`.

- Run `$notepad`.

    - What did this command do?

        - By default, just typing a variable name without a preceding command will print information about the object pointed to by the variable or the variable's contents.

- Run `notepad` and `notepad.exe`.  Close after each time.

    - What did these commands do?

        - The commands opened the same "notepad" program which is a text editor.  Note that the variable's object contents are different than the executable "object."

- Run `$notepad.VersionInfo` and `$notepad.PSPath`.

    - Note the information that is printed each time.  What does that information mean?

        - The information printed is the version of the notepad.exe executable and the PowerShell path to it.

- Run `$notepad | Get-Member` and then `Get-ChildItem C:\Windows\notepad.exe | Get-Member`.  Note that the `pipe` functionality is similar to that in Bash **except** that what is being passed in PowerShell is an `object` versus a `string` in Bash.

    - What did this command do?

    - What is the difference between the two commands and what is represented by the three columns in the output?  What do the different `MemberType` entries mean?

        - https://docs.microsoft.com/en-us/dotnet/api/system.management.automation.psmembertypes?view=powershellsdk-7.0.0

- Run the necessary command to see the `Length` of the `notepad.exe` object.

    - What is the command?

        - `$notepad.Length`

    - Write the length down.

        - The $notepad.Length value may vary.

    - **Bonus** Can you do the same thing using only commands? Write the command down.

        - To get a property of an object that is NOT assigned to a variable, the object can be piped to the `Select-Object` command as shown below.
    
        - `Get-ChildItem C:\Windows\notepad.exe | Select-Object -Property Length`
    
        - `Get-ChildItem C:\Windows\notepad.exe | Select-Object Length` also works.  Running the `Get-Help Select-Object` command show under "SYNTAX" the use of the command.  The help shows that ALL arguments and parameters are OPTIONAL since they are all surrounded by `[]`.  However, of note is that the first one in `Select-Object [[-Property] <System.Object[]>]` is `[[-Property] <System.Object[]>]`.  Note the nested `[]` showing that `-Property` is optional even if the `<System.Object[]>` array is specified, "Length" in this case.

- Run `Get-ChildItem env:`

    - What does the output represent?

        - The output shows the Windows environment variables for this session.

        - https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-7

## Introduction to Aliases

PowerShell uses **aliases** to mimic Unix commands like `ls` and `cat`.

- Run `Get-Alias ls`.

    - What does the command show?

        - The output shows that the `ls` command is an alias for PowerShell cmdlet `Get-ChildItem`.

- Run `ls -la`.

    - What does the output show?

        - The output shows that these commands function differently than their Unix counterparts when it comes to options and arguments. For example, `ls` works but `ls -la` does not. 
