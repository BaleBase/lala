# Task Manager Overview

## Get Familiar with Task Manager

For this activity, we'll get familiar with Task Manager and use it to identify resource bottlenecks and startup processes that are potential issues within our Windows machine.

- Right-click on the taskbar at the bottom of the Windows desktop and choose **Task Manager**. Expand this window as needed.

- With Task Manager launched, make sure you're on the Processes tab. 

All running processes on the computer can be seen in this Processes tab. 

- Each column header shows the resource utilization of each process: CPU, Memory, Disk, and Network. These can be sorted in ascending or descending order.

- Click on the **Memory** resource column header.  Note how the rows sort by the memory usage.

- Click the **Performance** tab.  Click on the various elements on the left hand pane and see how that element is reflected in the graph in the right hand pane.  **What kind of security related information could you get from seeing and watching the graph?**

This tab shows resource utilization visualized in charts. This information is useful for system administrators when there are extended periods of high resource usage.

One of the key functions of Task Manager is ending unwanted processes.  For example, suppose that we notice spikes in CPU usage. We would need to identify the errant process creating these spikes, and end it.  In our case, we have a process that may be considered a security risk.

## Using Task Manager to End Processes

This Windows machine has a process running we have identified to be a potential security risk: **TeamViewer**.

TeamViewer is a remote desktop application that is used similarly to RDP to connect to remote computers.

The following link provides information of past and recent critical vulnerabilities of TeamViewer:

  - [TeamViewer Flaw in Windows App Allows Password-Cracking](https://threatpost.com/teamviewer-fhigh-severity-flaw-windows-app/158204/) 

  - Briefly review the article to understand why we want to end the TeamViewer process with Task Manager.

Using Task Manager, do the following on the Processes tab:

  - Click the **Process** column header to show all the running processes.

  - Click the **Name** column header to sort all processes alphabetically.

  - Finally left click on **TeamViewer**.

Due to the security risk of having TeamViewer running, we want to end its process.

  - With TeamViewer process highlighted, click **End task**.

## Disabling Startup Processes

Now that we've seen how to stop a process, we'll take a look at how to disable processes from automatically starting up when our machine boots up.

We can do this by examining the list of startup process in the Task Manager's Startup tab.

- Using Task Manager, go to the **Startup** tab:

  - Each listing under the Startup tab is a process that boots up when the machine does.

- Select the **Spotify** startup process.

We don't want this process to start when booting up anymore.

- Click **Disable** and this setting will prevent the process from starting up when the Windows machine is booted.

While troubleshooting with Task Manager seems like a simple process, being able to manage running and startup processes is an important skill to have across all Windows platforms.  It can also be a vital element related to many security-related activities, such as incident response, digital forensics, and threat hunting.

Managing startup applications is important for system and security administrators for multiple reasons:	

- Startup applications can slow boot time due to their execution priority.  This effect can impact the availability of systems that need to be brought on-line quickly.

- These applications may use excessive resources while in the background, causing system slowdowns or preventing other more important applications from responding quickly (availability).

- Applications might use the network in the background. They can, for example, initiate their own automatic updates, hogging network bandwidth but also become a security risk by opening ports to listen to or performing an update that breaks an critical application.	

- Startup applications may require special permissions for their functionality. These can pose security risks if, for example, they are compromised through malware. Malware can then potentially run these rogue processes as administrators.
