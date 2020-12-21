## 13.3 Lesson Plan: ELK Stack Project Week

### Overview

This week, students will set up a cloud monitoring system by configuring an ELK stack server. Students will be introduced to the project and then begin working on it.


### Week Objectives

Students will use the following skills and knowledge to complete the project:

- Deploying containers using Ansible and Docker.
- Deploying Filebeat using Ansible.
- Deploying the ELK stack on a server.
- Diagramming networks and creating a README.

### Instructor Notes

This is the last week of class before students begin to study security-specific material. Students have come a long way in the course, so be sure to acknowledge their hard work and the skills they've learned.

Instead of three separate lesson plans, this single lesson plan gives guidance for the entire week. It does not include specific times for individual portions of the week, but you should follow the day-by-day breakdown. If advanced students complete the work allotted for one day, they can move on to the next day's work.

While each student is expected to complete and submit projects individually, you can encourage students to work through problems together.

### Lab Environment

Students continue using their personal Azure accounts and build upon their existing Azure VMs. They will **not** be using their cyberxsecurity accounts.

### Additional Resources
- [Ansible Documentation](https://docs.ansible.com/ansible/latest/modules/modules_by_category.html)
- [`elk-docker` Documentation](https://elk-docker.readthedocs.io/#Elasticsearch-logstash-kibana-elk-docker-image-documentation)
- [Virtual Memory Documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html)
- ELK Server URL: http://your-IP:5601/app/kibana#/home?_g=()
- [Docker Commands Cheatsheet](https://phoenixnap.com/kb/list-of-docker-commands-cheat-sheet)

### Slideshow

The slideshow to this week is located on Google Drive here: [ELK Stack Project Week (13) Slides](https://docs.google.com/presentation/d/1b0jbp5L_ws2iCFuOSnU7BfoXb6oSiWccqmwXKk8yJ0w/edit#slide=id.g4789b2c72f_0_6)

---

|:warning: **CHECKPOINT** :warning:|
|:-:|
| Please use the checklist located [HERE](../12-Cloud-Security/Resources/Checklist.md) to verify that students are ready for the project week. |

#### Day 3

- Students work on their projects, continuing the Filebeat activities, draft a network diagram of their completed setup, and complete a README.

- Please distribute these additional but optional Kibana challenges
  - [Optional Kibana Activities](/Activities/Kibana-Optional)
    - [Linux Stress Optional Activity](Activities/Kibana-Optional/Linux-Stress/Unsolved)
    - [SSH Barrage Optional Activity](Activities/Kibana-Optional/SSH-Barage/Unsolved)
    - [Web Request Dos Optional Activity](Activities/Kibana-Optional/wget-DoS/Unsolved)

## Day 3: Exploration and Diagramming

### 01. Instructor Do: Overview

Explain that today's class will proceed as follows:

- Students who need more time installing Filebeat on their DVWA machines can continue this work.

- Students who have finished the Filebeat installation will move on to create their network diagrams and project READMEs.

Please send students the following file and review the high-level activity steps:
- [Day 3 Activity File: Network Diagramming and README](Activities/Stu_Day_3/Unsolved/ReadMe.md) (also included below)

Use the solution guide for your review:

- [Day 3 Solution Guide: Network Diagramming and README](Activities/Stu_Day_3/Solved/ReadMe.md)

### Activity File: Network Diagramming and README

Today's class is dedicated to completing the installation of Filebeat and finalizing your network diagram.

If you've already finished installing Filebeat, congratulations! The final steps are to:
1. Finalize the network diagram you began during the cloud security week.
2. Draft a README explaining what you've built.

### Instructions

#### 1. Diagramming the Network

Now that you've deployed your ELK instance, your virtual network is "stable." You won't be adding anything to it for awhile.

Since the network is essentially complete, it's time to document what you've built. This is an important last step for any deployment.

Use [Gliffy](https://www.gliffy.com) or [Draw.io](https://draw.io) to diagram your network. Make sure your diagram includes:

- **VNet**: Create a box thate contains the machines on your virtual network. Within your VNet, diagram the following:
  - Jump box and other VMs
  - Ansible control node
  - Specify which VM hosts the DVWA Containers
  - Specify which VM hosts ELK Stack Containers

- **Security group**: Create a box around your VNet to indicate the security group, and use a text field to specify the rules you have in place.

- **Access from the internet**: Add an icon representing the public internet and indicate how it connects to VMs in your VNet.

Use a text field to label each VM with the following information:
- Network (IP) address
- Operating system and version
- Installed containers
- Exposed ports
- Allowed IP addresses

#### 2. Completing the README

As you know, all technical projects come with some sort of documentation. One of the most common forms of documentation is the README file, which is a simple markdown file containing information about a project.

README formats vary across projects, but you can use this template to get started: [README.zip](Resources/README.zip).

- Download and unzip the template. Inside, you'll find a file called `README.md`, which contains the template. Much of the contents are provided, but you must fill in the "TODO" fields.

- You will also notice an `Images` folder. A few TODO items require you to place screenshots in your `README.md`. Place your screenshots in the `Images` folder, and update the `README.md` template with the appropriate file name.  

For homework, you will create a GitHub repository where you will save your project files and this README. Your repository will include
- Your network diagram.
- A description of the deployment.
- Tables specifying access policies and network addresses.
- Usage instructions.

This professional-level repository will prove that you have the knowledge and communication skills that hiring managers are looking for.

While it may feel less substantial than the project itself, one of the most important skills a cybersecurity professional can have is the ability to articulate what they know. The README is an important capstone to the project and will serve as a compelling portfolio item for prospective employers.


#### Bonus

If you finish early or want to make further refinements to your deployment on your own time, consider the following next steps:
- Refer to the [official Ansible documentation](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html) on roles. Then, rewrite your existing playbooks as roles.
- Create roles for the remaining Beats.

---

### Turn off Your Machine

After completing your diagram, finishing the README, and presenting your work, make sure to **turn off** your virtual machines.

- Navigate to portal.azure.com.
- Search for and select "Virtual machines."
- Select every VM in the list.
- Click **Stop**. This will ensure you're never charged for any of the machines you used in the project.

---

### Wrap-Up

At the end of this unit, congratulate the students for their hard work on the projects, and all the work they've done for the past 13 weeks.

Emphasize that students should make sure their projects are complete, professionally presentable, and free of errors. Remind them that they can use these resources as proof of knowledge and experience in the hiring process.

---

© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.  