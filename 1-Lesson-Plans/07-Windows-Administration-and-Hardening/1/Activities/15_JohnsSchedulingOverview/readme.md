# Task Scheduling

The Task Scheduler is a GUI tool that allows system administrators to automate the execution of scripts and applications on a Windows system. 

- These are similar to cron jobs in Linux. They can be set to execute at specific times or a certain amount of time after a user logs in. 

- It is important to properly manage systems with scheduled tasks to automate security and system administration actions such as checking for updates for endpoint security software, sending important logs to systems such as SIEM (Security Information and Event Management), and scheduling system maintenance scripts.

## Task Scheduling

Use the user, `azadmin`, to create a newly scheduled task.

- Click on the Windows search in the taskbar and search for "Task".

- Choose **Task Scheduler** from the list.

- Create a new task by selecting **Create Task...** on the **Actions** pane.

  - Note: If you don't see the Actions pane on the right, go to **View** > **Customize** and make sure Action Pane is enabled.

## Setting the Task Trigger

- In the Create Task GUI window, navigate to the **Triggers** tab, and click **New...**.

- Set **Begin the task** to **On a schedule**.

- Make sure our task is set to repeat daily with **Recur every:[x] day** set to **1**, and the start date set to today. (It should already be set, but you may have to input it manually).

- Finally, set the time to be a minute or two after the current time.

- Select **OK** to save your changes and return to the Create Task window.
