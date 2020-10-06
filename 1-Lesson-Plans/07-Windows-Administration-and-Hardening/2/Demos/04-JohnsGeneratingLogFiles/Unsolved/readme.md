# PowerShell Introduction (Part One)

**Use the Azure Windows Host for this activity.**

## Generating Windows Event Log Files with Parameters and Pipelines

In this activity, we are going to chain cmdlets together to create a PowerShell pipeline that does the following:

- Retrieves Windows logs from Windows Events.

- Transforms the logs to the structured data format JSON.

- Outputs these files to the `C:\Logs` directory we made in the last activity.

- Run `Get-WinEvent`.

    - Note what you see.  If it keeps going, press Ctrl+C to stop the output.

    - How can you find out if there is a way to reduce the output?

- Run `clear` in console to clear the screen.

- Run `Get-WinEvent -ListLog *`.

    - What is the output?  What did the parameter do?

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

## Piping Logs to JavaScript Object Notation with ConvertTo-Json Demo

Now that we used parameters to get the logs we need, we will output them into a file in a format that can be used later by log analysis applications. This is where pipelines come in.

-  **JSON (JavaScript Object Notation)** structured data format can be easily read and manipulated by today's most common scripting and programming languages.  Windows logging systems understand JSON, so we will be converting our logs to this file format.

- Run `Get-WinEvent -LogName System -MaxEvents 10 | ConvertTo-Json`.

    - Compare the output to that of the previous command.

- Run `Get-WinEvent -LogName System -MaxEvents 10 | ConvertTo-Json | Out-File -FilePath C:\Logs\RecentSystemLogs.json`.

    - What was the output?  Can you explain it?

    - Verify that the log file was created and view the contents.

- Remove the log file to clean up and verify that it is gone.

    - Use the commands you know to complete this task.
