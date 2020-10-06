# PowerShell Introduction (Part Three)

**Use the Azure Windows Host for this activity.**

## Working in PowerShell

In the following exercise, run each command and document the results for it.

1. Run `Set-Location $env:userprofile\desktop`.

1. Run `New-Item pstemp -ItemType Directory`.

1. Run `Set-Location pstemp`.

1. Run `New-Item 'testfile.txt'` and then `Get-ChildItem`.

1. Run `notepad testfile.txt'.

1. Into the window that pops up, type `This is a test file.` and close saving the contents.
    
1. Run `Get-ChildItem`.

1. Run `Get-Content 'testfile.txt'`.

1. Run `Rename-Item 'testfile.txt' 'tempfile.txt'`.

1. Run `Get-ChildItem`.

1. Run `Get-Content 'tempfile.txt'`.

1. Run `Set-Location ..`.

1. Run `Remove-Item 'pstemp'`.  Answer "Y" or hit <Enter> to accept the default answer which is "Yes."

- **Bonus** Can you do the previous steps using only commands to create the file `bonusfile.txt` containing the text `This is a bonus file.`?

- Run `Get-ChildItem C:\Windows | Where-Object {$_.name -like "*system*"}` and take a screenshot of the output. Describe what the command did.  **Don't worry if you don't understand the rest of the syntax for now.  It will be covered later.**
