# PowerShell Introduction (Part One)

**Use the Azure Windows Host or your own Windows PC for this activity.**

## Generating Windows Event Log Files with Parameters and Pipelines

In this activity, we are going to chain cmdlets together to create a PowerShell pipeline that does the following:

- Retrieves Windows logs from Windows Events.

- Transforms the logs to the structured data format JSON.

- Outputs these files to the `C:\Logs` directory we made in the last activity.

- Run `Get-WinEvent`.

    - Note what you see.  If it keeps going, press Ctrl+C to stop the output.

        - The output should show the huge amount of scrolling, invalid logs. This output could take days to finish (or error out).

        -  Windows Event logs are recorded instances and information of events that occur in Windows, such as date and time of event, criticality of event, what happened during the event (e.g., a service started), etc.

    - How can you find out if there is a way to reduce the output?

        - `Get-Help Get-WinEvent`.

        - For example, adding `-LogName` followed by the name of a log, such as `System`, will only show us the system logs. So let's clear our screen and try again.

- Run `clear` in console to clear the screen.

- Run `Get-WinEvent -ListLog *`.

    - What is the output?  What did the parameter do?

        - Remind students that the asterisk `*` is a wildcard indicating everything after the `-ListLog` parameter, so it will return every log that we can retrieve with `Get-WinEvent`. 

        -  As you can see from the output, the command displays a much more concise and approachable output of log categories, rather an enormous list of  every single log. 

- Scroll up and look for the `System` logs under the `LogName` column (it should be in the first few results):

      ```PowerShell
      LogMode   MaximumSizeInBytes RecordCount LogName
      -------   ------------------ ----------- -------
      Circular            15728640        4513 Windows PowerShell
      Circular             1052672           0 Windows Azure
      Circular            20971520       12661 System
      Circular            20971520       27813 Security
      ...
      ```

      - **Note:** Results may vary.

    - For more information about LogMode Circular Logging:

      - [Whatis.com: Circular Logging](https://whatis.techtarget.com/definition/circular-logging#:~:text=Circular%20logging%20is%20a%20method,limit%20on%20the%20hard%20disk)

- Run `Get-WinEvent -LogName System` to return system logs.  This will produce a lot of results. Enter Ctrl+C to stop the output.

- Run `Get-WinEvent -LogName System -MaxEvents 10`.

    - What did this command do compared to the previous one?

        - Since there are thousands of logs and PowerShell will attempt to retrieve all of them, the first command would list them all.

        - By adding the `-MaxEvents` parameter and the value `10`, we should now see only up to 10 logs.

## Piping Logs to JavaScript Object Notation with ConvertTo-Json Demo

Now that we used parameters to get the logs we need, we will output them into a file in a format that can be used later by log analysis applications. This is where pipelines come in.

-  **JSON (JavaScript Object Notation)** structured data format can be easily read and manipulated by today's most common scripting and programming languages.  Windows logging systems understand JSON, so we will be converting our logs to this file format.

- Run `Get-WinEvent -LogName System -MaxEvents 10 | ConvertTo-Json`.

    - Compare the output to that of the previous command.

        - The output of `Get-WinEvent` is now in a JSON format.

        - Note the slightly less reader-friendly, but highly structured JSON logs: 

        - **Note:** Output may vary.

      ```
      PS C:\Users\azadmin> Get-WinEvent -LogName System -MaxEvents 10 | ConvertTo-Json
          {
              "Id":  13,
              "Version":  0,
              "Qualifiers":  null,
              "Level":  4,
              "Task":  1003,
              "Opcode":  0,
              "Keywords":  -9223372036854775808,
              "RecordId":  2555,
              "ProviderName":  "Microsoft-Windows-Hyper-V-Netvsc",
              "ProviderId":  "152fbe4b-c7ad-4f68-bada-a4fcc1464f6c",
              "LogName":  "System",
              "ProcessId":  3360,
              "ThreadId":  9036,
              "MachineName":  "DESKTOP-U3FCUKI",
              "UserId":  null,
              "TimeCreated":  "\/Date(1595374458918)\/",
              "ActivityId":  null,
              "RelatedActivityId":  null,
              "ContainerLog":  "System",
              "MatchedQueryIds":  [
                                  ],
              "Bookmark":  {
                          },
              "LevelDisplayName":  "Information",
              "OpcodeDisplayName":  "Info",
              "TaskDisplayName":  null,
              "KeywordsDisplayNames":  [
                                      ],
              "Properties":  [
                                "System.Diagnostics.Eventing.Reader.EventProperty",
                                "System.Diagnostics.Eventing.Reader.EventProperty"
                            ],
              "Message":  "Miniport NIC \u0027Microsoft Hyper-V Network Adapter #3\u0027 disconnected"
          }
      ```

- Run `Get-WinEvent -LogName System -MaxEvents 10 | ConvertTo-Json | Out-File -FilePath C:\Logs\RecentSystemLogs.json`.

    - What was the output?  Can you explain it?

        - Our logs weren't being sent to a file yet, so we need a cmdlet that will redirect this output to a file.

        - PowerShell has a cmdlet called `Out-File` that uses the `-FilePath` parameter to designate the location for the output file. Let's name this file `RecentSystemLogs.json`.

    - Verify that the log file was created and view the contents.

        - Navigate to `C:\Logs` with `Set-Location C:\Logs`.

        - Run `Get-ChildItem` to confirm `RecentSystemLogs.json` exists in the current directory.

        - Run `Get-Content .\RecentSystemLogs.json` to confirm that we now have logs in the `C:\Logs` directory.

- Remove the log file to clean up and verify that it is gone.

    - Use the commands you know to complete this task.

        - `Remove-Item RecentSystemLogs.json`.

        - `Get-ChildItem C:\Logs` should show the file is gone.
