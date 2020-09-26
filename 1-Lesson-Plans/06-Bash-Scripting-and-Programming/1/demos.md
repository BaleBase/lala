# 6.1 Lesson Plan: Advanced Bash

## Demo Chaining Commands Review <dchain>

Log into the lab environment with the username `sysadmin` and password `cybersecurity`. Open up the Terminal.

### Combining with `;`

***Explain that we can use a `;` to run a series of commands back to back.***

When using `;`, each command is running on its own. It is not sending its output to the next command. Therefore, each command can have its own arguments.

For example, rather than typing this:

```bash
mkdir dir
cd dir
touch file
ls -l
-rw-r--r-- 1 user user 0 Sep  4 15:33 file
```

Clean up:

```
cd ..
rm -r dir
```

We can use one command:

```
mkdir dir; cd dir; touch file; ls -l
-rw-r--r-- 1 user user 0 Sep  4 15:33 file
```

***Q:  "Can anyone think of how a string of commands separated by a `;` might have a problem?"***
> Answer: Explain that the `;` will run each command back to back, no matter the outcome of the commands. Therefore, using a `;` to chain commands together may not always give you the correct outcome.

Clean up:

```
cd ..
rm -r dir
```

```
mkdir dir; cd dor; touch file; ls -l
bash: cd: dor: No such file or directory
drwxr-xr-x 2 user user  4096 Sep  4 15:52 dir
-rw-r--r-- 1 user user     0 Sep  4 15:52 file
```

***Point out the error reported for `cd`.***
Point out that this command failed because you are trying to move into the directory `dor` which has not been created.

We still got a `file` and the `ls` command to run, but we did not get our desired output because we were not in directory `dor`.

### Combining with `&&`

***Q:  "So if a string of commands separated by the `;`  will run each command back to back, no matter the outcome of the commands, how do you think the `&&` would affect a chain of commands?"***

> Answer: Explain that the `&&` will run the next command _only_ if the preceding command was successful.
```
mkdir dir && cd dir && touch file && ls -l
```

If the command were written this way, `cd` would only run if `mkdir` were successful, `touch` would only run if `cd` were successful and `ls` would only run if `touch` were successful.

In the following command, the only commands that run are `mkdir dir` and `cd dor`. `cd dor` fails, so `touch` and `ls` are ignored.

```
mkdir dir && cd dor && touch file && ls -l
bash: cd: dor: No such file or directory
ls -l
drwxr-xr-x 2 user user  4096 Sep  4 15:52 dir
```

## Demo Creating Aliases <dalias>

Log into the lab environment with the username `sysadmin` and password `cybersecurity`. Open up the Terminal.

### Creating aliases

1. Explain that the syntax for creating an alias is as follows:

   - Type `alias lh='ls -lah'`

      - Break down the syntax:

         - `alias` indicates that we are creating an alias.
         - `lh` is our custom command we will use to store the command we want to run.
         - `ls -lah` is the command that will run when we use our alias `lh`.

   - Run `alias lh='ls -lah'`

   - Run `lh`

      Output should resemble:

      ```bash
      $ alias lh='ls -lah'
      $ lh
      total 52K
      drwxr-xr-x  6 user user 4.0K Sep  4 16:00 .
      drwxr-xr-x 28 user user 4.0K Aug 27 14:46 ..
      drwxr-xr-x  3 user user 4.0K Aug 28 12:51 1
      drwxr-xr-x  3 user user 4.0K Aug 28 12:52 2
      drwxr-xr-x  2 user user 4.0K Aug 27 14:46 3
      drwxr-xr-x  2 user user 4.0K Sep  4 16:00 dir

      ```

   - Now, anytime we use `lh`, it will run `ls -lah`. 


2. Naming an alias after a command that already exists will change the way that command behaves. Iit may even possibly stop the command from working. 

   - For example: if we wanted the `ls` command to _always_ default to `ls -l`, we could create an alias to override the `ls` command.

   - Run `alias ls='ls -l'`

   - Type `ls` to show that the behavior has changed.

      - We can see a list of all the aliases we currently have access to by simply typing `alias`.

   - Type `alias`

      Your output should be similar to:

      ```bash
      $ alias
      alias egrep='egrep --color=auto'
      alias fgrep='fgrep --color=auto'
      alias grep='grep --color=auto'
      alias ls='ls -l'
      alias ll='ls -alF'
      alias la='ls -A'
      alias l='ls -CF'
      alias lh='ls -lah'
      ```

   Explain that all the aliases listed are configured by default. We will discuss how to change them in a moment.

3. If we wanted to remove an alias, we can use the `unalias` command.

   - Type `unalias ls`

   - Type `alias`

   Your output should show that the `ls` alias has been removed.

   ```bash
   $ unalias ls
   $ alias
   alias egrep='egrep --color=auto'
   alias fgrep='fgrep --color=auto'
   alias grep='grep --color=auto'
   alias ll='ls -alF'
   alias la='ls -A'
   alias l='ls -CF'
   ```

   - Run `ls` to show that the expected output has returned.

4. Aliases created in this way only work for the session in which you have created them. So, once the terminal is closed and re-opened, the alias will be gone.

   - Close and reopen the terminal.

   - Run `lh`

   You should get:
   ```bash
   -bash: lh: command not found
   ```

### Keeping Aliases Across Sessions and Logins

Explain that if we want these commands to be available every time we login, we need to store them in a configuration file that loads every time we open a terminal.

- Point out that the terminal has several configuration files, but the best file to use is the `~/.bashrc` file.

- Run `cd` to move to your `/home/instructor/` directory.

- Run `ls -la` to show all your files.

   - Point out the `.bashrc` file.

      ```bash
      drwx------ 26 user user  4096 Sep  4 20:57 .
      drwxr-xr-x  3 root root  4096 Aug 27 14:03 ..
      -rw-------  1 user user  6779 Sep  4 21:48 .bash_history
      -rw-r--r--  1 user user   220 May 15  2017 .bash_logout
      -rw-r--r--  1 user user  3690 Aug 28 18:44 .bashrc
      -rw-r--r--  1 user user   675 May 15  2017 .profile
      ```

Explain that if we want the alias to remain across logins, all we need to do is open the `~/.bashrc` file and add them there.

**Important**: Point out that before we edit this file, we should make a copy of it, in case we make a mistake.

- Run `cp .bashrc .bashrc.bak`

   - The `.bashrc` file will already have many configurations inside it, the scope of which lies outside this course.
   - All of the existing configurations can be ignored and they can add their aliases to the bottom of the file or the section commented for aliases.

-  Run `nano .bashrc`

   - Scroll down and point out the section that already has some aliases defined. These are some of the aliases we saw earlier:

   ```
   # some more ls aliases
   alias ll='ls -alF'
   alias la='ls -A'
   alias l='ls -CF'
   ```

Explain that you can add aliases here or modify the ones that already exist. Alternatively, you can create your own alias section at the bottom of the file.

- Move to the bottom of the page and enter your alias along with a `# Custom Alias Section` comment:

   ```bash
   # Custom Alias Section
   alias la='ls -lah'
   ```

Save and close the file.

Point out that in order for the new setting to be loaded, we either have to reload the `~/.bashrc` file, _or_ we need to open a new terminal.

Explain that if we want to simply reload the file, we can use the `source` command.

- Run `source .bashrc` to demonstrate reloading `.bashrc.`.

- Run `la` to show that your alias is working.

Close and reopen the terminal.

- Run `la` to show that your alias is still working.

#### Adding an Alias to `.bashrc`

Finally, in keeping with today's theme of becoming more efficient in the command line, show students how to add an `alias` to their `.bashrc` with one command.

Explain that reloading the `.bashrc` can have its own alias, so we will create one for it now.

- Type `echo "alias rr='source ~/.bashrc'" >> ~/.bashrc && source ~/.bashrc`

   Break down the syntax:

   - `echo` sends what comes next directly to output.
   - `alias` is our alias declaration.
   - `rr` is our custom command that we use to reload the `.bashrc` file quickly.
   - `'source ~/.bashrc'` is our command that reloads `.bashrc` and will be tied to `rr`.
   - `>>` appends this to a file that we specify.
   - `~/.bashrc` is the file we want to add our alias to.
   - `&&` if the first command is completed successfully, run the command that comes next.
   - `source ~/.bashrc` reloads the `~/.bashrc` file to enable our new `rr` alias.

Point out that if we wanted to, we could just use `echo "alias rr='source ~/.bashrc'" >> ~/.bashrc` to add the alias, and then reload the `.bashrc` file using `source ~/.bashrc`, but here we are using `&&` to complete it with one command.

From now on, you can just type `rr` to reload the `~/.bashrc`.

Provide one more example of adding an alias this way:

- Suppose we want the `rm` command to always give you a warning before removing a file. According to man pages,  the `-i` flag does this. So, we want the `rm` command to always default to `rm -i`.

- Run `echo "alias rm='rm -i'" >> ~/.bashrc && rr`

  -  Break down the syntax:

      - `echo` sends what comes next directly to output.
      - `alias` is our alias declaration.
      - `rm` is the alias we are using for our new, modified `rm` command.
      - `'rm -i'` is our modified `rm` command that we want to use every time we type `rm`.
      - `>>` appends this to a file that we specify.
      - `~/.bashrc` is the file we want to add our alias to.
      - `&&` if the first command is completed successfully, run the command that comes next.
      - `rr` is the alias we created a moment ago for `source ~/.bashrc`.

- Run `tail -4 ~/.bashrc` to show the bottom of the file:

   ```bash
   $ tail -4 ~/.bashrc
   fi
   fi
   alias rr='source ~/.bashrc'
   alias rm='rm -i'
   ```

### Demo My First Bash Script <dbash>
#### Variable Demo

Log into the lab environment with the username `sysadmin` and password `cybersecurity` and open a terminal.

Let's make a variable for the `/etc/passwd` file path:

- Run `my_variable='/etc/passwd'`.

- Run `echo $my_variable`.

- Your output should look like:

   ```bash
   $ my_variable='/etc/passwd'
   $ echo $my_variable
   /etc/passwd
   ```
   - `my_variable` is the name of the variable you want to create.

   - `=` assigns your variable a value.

   - `'/etc/passwd'` is the value that your variable holds.

- Point out a few more syntax-related notes:

   - There must not be any spaces on either side of the `=` or you will get an error.

   - Quotations must be used for any strings that are stored in a variable, particularly if there are spaces between characters.

When calling on a variable, it must be preceded with a `$`.

- Run `num=5`.

- Run `echo $num`.

- Your output should be:

   ```bash
   $ num=5
   $ echo $num
   5
   ```

Pause for a moment and ask if there are any questions here.

#### Built-In Variables

Point out that bash has a number of built-in variables called **environment variables**. They are also known as **shell variables**.

 **Pause for a knowledge Check**

- :question: Pose the following question to the class: 

  - "What's the difference between a Bash environment variable and Bash local variable?" 

    > Answer: Environment variables are valid systemwide. Local variables are only valid within the current (bash) shell only.

They are always defined with all upper case letters. For example, `$PWD` is an environment variable that returns the `pwd` command.

- Run `echo $PWD`

- Your output should be:

   ```bash
   $ echo $PWD
   /home/sysadmin
   ```

Explain that these can be creatively used to generate useful output:

- Run `echo "My present working directory is $PWD."`

- Output:

   ```bash
   $ echo "My present working directory is $PWD."
   My present working directory is /home/sysadmin.
   ```


Run the following commands to demonstrate built-in variables:
- `echo "My name is $USER"`: Provides the user name of the current user.
- `echo "My home directory is $HOME"`: Provides the home folder of the current user.
- `echo "The name of my computer is $HOSTNAME"`: Provides the name of the computer.
- `echo "My type of computer is a $MACHTYPE"`: Provides the type of computer
- `echo "My user ID is $UID"`: Provides the `UID` of the current user.

**Note**: Avoid the `$PATH` variable for now. We will cover it in the next section.

Ask if any students have any questions about using or defining variables.

#### Command expansion

Now we will move onto command expansion. Remind the class of the the command we used at the started of the lesson:

- `file $(find / -iname *.txt 2>/dev/null) > ~/Desktop/text\ files ; tail ~/Desktop/text\ files`

Explain that **expansion** in bash refers to any time something on the command line expands or morphs into something else.

- In our command example, the `find` command between the `$()` runs before any other part of the command.

- This `find` command _expands_ into a list of items that it found. The rest of the commands are acting on that _list_, not acting on the `find` command itself.

Explain that bash syntax uses the `$()` for command expansion.
- You can put any number of commands chained together inside these brackets.
- Bash reads that chunk as whatever is returned from running the commands inside it.
- Then, the rest of the commands on the line run.

Explain that this is quite helpful when writing a script _if_ we want one command to run before another command. To do this we just surround that command with `$()`.

Point out that the `$` is similar to using it with a variable, but in this case we are receiving the output of the command.

For example, type `echo "The files in this directory are: $(ls)"` and beak down the syntax:

- `echo` sends what comes next to output.

- `"The files in this directory are: "` is sent directly to output and creates a headline.

- `$()` Run _this command before_ any other command on this line. In this case, it says "Run the command inside these brackets _before_ running the `echo` command."

- `ls` is the command that runs first.

Run `echo "The files in this directory are: $(ls)"`

Your output should be similar to:

   ```bash
   echo "The files in this directory are: $(ls)"
   The files in this directory are:file1
   file2
   file3
   file4
   ...
   ```

Point out the lack of line break before `file1`. We can fix this if we use a line break with `echo`.

- To use a line break, we need to use the `-e` flag with `echo` and then place the line break `\n` where we want it.

- Type `echo -e "The files in this directory are: \n$(ls)"`

Your output should be similar to:

```bash
$ echo -e "The files in this directory are: \n$(ls)"
The files in this directory are:
file1
file2
file3
file4
...
```

Ask if there are any questions about using `$()` to surround a command and cause it to run first or any questions about using line breaks with `echo`.

#### Variables in Scripts Demonstration

Now we will demonstrate how to use these concepts in a script.

Explain that bash script files often end in `.sh` to indicate they are a `shell script`. However, a script file will still run with any extension.

- As an aside, mention that Linux generally ignores file extensions. Instead, it looks at the contents of the file in order to determine how to use it. Therefore, you can create text files without any extension at all, but it is best practice to use the `.sh` file if you think other users may interact with your script.

Point out that in order to create a bash script, it is important to use a text editor that does not add any extra formatting to the file when you save it. Some common options that text editors use in the command line are `nano`, `vim` and `emacs`.

- In this class, we will stick with `nano` but students are encouraged to explore the other text editors if they are interested in choosing another editor.

Begin by creating an empty file:

- Type `nano my_script`

- Type: `echo "Hello World."`

Save and close the script.

Explain that if we tell bash what shell to use to execute this file, it can be interpreted as a script.

- Run `bash my_script`.

Your output should look like:

```bash
$ bash my_script
Hello World.
```

Explain that while this format works, it is customary to use the `.sh` file extension in order to easily identify a script.

- Run `mv my_script my_script.sh`.

Explain that in the interest of efficiency we can create a script file that will always run with `bash`, so we don't have to type `bash my_script.sh` every time we want to use it.

- To do this, at the top of the file, we add a line that starts with `#!` followed by the path of the shell we want the system to use.
- This line  tells the system what shell we want to interpret this file.
- `#!` is often referred to as '**Hash Bang**' or '**Shebang**'.

Before we use the hash bang, we need to know the path of the bash.

- Run `which bash` to get the path to bash.

   Your output should be:

   ```bash
   $ which bash
   /bin/bash
   ```


**Note**: Running `bash my_script.sh` is the same as `/bin/bash my_script.sh`. Bash automatically knows what you mean by `bash`. If students ask _how_ bash knows this path, explain that we will cover that in the next part of the class (the `$PATH` variable).

Now we can add the line at the top of the file.

- Run `nano my_script.sh`

- Above the `echo` line, add `#!/bin/bash`:

   ```bash
   #!/bin/bash
   echo "Hello World."
   ```

Break down the syntax:

- `#!` to indicate that what comes next is the shell we want to use to interpret this file.

- `/bin/bash` is the shell we want to use.

- `echo "Hello World."` is the first line in our script.

Save and close the file.

Explain that before we can run the script, we have to change its permissions to be an executable file.

- Run `ls -l my_script.sh`.

   Output should look like:

   ```
   -rw-r--r-- 1 user user 20 Sep  5 16:20 my_script.sh
   ```

Point out that the file is not executable, so it can't be run on its own.

- Run `chmod +x my_script.sh`.

- Run `ls -l my_script.sh`.

   Your output should look similar to:

   ```
   -rwxr-xr-x 1 user user 20 Sep  5 16:20 my_script.sh
   ```

Now, we can run the file on its own. The system will know to look inside the file for the `#!` line and interpret the file using the `/bin/bash` program.

Explain that in order to run the file at this time, we only need to tell the system that the file is located in our current directory.

- Type `./my_script.sh`

Explain that `./` is used to tell the system, "Execute the file that follows from _this_ directory."

- Run `./my_script.sh`

   Your output should be:

   ```bash
   $ ./my_script.sh
   Hello World.
   ```

Pause and ask the class if there are any questions about creating an executable bash script file.

Point out that in the event that a machine doesn't have the `bash` program located at `/bin/bash` or if it is using a different version of `bash` in another location, this script may fail.

If we want our script to move around to different machines, we can use the line: `#!/usr/bin/env bash`.

-  `/usr/bin/env` will find the version of a program that the system is configured to use. When we use it with `bash` we are saying, use the `bash` configured on this system to interpret this file.

- `/usr/bin/env bash` is important for students to understand, but for our purposes, using `/bin/bash` is just fine.

Ask if there are any questions about this.

#### Quick Script Demonstration

Now we will create a short script in order to demonstrate how scripting works.

- We will intentionally keep this script to a series of commands in a list.

Open the script:

- Run `nano my_script.sh`.

- Enter this script:

   ```bash
   #!/bin/bash
   name='Jake'
   echo "Hello $name."
   echo -e "\nThis is my script.\n"
   echo -e "The files in $PWD are: \n$(ls)"
   echo -e "\nCopying the passwd file to your current directory.\n"
   cp /etc/passwd $PWD
   echo -e "The files in $PWD are now: \n$(ls)"
   echo " "
   echo "Have a great day!"
   ```

Add or remove commands here as you see fit and then save and exit nano.

Next, run `./my_script.sh`

- Your output should be similar to:

   ```bash
   Hello Jake.

   This is my script.

   The files in /home/sysadmin are:
   file1
   file2
   file3
   ...

   Copying the passwd file to your current directory.

   The files in /home/sysadmin are now:
   file1
   file2
   file3
   passwd
   ...

   Have a great day!
   ```

 **Pause for a knowledge Check**

- :question: Pose the following question to the class: 

  - "If we plan to run our Bash scripts on another machine, what would our `shebang` line look like?" 

    > Answer: If we want our script to move around to different machines, we can use the line: `#!/usr/bin/env bash` at the top of our script.

### Demo PATH <dpath>

#### PATH Demonstration

Log into the lab environment with the username `sysadmin` and password `cybersecurity`.

- Open up a terminal and return to your home folder.

Explain that we know that every command we type is actually a program that runs. Those programs are stored in various directories like `/bin` and `/usr/bin`.

Ask the students the following questions:

- "When you type a command, how does bash know where that program is located?"  

- "If you were to make a copy of one of those programs and modify it, how would bash know whether to use your new copy, or the old one?

Reveal that bash makes this decision by looking at the `$PATH` variable.

- Run `echo $PATH` and show the output:

   ```bash
   $ echo $PATH
   /usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/snap/bin:/home/user/.local/bin
   ```

Explain that the sole purpose of this environment variable is to hold a list of directories.

- When you type a command, bash searches through this list for the program, in order from left to right.

- When bash finds the program, it uses it and stops searching.

To find our current path, we type `ls`. First, bash searches for the `ls` program in the `/usr/local/bin` directory. If it isn't there, it searches the `/usr/bin` directory and so on down the list.

- If the program is not found in any of the directories in the `$PATH` variable, bash will return 'Command Not Found.'

- Because bash searches these directories in order, if we have 2 versions of a program, bash will run the first one it finds.

- Since `$PATH` is just a variable, we can easily change it. We can add new directories for bash to search, or even remove directories we don't want bash to search.

- If we had a `scripts` directory full of custom scripts we wanted to use as commands, we only need to add that `scripts` directory to our `$PATH` and those scripts can then be run directly.

Demonstrate creating a `scripts` directory and adding it to your `$PATH`:

- Run `mkdir my_scripts`.

- Run `mv sys_info.sh my_scripts/`.

- Run `ls my_scripts`.

Your terminal should resemble:

```bash
$ mkdir my_scripts
$ mv sys_info.sh my_scripts/
$ ls my_scripts
sys_info.sh
```
Point out that now all we need to do is add our `my_scripts` directory to our `$PATH` so that bash will find it when it searches for commands.

Explain that if we want to assign a value to a variable in bash, we use the `VAR=VALUE` syntax.

In this case, to add a directory to our `$PATH`, we want to assign `PATH` to all of the directories it already has, _plus_ our new directory.

- Run `echo $PATH` again.

   ```bash
   $ echo $PATH
   /usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/snap/bin:/home/user/.local/bin
   ```

Copy the output with the right click.

- Type `PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/snap/bin:/home/user/.local/bin`

Add your `my_scripts` directory.

- Type `PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/snap/bin:/home/user/.local/bin:/home/sysadmin/my_scripts`

Explain that this will overwrite our `$PATH` variable with all of the directories it currently has, plus our new directory.

Point out that to make this easier, we can use the `$PATH` variable instead of copying its contents.

- Run `PATH=$PATH:/home/sysadmin/my_scripts`

- Run `echo $PATH`

You should see your appended path to the output:

```bash
$ echo $PATH
/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/snap/bin:/home/user/.local/bin:/home/sysadmin/my_scripts
```

Now run `sys_info.sh` directly:

```bash
$ sys_info.sh
```

Explain that if we wanted to make this a shorter command, we can shorten the length of the script name.

- Run `cd my_scripts`

- Run `mv sys_info.sh sys`

- Run `sys`

Ask if there are any questions about creating a custom command or editing the $PATH variable.

#### Saving PATH to our `.bashrc`.

Explain that just like creating aliases, variables are only good like this for the duration of our session. Once your window is closed your $PATH will return to its default.

Explain that the good news is that we can save the path `PATH=$PATH:/home/sysadmin/my_scripts` to our `.bashrc!`

- Type `echo "PATH=$PATH:/home/sysadmin/my_scripts" >> ~/.bashrc`.

Point out that this is exactly how we added aliases to our .bashrc previously.

- Run `nano .bashrc`

- Move to the bottom of the file and enter the new PATH variable.

   ```bash
   export PATH=$PATH:/home/sysadmin/my_scripts
   ```

Explain that here we want to use `export` to make this variable to _all_ processes across the system. If you don't use `export` your `$PATH` variable may not always work.

Save and quit `nano`.

- Run your alias for reloading the .bashrc file.

- Run `rr`

- Run `echo $PATH` to show your updated PATH.

Point out that creating custom scripts that you can use as custom commands like this is a valuable and useful skill to have at the command line. In the next activity, students will have a chance to do this on their own machine.

-------

© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
