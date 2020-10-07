# Net User and Password Overview

- Create new administrator and regular users on this machine. 

- Set a password policy to ensure these users' passwords follow company-wide password policies.

  - In the previous activity, there wasn't a minimum password length set. Every organization should have a minimum password length policy. We'll look at how to do that with the `gpedit` tool.

We'll use the `net user` utility to create Windows user accounts for the next two new users: senior developer Andrea, and sales representative Barbara.

We are going to do the following:

- Create a regular user, `Barbara`.

- Create an administrator user, `Andrea`.

- Change user groups with `net localgroup`.

- Set workstation password policies with `gpedit`.

## Create a Regular User

Use the `net user` utility, adding a username after `net user`, and forward-slash-add (`/add`), so that our new command looks like: `net user [username] /add`.

- We can also specify a password for the user by typing a password after the username, with the following syntax: `net user [username] [password] /add`.

- To combine those steps and add a user named `Barbara` with the password `Coldcalls123!`, use: `net user Barbara Coldcalls123! /add`.

- Run `net user Barbara Coldcalls123! /add`.

  Now a regular user, `Barbara`, exists.

## Creating an Administrative User with Elevated Privileges

Create a new user account for the new Windows senior developer, Andrea, and add it to the `Administrators` group.

Start by running the same command for creating a new user. You will use the name Andrea instead of Barbara:

- Run `net user Andrea JavaMaster123! /add` and note the output.

- Note that you may see a message about Windows versions prior to Windows 2000 could not support passwords longer than 14 characters. Press `Y`.

  ```console
    The password entered is longer than 14 characters.  Computers
    with Windows prior to Windows 2000 will not be able to use
    this account. Do you want to continue this operation? (Y/N) [Y]: y
  ```

After creating the user `Andrea` we can use the `net localgroup` command-line utility to add `Andrea` to the `Administrators` local group. This will allow `Andrea` to manage the Windows workstation as a super user.

Add `Andrea` to the `administrators` group:

- Run `net localgroup Administrators Andrea /add` and then note the output:

Use the `net user` command, to check the user's account parameters:

- Run `net user Andrea` and notice the `*Administrators` group at bottom of the output.

A new user has been created and added to the `Administrators` local group.

## Setting the Windows Workstation's Password Policy

Define and enforce a strong password policy for this Windows computer.

Use the GUI tool `gpedit` to set password policies with the following parameters:

- Maximum password age to 60 days.

- Minimum password length to 8 characters.

- Password complexity requirements to be enabled.

To open `gpedit`, type "gpedit" in the Windows search bar and press Enter.

Under **Computer, Configuration**, navigate to **Windows Settings** > **Security Settings** > **Account Policies** > **Password Policy** and set the following:

- Set maximum password age to 60 days. 
  - While **Maximum password age** is highlighted, right-click it and click **Properties** to see the tabs for enabling and disabling the option. You can also go to the **Explain** tab to see best practices for password expiration policies.

- Set the minimum password length to eight characters.

- Double-click **Password must meet complexity requirements**, and set to **Enabled**. Select **Apply**, then click the **Explain** tab and read the output.


