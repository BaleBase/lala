# PowerShell Introduction (Part One)

## Basic Commands

A cheat sheet for PowerShell is available here:
[7.2 CheatSheet](../../../CheatSheet.md)

**Use the Azure Windows Host or your own Windows PC for this activity.**

Open PowerShell as a regular user.

- Run `Get-ChildItem`.

    - What did this command do?  What Bash command is it similar to?

        - The default behavior of `Get-ChildItem` is to display the contents of the current directory.  It is similar to Bash's `ls` command.

- Run `Set-Location`.

    - What did this command do?  What Bash command is it similar to?

        - The default behavior of `Set-Location` is to change to the "home" directory.  It is similar to Bash's `cd` command.

- Run `Get-ChildItem`.

    - What did this command do?  Is the output different from the first time?

        - The default behavior of `Get-ChildItem` is to display the contents of the current directory.

- Run `Set-Location C:\`.

    - What did this command do?  What Bash command is it similar to?

        - The command changed to the "C:\" directory.  Once again, it is similar to the Bash `cd` command.

- Run `Get-ChildItem C:\Windows`.

    - What did this command do?

        - A common use of `Get-ChildItem` is to display the contents of the specified directory.  In this case, it displayed the contents of the "C:\WINDOWS" directory.

- Run `Get-ChildItem C:\Windows\notepad.exe`.

    - What did this command do?

        - It displayed the listing for the notepad.exe file.

- Run `New-Item temp`.

    - What do you think this command did?  What Bash command is it similar to?

        - It created a file called `temp`.  It is similar to the Bash command `touch`.
    
        - Break down the syntax:

            - `New-Item` is the `verb` "New" and the `noun` "Item".  So, it's going to create a new item.  By default, the item it will create is a file.

            - `temp` is the name of the new file to create.

- Run `Get-ChildItem`.

    - Does the output confirm your thought?

        - The output should show a new file `temp`.

- Run `Remove-Item` temp.

    - What do you think this command did?  What Bash command is it similar to?

        - This command removed the item `temp` thus deleting it.  It is similar to the Bash command `rm`.

## Getting Help

- Run `Get-Help Get-ChildItem`.  Note the `Examples` option at the bottom.

    - What did this command do?

        - The PowerShell help system allows the user to get help on using PowerShell commands.  In this case, it displayed help on the `Get-ChildItem` command.

- Run `Get-Help Get-ChildItem -Examples`.

    - What did this command do?

        - It provided examples of using the `Get-ChildItem` command.
