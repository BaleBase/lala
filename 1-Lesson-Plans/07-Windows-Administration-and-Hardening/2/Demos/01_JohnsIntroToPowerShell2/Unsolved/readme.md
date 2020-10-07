# PowerShell Introduction (Part Two)

**Use the Azure Windows Host for this activity.**

## Introduction to Parameters

Some cmdlets can accept `Parameters` to modify their action like `options` in Bash commands.  Previously, the `New-Item` cmdlet to create an object with the item-type of file. This is the default behavior of `New-Item` - to act like the Linux command `touch`.  If we want the item-type to be a directory, with a specific name and location (like the mkdir command), we can add a parameter to the `New-Item` cmdlet.

- Go to the current user's Desktop directory.

- Run `New-Item temp -ItemType Directory`.  What do you think this command did?
    
- Run `Get-ChildItem`.  Does the output confirm your thought?

- Press the Up key or run `New-Item temp -ItemType Directory`.  What did the command do?  Why?

- Run `New-Item temp -ItemType Directory -Force`.  What did the command do?  Why?

- Run `Get-Command -Name *Process`.  What does the command do?  What was the effect of using `-Name *Process`?

- Run `Start-Process -FilePath CMD -Verb RunAs`.  What is the name of the cmdlet?  What are the parameters?  What does each one do?

- Run `Stop-Process -Name CMD`.  What is the name of the cmdlet?  What are the parameters?  What does each one do?

## Introduction to Objects and Variables

- Run `Get-ChildItem C:\Windows\notepad.exe`.

    - While in Bash and CMD, everything used on the command line is a `string` that is just a sequence of characters, everything in PowerShell is an `object`, a `noun-verb` command that works on an object or a programming keyword such as `if` or `for`.  Therefore, each file and directory listed here is has been retrieved as an object due to the `Get` verb and the `ChildItem` noun.  Each object has its own properties, such as file size or file name for a file object.  For example: The file's name is a `property` of the file `object`.

- Run `$notepad = Get-ChildItem C:\Windows\notepad.exe`.

    - What did this command do?

- Run `$notepad`.

    - What did this command do?

- Run `notepad` and `notepad.exe`.  Close after each time.

    - What did these commands do?

- Run `$notepad.VersionInfo` and `$notepad.PSPath`.

    - Note the information that is printed each time.  What does that information mean?

- Run `$notepad | Get-Member` and then `Get-ChildItem C:\Windows\notepad.exe | Get-Member`.  Note that the `pipe` functionality is similar to that in Bash **except** that what is being passed in PowerShell is an `object` versus a `string` in Bash.

    - What did this command do?

    - What is the difference between the two commands and what is represented by the three columns in the output?  What do the different `MemberType` entries mean?

- Run the necessary command to see the `Length` of the `notepad.exe` object.

    - What is the command?

    - Write the length down.

    - **Bonus** Can you do the same thing using only commands? Write the command down.

- Run `Get-ChildItem env:`

    - What does the output represent?

## Introduction to Aliases

PowerShell uses **aliases** to mimic Unix commands like `ls` and `cat`.

- Run `Get-Alias ls`.

    - What does the command show?

- Run `ls -la`.

    - What does the output show?
