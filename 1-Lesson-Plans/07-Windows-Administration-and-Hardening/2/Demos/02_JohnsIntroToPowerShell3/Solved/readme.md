# PowerShell Introduction (Part Three)

**Use the Azure Windows Host or your own Windows PC for this activity.**

## Working in PowerShell

In the following exercise, run each command and document the results for it.

1. Run `Set-Location $env:userprofile\desktop`.

    - The current directory was changed to the user's Desktop directory using the value in the `USERPROFILE` environment variable.

1. Run `New-Item pstemp -ItemType Directory`.

    - The directory `pstemp` was created.

    - https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/new-item?view=powershell-7

1. Run `Set-Location pstemp`.

    - The current directory was changed to the `pstemp` directory on the Desktop.

1. Run `New-Item 'testfile.txt'` and then `Get-ChildItem`.

    - A new empty file `testfile.txt` of zero bytes was created in the current directory.

1. Run `notepad testfile.txt'.

    - The file `testfile.txt` was opened in the "notepad" text editor.

1. Into the window that pops up, type `This is a test file.` and close saving the contents.
    
    - The words `This is a test file.` were entered into the blank notepad window.  The contents of the screen were then "saved" overwriting the `testfile.txt` file with the contents of the "notepad" window.

1. Run `Get-ChildItem`.

    - The directory listing shows the file `testfile.txt` now has a non-zero number of bytes.

1. Run `Get-Content 'testfile.txt'`.

    - The contents of the file `testfile.txt` was printed on the screen.

1. Run `Rename-Item 'testfile.txt' 'tempfile.txt'`.

    - The file `testfile.txt` was renamed `tempfile.txt`.

1. Run `Get-ChildItem`.

    - The directory listing shows the file `testfile.txt` is gone and `tempfile.txt` is now present.

1. Run `Get-Content 'tempfile.txt'`.

    - The contents of the file `tempfile.txt` was printed on the screen showing the same text as was in `testfile`.

1. Run `Set-Location ..`.

    - The current directory was changed to the containing or "parent" directory.

1. Run `Remove-Item 'pstemp'`.  Answer "Y" or hit <Enter> to accept the default answer which is "Yes."

    - The `pstemp` directory was removed.

- **Bonus** Can you do the previous steps using only commands to create the file `bonusfile.txt` containing the text `This is a bonus file.`?

    - The following two options can be used rather than running notepad.exe.

    - Either
        - `echo 'This is a test file.' > "bonusfile.txt"`
    - or
        - `"This is a bonus file." | Out-File bonusfile.txt`.
        - https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/out-file?view=powershell-5.1
  
- Run `Get-ChildItem C:\Windows | Where-Object {$_.name -like "*system*"}` and take a screenshot of the output. Describe what the command did.  **Don't worry if you don't understand the rest of the syntax for now.  It will be covered later.**

    - The pipe was used to retrieve only the objects with the `name` property containing the word "system".

    - In this example, PowerShell will return the contents of a directory as objects.

    - It will look through their `.name` properties for the word "system."

    - `$_` means previous object. In this case, the previous objects are all of the files and directories under `C:\Windows`. 

    - In summary, we are passing the objects of `ls C:\Windows` to the `Where-Object` command to be filtered down to names that contain "system."

    - **Note:** Results may vary slightly.

```
PS C:\Users\azadmin> ls C:\Windows | Where-Object {$_.name -like "*system*"}

    Directory: C:\Windows


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
d-----        3/19/2019   4:52 AM                System
d-----        1/30/2020   5:58 PM                System32
d-----        3/19/2019   6:22 AM                SystemApps
d-----         1/9/2020   9:22 PM                SystemResources
-a----        3/19/2019   4:49 AM            219 system.ini
```
