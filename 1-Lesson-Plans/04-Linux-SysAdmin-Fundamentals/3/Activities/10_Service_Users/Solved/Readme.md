## Solution Guide: Service Users

In the previous activity, we stopped and removed a few old services from the system. In this activity, we remove those users from the system and add a new service user for `tripwire`.

- In this activity, you will continue auditing the same server for your senior administrator.

- The senior administrator would like you to remove any old service users from the system and create a new user that will be dedicated to running the Tripwire program.

- To complete this activity, you will use the `adduser` and `deluser` commands with the correct flags to clean up the system and create this new Tripwire user. 

    - Tripwire can only be run as `root`, so you will also need to add a line to the `sudoers` file to allow this.

To complete this activity, we need to:

- Use the `deluser` command to remove lingering service users.

- Use the `adduser` command with the correct flags to create a new `tripwire` user.

- Edit the `sudoers` file to allow the `tripwire` user to run `tripwire` with `sudo`.

- Change the `tripwire` permissions to only allow the owner of `tripwire` to run the service.

**Note:** These steps are not always needed, as most services create their own user when the package is installed.

### Solution

**Note: The bonus solution is included.**

1. To clean up our system and to prevent any unwanted abuse of remnant service users, remove the following service users associated with the services that you removed in the previous activity:

    - Service users for the `vsftpd` service

    - **Note**: If you are stuck on where to find these service users, you can search through `/etc/passwd` for clues.

   The first step is to remove any service users associated with the following services: `ftp` and `dovecot`:
 
    - We can quickly find these users with `grep "ftp\|dove" /etc/passwd`

    - To remove the service users, run `sudo deluser --remove-all-files <username>` for each user. 

        - For example, `sudo deluser --remove-all-files dovecot`

2. Create a `tripwire` user that will be dedicated to running Tripwire.

    - Verify that this user is a service user.

    - Verify that this user does not have a home folder.

    - Verify that this user is locked without a password.

    - Verify that this user does not have a login shell.

   We will create a `tripwire` user that will be dedicated to running Tripwire:

    - Run `sudo adduser --system --no-create-home tripwire`

    - Run `id tripwire` and verify that the `UID` is less than 1000.

    - Run `ls /home` to verify there is no `tripwire` home folder.

    Remember, we can see password entries in the `/etc/shadow` file.

     - Run `sudo tail /etc/shadow`

    The `*` in the password field for the Tripwire user means the user is locked without a password.

     - Run `sudo tail /etc/passwd`

    Note that `usr/sbin/nologin` is at the end of the Tripwire line.

3. Add a line to the `sudoers` file to allow this user to run only `tripwire` using `sudo` privileges.

   We will add a line to the `sudoers` file in order to allow this user to run only `tripwire` using `sudo` privileges.

    - Run `sudo visudo`

    - Add `tripwire ALL= NOPASSWD: /usr/sbin/tripwire` to the user section of the file and save it.

    - The section should read:

        ```bash
        # User privilege specification
        root ALL=(ALL:ALL) ALL
        tripwire ALL= NOPASSWD: /usr/sbin/tripwire
        ```

4. Change the permission of the `tripwire` program to only allow the `owner` to execute.

   We will change the permission of the `tripwire` program to only allow the `owner` to execute it.

    - Run `which tripwire` to locate the `tripwire` package.

    - Run `sudo chmod 700 /usr/sbin/tripwire`

    - Run `ls -l /usr/sbin/tripwire` to verify.

**Bonus**:

5. Remove the following service users associated with the services that you removed in the previous bonus activity:

   - Service users for any `dovecot`-related services.
        - For example, `sudo deluser --remove-all-files dovecot`

---

© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
