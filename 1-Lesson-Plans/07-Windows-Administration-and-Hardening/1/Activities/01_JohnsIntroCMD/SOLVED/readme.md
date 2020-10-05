# Introduction to Command Prompt

## CMD Commands

Some commands are similar to Bash's, while some are completely different.

Launch CMD by going to the bottom-left Windows icon and typing "CMD". Right-click **Command Prompt** and select **Run as administrator**.

Try these basic navigation commands.

- Run `cd /?`.  What is the output?

```
C:\>cd /?
Displays the name of or changes the current directory.

CHDIR [/D] [drive:][path]
CHDIR [..]
CD [/D] [drive:][path]
CD [..]

  ..   Specifies that you want to change to the parent directory.

Type CD drive: to display the current directory in the specified drive.
Type CD without parameters to display the current drive and directory.

Use the /D switch to change current drive in addition to changing current
directory for a drive.

If Command Extensions are enabled CHDIR changes as follows:

The current directory string is converted to use the same case as
the on disk names.  So CD C:\TEMP would actually set the current
directory to C:\Temp if that is the case on disk.

CHDIR command does not treat spaces as delimiters, so it is possible to
CD into a subdirectory name that contains a space without surrounding
the name with quotes.  For example:

    cd \winnt\profiles\username\programs\start menu

is the same as:

    cd "\winnt\profiles\username\programs\start menu"

which is what you would have to type if extensions were disabled.

C:\>
```

- Run `cd`.  What Bash command is similar?
    
    - `cd` by itself will function like `pwd` (print working directory) in Linux.

- Run `cd c:\Users\azadmin`.  What Bash command is similar?

    - `cd` changes directories. This works like Linux's `cd`.

- Run `cd ..`.  What Bash concept is similar?

    - `cd ..` changes to the parent directory. This works like Linux's `cd ..`.

- Run `dir`.  What Bash command is similar?

    - `dir` lists the contents of a directory. This works like Linux's `ls -l`.

- Run `cd %USERPROFILE%\Desktop` to navigate to the Desktop directory.  What does %USERPROFILE% expand to?  What is it similar to in Bash?

    - `%USERPROFILE%` is a variable assigned to the value of the current user's home directory, or in this case: `C:\Users\azadmin`. This is the same as `$HOME` in Linux.

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

  - `md` or `mkdir` creates directories.  In this case, the directory `temp` was created on the Desktop (C:\Users\azadmin\Desktop).

- Run `notepad testfile.txt`.  Click on the "Yes" button.  Type 'This is a test.' in the editor, close and save.  Run `dir`.  What happened?

  - `notepad` opened an empty file, allowed us to add text, and then saved it.

- Run `notepad testfile.txt` again.  What is in the file?  What capability does this sequence demonstrate?

  - `notepad` opened the same file and it had the same text we typed.  This demonstration showed that we can create a text file and save it using Windows notepad.

- Run `move testfile.txt temp` then `dir` and then `dir temp`.  What did the `md` command do?  What Bash command is similar?

  - `move` moves files from the source (2nd argument) to the destination (3rd argument). This works like Linux's `mv`.  In this case, the file `testfile.txt` was moved from the `Desktop` directory to the `Desktop\temp` directory.

- Run `copy temp\testfile.txt .`.  Run `dir` and then `dir temp`.  What did the `copy` command do?  What Bash command is similar?

  - `copy` copies files from the source (2nd argument) to the destination (3rd argument). This works like Linux's `cp`.  In this case, the file `temp\testfile.txt` was copied from the `Desktop\temp` directory to the `Desktop` directory.

- Run `rd temp` then `dir`.  What did the `rd` command do?  What Bash command is similar?

  - `rd` or `rmdir` removes a directory if it's empty. This works like Bash's `rmdir`.  In this case, it printed an error message because the directory was not empty.  Non-empty directories must be removed with the `/S` parameter: `rmdir /S` or `rd /S`.

- Run `del temp` and then answer `No`.  What did the `del` command do?  What Bash command is similar?

  - `del` or `erase` deletes files and directories.  Directories will prompt a user to confirm.  In this case, since `temp` is a directory, a message requesting confirmation to delete a directory was shown.

- Run `del temp\testfile.txt` and then `rd temp`.  Run `dir`.  What did these commands do?

  - These commands deleted the file `testfile.txt` and the `temp` directory.  Note that files and directories deleted with these commands do not go to the Recycle Bin, as they do when we delete files with a GUI. Deleted files cannot be restored. 

- Run `notepad testfile.txt` again.  Add the following lines and save the file.
```
This
is
a
test.
```

- Run `find "is" testfile.txt`.  What did the `find` command do?  What Bash command is similar?

  - The `find` command functions like `grep` in that it searches a file for specific criteria. In this case, `find "is" testfile.txt` searched the `testfile.txt` file for the string `is`.

    - In this example, the first argument or parameter `"is"` is the string to search for and the second argument/parameter is the path and filename.

    - Note that the search term within the first argument is case sensitive.

- Run `echo this is a test.` then `dir`.  What did the `echo` command do?  What Bash command is similar?

  - `echo` prints output to the screen like in Linux.

- Run `type testfile.txt`.  What did the `type` command do?  What Bash command is similar?

  - `type` followed by a file name shows the contents of a file. This is similar to `cat` in Linux.

- Run `cls`.  What did the `cls` command do?  What Bash command is similar?

  - `cls` clears the screen of the CMD prompt.  This is similar to `clear` in Bash.

- Run `exit`.  What did the `exit` command do?  What Bash command is similar?

  - `exit` closes CMD, like in most terminals in Bash.

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

  - `del todo.txt` to delete the `todo.txt` file. 

  - Confirm by running `dir` to show `todo.txt` has been deleted. 

  - Lastly, run `cls` to clear the terminal screen.

As you get more proficient with the command line, you will be more prepared to execute and automate tasks in future systems and security-related roles.
