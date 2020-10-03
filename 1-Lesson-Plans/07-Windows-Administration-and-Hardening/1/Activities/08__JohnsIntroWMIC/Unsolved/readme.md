# Wmic Overview

Retrieve information about the current operating system, which we will later add to our report.
- Run `wmic /?`  Look at the various options and information.
  - If a message "WMIC is deprecated" is displayed, that is because its functionality is being moved to PowerShell, disregard it for now.

For the following commands, take screen shots of the output to compare against the Solved activity.

Use the `get /value` verb on the `os` alias as shown in the help:

- Run `wmic os get /value` to return:

Now retrieve brief information about the operating system (`caption`) and its build number. Call those properties with `get`:

- Run `wmic os get caption, buildnumber`  

- The output shows that we retrieved the `caption` and `buildnumber` properties of the operating system alias using the verb `get`.

**Note** the `caption` is the primary descriptive line of the alias we're retrieving information for.

The `buildnumber` that we're retrieving is the OS build number of Windows that we're running.

You can find the corresponding version of each build at Microsoft's site:

[Microsoft | Docs: Windows 10 release information](https://docs.microsoft.com/en-us/windows/release-information/)

  - On this page is a table, we can see versions for this build, `18362`. The version is `1903`. 

  - On the left side of the page, we can navigate to that version's "Known issues..." and "Resolved issues". 

  - Knowing the version information allows us to find further information about the operating system, for example, what vulnerabilities might exist for this version of the operating system or what issues currently exist that we might need to find solutions for.

Once we've verified the results are what we want, append them to a file:

- Run `wmic /APPEND:report.txt os get caption, buildnumber`

Verify the output using the `type` command:

- Run `type report.txt` to return:

- If the file's contents do not match what we want, simply use `del` command to delete the file and start again.

Document the following properties for each disk drive on the system with the `logicaldisk` alias:

- Each disk drive's name (or `caption`)
- Installed file system
- Amount of free space capacity
- Total drive capacity
- Volume serial number

Run `wmic logicaldisk get caption, filesystem, freespace, size, volumeserialnumber`

- The output is:

After verifying that the output looks good, add the `/APPEND` global switch:

- Run `wmic /APPEND:report.txt logicaldisk get caption, filesystem, freespace, size, volumeserialnumber`

- Run `type report.txt`

**Note*  we have both of the previous outputs in our report:


