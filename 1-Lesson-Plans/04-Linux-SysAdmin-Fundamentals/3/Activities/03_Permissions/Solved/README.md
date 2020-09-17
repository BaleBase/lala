## Solution Guide: Permissions

During the last activity, we cleaned up the system's groups and users and removed all the malicious users. We also removed users from the `sudo` group and found and removed a rogue group.

Your senior administrator now wants you to secure a few important files and directories. Recall that during our scavenger hunt yesterday, we talked about the sensitive files on the system that contain all the users (`/etc/passwd`), the passwords (`/etc/shadow`), and the groups (`/etc/group`).

This activity will give you an opportunity to practice inspecting and setting file permissions on these sensitive files. Use the checklist provided by your senior administrator in the **Instructions** section for information on which files to inspect and modify permissions for.

You'll use the same lab environment you used in the previous exercises:
- Username: `sysadmin` 
- Password: `cybersecurity`

### Instructions

Your senior administrator has asked you to complete the following:

Start by inspecting the file permissions on each of the files listed, and determine if they are already set correctly or if you need to change the permissions.

** Hint: **
  - Run: `ls -l <file1> <file2> <file3>`

1.  Set permissions on `/etc/shadow` to allow only `root` read and write access.

    Set permissions `600` on `/etc/shadow` (`rw` for root only).

   - Running `ls -l /etc/shadow` shows the permissions are set to `640`. 

   - Run: `sudo chmod 600 /etc/shadow`

2.  Set permissions on `/etc/gshadow` to allow only `root` read and write access.

    Set permissions `600` on `/etc/gshadow` (`rw` for root only).

   - Running `ls -l /etc/gshadow` shows the permissions are set to `640`.

   - Run: `sudo chmod 600 /etc/gshadow`

3.  Set permissions on `/etc/group` to allow `root` read and write access, and all others read access only.

    Set permissions `644` on `/etc/group` (`rw` for root and `r` for all others).

   - Running `ls -l /etc/group` shows that the permissions are already set to `644`.

4.  Set permissions on `/etc/passwd` to allow `root` read and write access, and all others read access only.

    Set permissions `644` on` /etc/passwd` (`rw` for root and `r` for all others).

   - Running `ls -l /etc/passwd` shows that the permissions are already set to `644`.
  
**Bonus**

5. Verify all accounts have passwords.

   - Running `sudo grep root /etc/shadow` shows the root user doesn't have a password.

   - We want to verify that each account has a password hash and not a `!` in the second field of each listing in the `/etc/shadow` file. `!` indicates that there is no password set for that user.

   - Notice that if simply grep for '!', we can quickly determine if other users have no password, rather than manually inspecting the shadow file.
    `sudo grep "!" /etc/shadow`


6. Recall that if any user has the UID of `0`, the system thinks they are `root`. Verify that no users have UID of `0` besides `root`. If you find one that does, change its UID to any value greater than or equal to `1000`.

   Verify that no users have UID of `0` besides `root`. If you find one that does, change it's UID to any value greater than `1000`.

  - We are looking at the third field of each line in the `/etc/passwd` file. Only the root user should have a `0` in this field, and everything else should have a value greater than `1000` if it's a person, and less than `1000` if it's a service user.

  - Running `sudo less /etc/passwd` shows us that the user `adam` also has a UID of `0`.

  - Note: A cleaner but trickier solution is to run `grep "x:0" /etc/passwd`.  This requires first recognizing that the user id is preceded by "x:"

  - Run `sudo nano /etc/passwd` to change the UID from `0` to something greater than `1000`, and that is __not in use__ by another user!

7. Provide a list of all permission changes that you make in a text file in your research directory.

   - Run `nano ~/research/permissions.txt` to create a document to store your findings, including everything from above.

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.  
