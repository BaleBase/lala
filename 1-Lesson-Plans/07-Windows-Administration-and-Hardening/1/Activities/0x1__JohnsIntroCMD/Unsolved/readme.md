# Introduction to Command Prompt

## CMD Commands

Some commands are similar to Bash's, while some are completely different.

Launch CMD by going to the bottom-left Windows icon and typing "CMD". Right-click **Command Prompt** and select **Run as administrator**.

Try these basic navigation commands.

- Run `cd /?`.  What is the output?

- Run `cd`.  What Bash command is similar?
    
- Run `cd c:\Users\azadmin`.  What Bash command is similar?

- Run `cd ..`.  What Bash concept is similar?

- Run `dir`.  What Bash command is similar?

- Run `cd %USERPROFILE%\Desktop` to navigate to the Desktop directory.  What does %USERPROFILE% expand to?  What is it similar to in Bash?

Like in Bash, Windows has many default environment variables.

- Run `set` to display the current envvars.

Examples of default Windows environment variables:

| Environment Variable | Default Value          |
| :------------------- | :--------------------- |
| `%CD%`                 | Current directory      |
| `%DATE%`               | Current date       |
| `%OS%`                 | Windows                |
|` %ProgramFiles%`     | `C:\Program Files`       |
| `%ProgramFiles(x86)%`  | `C:\Program Files (x86)` |
| `%TIME`                | Current time       |
| `%USERPROFILE%`        | `C:\Users\{username}`    |
|` %SYSTEMDRIVE%`        | `C:\`                    |
| `%SYSTEMROOT%`         | `C:\Windows`             |

- Run `md temp` then `dir`.  What did the `md` command do?

- Run `notepad testfile.txt`.  Click on the "Yes" button.  Type 'This is a test.' in the editor, close and save.  Run `dir`.  What happened?

- Run `notepad testfile.txt` again.  What is in the file?  What capability does this sequence demonstrate?

- Run `move testfile.txt temp` then `dir` and then `dir temp`.  What did the `md` command do?  What Bash command is similar?

- Run `copy temp\testfile.txt .`.  Run `dir` and then `dir temp`.  What did the `copy` command do?  What Bash command is similar?

- Run `rd temp` then `dir`.  What did the `rd` command do?  What Bash command is similar?

- Run `del temp` and then answer `No`.  What did the `del` command do?  What Bash command is similar?

- Run `del temp\testfile.txt` and then `rd temp`.  Run `dir`.  What did these commands do?

- Run `notepad testfile.txt` again.  Add the following lines and save the file.
```
This
is
a
test.
```

- Run `find "is" testfile.txt`.  What did the `find` command do?  What Bash command is similar?

- Run `echo this is a test.` then `dir`.  What did the `echo` command do?  What Bash command is similar?

- Run `type testfile.txt`.  What did the `type` command do?  What Bash command is similar?

- Run `cls`.  What did the `cls` command do?  What Bash command is similar?

- Run `exit`.  What did the `exit` command do?  What Bash command is similar?

## CMD Parameters and Help

Note that CMD uses what are known as "parameters" which can be considered to be the equivalent of "arguments" from our Bash lessons. The terminology "options" or "switches" may also be used to specify parameters with specific functionality. 

Know that the terminology you use isn't as important as understanding the function of a parameter. To find out more about a command, you can use `help <command>`.

- Open a new CMD session, run `help del` and note the entries.

```
Deletes one or more files.

DEL [/P] [/F] [/S] [/Q] [/A[[:]attributes]] names
ERASE [/P] [/F] [/S] [/Q] [/A[[:]attributes]] names

  names         Specifies a list of one or more files or directories.
                Wildcards may be used to delete multiple files. If a
                directory is specified, all files within the directory
                will be deleted.

  /P            Prompts for confirmation before deleting each file.
  /F            Force deleting of read-only files.
  /S            Delete specified files from all subdirectories.
  /Q            Quiet mode, do not ask if ok to delete on global wildcard
  /A            Selects files to delete based on attributes
  attributes    R  Read-only files            S  System files
                H  Hidden files               A  Files ready for archiving
                I  Not content indexed Files  L  Reparse Points
                O  Offline files              -  Prefix meaning not

If Command Extensions are enabled DEL and ERASE change as follows:

The display semantics of the /S switch are reversed in that it shows
you only the files that are deleted, not the ones it could not find.
```

We can see here that the `/f` parameter "force" will cause `del` to delete a read-only file when used.

Explain that documentation can also be found by  entering "cmd <command name>" into your search engine. 

  - For example, the first result for "cmd del" is [Microsoft's official online documentation for `del`]([https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/del](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/del))

- Using what you've learned, clean up the Desktop of the remains of anything you made.

## Use CMD to Create Todo List Demo

Let's try a few of these commands by using CMD to create a todo list. We'll do this by outputting and appending printed console output to a text file. To start, have everyone run the following:

- Navigate to the Desktop directory.

- `mkdir Audit` to create an `Audit` subdirectory.

- `cd Audit` or `chdir Audit` to enter that subdirectory.

We can use `echo` with `>` in Windows to output console text to a file.  Does this combination seem familiar?

  - Run `echo hello > todo.txt` to create a new file called `todo.txt`.

  - Run `dir` to display the directory's contents, to confirm that the file exists.

  - Run `type todo.txt` to show the contents of `todo.txt`, which is `hello`. 

If we use `echo` with `>` again, it will overwrite the file's contents.

  - Run `echo Review Task > todo.txt` to overwrite the contents of `todo.txt`.

  - Run `type todo.txt` again to show that the contents of `todo.txt` are now `Review Task`.

We can use `>>` instead of `>` to append contents to a file without overwriting anything.  Once again, does this capability seem familiar?

  - `echo 1. Check for CPU-Intensive Processes >> todo.txt` to append a todo task to our `todo.txt` list. 

  - Run `echo 2. Disable Unnecessary Startup Processes >> todo.txt` to append a second todo task to our todo list.

  - `type todo.txt` to show the new contents of the `todo.txt` file:

      ```
      1. Check for CPU-Intensive Processes
      2. Disable Unnecessary Startup Processes
      ```

Use `del` to delete files.  Confirm that the `todo.txt` file has been deleted and clear the screen.

As you get more proficient with the command line, you will be more prepared to execute and automate tasks in future systems and security-related roles.
