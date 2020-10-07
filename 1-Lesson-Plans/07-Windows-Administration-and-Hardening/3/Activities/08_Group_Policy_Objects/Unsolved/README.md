## Activity File: Creating Group Policy with Group Policy Objects

In this activity, you will continue your role as a Windows system administrator managing Active Directory for Good Corp, Inc.
 
- You need to create Group Policy Objects (GPOs) to enforce policies for users.

- You are tasked with creating a Group Policy Object for the `Sales` OU that will limit the options they have to Windows `Settings`. 

Make sure that you have the **Windows Server machine** launched before going forward.

Make sure you are using your nested **Windows Server machine** for this activity.

### Instructions

1. Create the GPO. Navigate to the `Group Policy Management` tool.

    - The `Group Policy Management` tool is similar to the `Active Directory Users and Computers` tool.

    - If you don't see the `Sales` OU, expand the folders under the `GOODCORP.NET` domain.

    - With the `Server Manager` open, click on `Tools` at the top-right.

    - Select the `Group Policy Management` tool.

2. Name the GPO `Limit Settings`.

    - In the `Group Policy Management` window, right-click `Group Policy Objects` under `GOODCORP.NET` and click `New`.

    - In the `New GPO` window, type in `Limit Settings` for the `Name:`.

    - Click `OK`.

    - The `Limit Settings` will show up under `Group Policy Objects` now.


3. Right-click the GPO to `Edit...` its policies.

    - Find the policy you need under `User Configuration` > `Policies` > `Administrative Templates` > `Control Panel`. The policy you're looking for is called `Settings Page Visibility`. This policy is **not** in a subfolder in `Control Panel`.

    - Set the policy to `Enabled`. 

    - Under `Settings Page Visibility:` enter `showonly:about;themes`.

    - Apply and accept these changes. 

    - Close the `Group Policy Management Editor` window.

4. After you have enabled the policy, link the GPO to the `Sales` OU.

    - Right-click the `Sales` OU, select `Link an Existing GPO...`.

    - In the `Select GPO` window, select the `Limit Settings` GPO we just made and click `OK`.

5. Add the Sales group to the Remote Desktop Users group like shown earlier, if you haven't already.

    - Open the `Active Directory Users and Computers` menu

    - Expand your `GC Users` Organizational Unit

    - Select the `Sales` sub-Organizational Unit. The `Sales` _group_ will appear in the right-hand pane.

    - Right-click that `Sales` group and select `Add to a group...`

    - Under the `Enter the object names to select` area, enter `Remote` and click `Check Names`.

    - Click the `Remote Desktop Users` and click `OK`.

    - Click `OK` again.

6. Look at the default `Windows Settings` and update with the new GPO settings.

    - Log into the **Windows 10 machine** as the local `sysadmin` account.

    - Take a quick moment to look at the default `Windows Settings`.
 
       - Click the `Start` menu. Then click the cogwheel icon to launch the `Settings` menu. 

       - You don't have to do anything here, but notice the different settings your `sysadmin` account has access to.

    - Open a PowerShell window and run `gpupdate` to pull the latest GPO updates.

        - You should see messages:
    ```
    Updating policy...

    Computer Policy update has completed successfully.
    User Policy update has completed successfully.
    ```

7. Test the Group Policy changes as `Bob`. Verify that Bob's account has limited access to `Windows Settings` by doing the following:

    - Toggle **Enhanced Session Mode** _OFF_ then log into the **Windows 10 machine** as `Bob` with password `Ilovesales!`.

    - Once you're back in the **Windows 10 machine**, click the `Windows` button in the bottom left and then click the `Settings` icon.

        - If you created the GPO properly, we should only see two entries there: `System` and `Personalization`. 

        - This indicates that the Group Policy Object was successfully applied. The standard `Windows Settings` screen has many more options.

    - Know that system administrators will often restrict access to various operating system settings to prevent users from making irreversible or potentially dangerous changes to their system. 

8.  Authenticate back to our local `sysadmin` account:

    - Log out of Bob's account by toggling **Enhanced Session Mode** _ON_ again.

    - Back at the Windows lock screen, click the screen and select `Other user`.

    - For the username, enter `.\sysadmin` and `cybersecurity` for the password. You'll notice that the `Sign in to:` selection at the bottom automatically changes when you type `.\`.

By toggling the session mode, you can use `GoodCorp.net\Bob` to sign into Bob's domain account, and `.\sysadmin` to sign into the local `sysadmin` account.

---
 © 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.

