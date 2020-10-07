# Net Demonstration Setup

Use the `net` tool to find information about user groups and password policies by doing the following tasks:

  - Enumerating users to see `net` output.

  - Enumerating `azadmin`'s groups and password policies.

  - Enumerating local groups with `net localgroup`.

  - Enumerating the Windows workstation's current password policies with `net accounts`.

Each time a command is run, capture the output with a screen shot to compare with the solution.

## Enumerate Users with net

Use the `net user` account to enumerate all the users on the system.

- Run `net user` and note the output:

  ```console
  User accounts for \\ML-RefVm-447521

  -------------------------------------------------------------------------------
  Alex                     azadmin                  DefaultAccount
  Guest                    WDAGUtilityAccount
  The command completed successfully.
  ```

## Find azadmin's Password Status

Next, we will look at specific password settings for the `azadmin` user.

- Run `net user azadmin` and point out the following in the output:

  - `Password last set`: When the password was last set. For the user `azadmin`, it was last set on `‎3/‎20/‎2020 10:10:41 PM`. 
    - **Note**: Your output may be different.

  - `Password expires`: The date that the current password for user will expire. For `azadmin`, there is no expiration.

  - `Password changeable`: The earliest date that the user can change their password again. For `azadmin`, the date is `‎‎3/‎20/‎2020 10:10:41 PM`. 
    - **Note**: Your output may be different.

  - `Password required`: The password policy that specifies whether or not the user needs a password. For this user, they _do_ need a password. 
    - **Note**: This is a given because `azadmin` is the primary local administrator account on this machine.

  ```console
  User name                    azadmin
  Full Name
  Comment                      Built-in account for administering the computer/domain
  User's comment
  Country/region code          000 (System Default)
  Account active               Yes
  Account expires              Never

  Password last set            ‎3/‎2/‎2020 10:10:41 PM
  Password expires             Never
  Password changeable          ‎3/‎2/‎2020 10:10:41 PM
  Password required            Yes
  User may change password     Yes

  Workstations allowed         All‎‎‎‎
  Logon script
  User profile
  Home directory
  Last logon                   ‎8/‎24/‎2020 3:55:08 PM

  Logon hours allowed          All

  Local Group Memberships      *Administrators
  Global Group memberships     *None
  The command completed successfully.
  ```

  - **Note**: Your output will look slightly different based on when your class started. 

We will be changing these password policies later.

## Find Groups on the Machine

Enumerate a list of groups on the Windows workstation. It's important to know how to enumerate groups on a system since groups are created, removed, and updated as often as users are. 

Groups of users can include administrators, non-privileged users, users sorted by departments, users from third-party contractors, etc.

- Run `net localgroup` and note the output (your hostname will be different):

  ```console
  Aliases for \\ML-RefVm-447521

  -------------------------------------------------------------------------------
  *Access Control Assistance Operators
  *Administrators
  *Backup Operators
  *Cryptographic Operators
  *Device Owners
  *Distributed COM Users
  *Event Log Readers
  *Guests
  *Hyper-V Administrators
  *IIS_IUSRS
  *Network Configuration Operators
  *Performance Log Users
  *Performance Monitor Users
  *Power Users
  *Remote Desktop Users
  *Remote Management Users
  *Replicator
  *System Managed Accounts Group
  *Users
  The command completed successfully.
  ```
  - **Note**: Your output will look slightly different. 

## Current Password Policy

Document the password policies that are currently set for the Windows workstation:

- Run `net accounts` and note the output:

  ```console
  Force user logoff how long after time expires?:       Never
  Minimum password age (days):                          0
  Maximum password age (days):                          42
  Minimum password length:                              0
  Length of password history maintained:                None
  Lockout threshold:                                    Never
  Lockout duration (minutes):                           30
  Lockout observation window (minutes):                 30
  Computer role:                                        WORKSTATION
  The command completed successfully.
  ```
  **Note**: Your output may look slightly different.

Enumerating information about users, groups, and password policies is important. This information helps an organization understand the current security policy posture on Windows workstations. 

For more information about `net` usage,  use the command `net help` or `net help <user/accounts/localgroup>` in CMD and check out the following URLs:

- [net user](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/cc771865(v=ws.11))

- [net localgroup](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/cc725622(v=ws.11))

- [net accounts](https://support.microsoft.com/en-us/help/556003#:~:text=The%20%E2%80%9CNet%20Accounts%E2%80%9D%20command%20is,only%20used%20on%20local%20computer.)

It is important for system administrators to be able to quickly and reliably pull this type of information from workstations to ensure they adhere to company policies.
