## Solution Guide: Users, Groups, and Password Policies

In this activity, we will return to the command line in order to gather more information for our `report.txt` file.

- Your CIO is curious about the groups and password policies on the Windows workstation. You will continue retrieving information from this Windows workstation using the `net` command-line utility. 

Continue using the nested Windows RDP Host machine. Before continuing with your activities, remember to `cd` to the created `reports` directory.

**Note:** Continue saving your working commands into a text file for reference. 

In this activity, you used the `net` tool to find information about user groups and password policies, and append them to your report.

### Instructions

Start by using `cd` to return to the `Desktop/reports` directory.

1. Enumerate users with `net user`.

    - Run `net user >> report.txt`

2. Find the user `Alex`'s password status using `net` and append the output to your report.

    - Run `net user Alex >> report.txt`

3. Enumerate local groups with `net localgroup` and append the output to the report.

    - Run `net localgroup >> report.txt`

4. Enumerate the current password policy using `net accounts` and append the output to your report.

    - Run `net accounts >> report.txt`

5. Check your updated report.

    - Run `type report.txt` to see the updated report.

----

© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
