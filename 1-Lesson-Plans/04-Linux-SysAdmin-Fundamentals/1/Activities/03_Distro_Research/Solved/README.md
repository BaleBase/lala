##  Solutions File: Distribution Research

- Recently, your organization experienced a number of breaches involving servers running outdated Linux distributions.

- In response, the IT Department has decided to upgrade the affected servers, and chose you as the **system administrator** in charge of deciding which distribution to install on each machine.

- In this exercise, you will research the most common distributions of Linux and answer the following questions. Then you will use what you learn to determine which distribution is most appropriate for each machine on the network.

Be sure to ask your instructors and classmates for help if you get stuck.


### A. Resources and Research
Use the following links to answer the questions below:

- [Debian Linux](https://www.debian.org/intro/about)
- [Ubuntu Linux](https://www.ubuntu.com/download)
- [Kali Linux](https://www.kali.org/about-us/)
- [RedHat](https://www.redhat.com/en/technologies)
- [Fedora](https://getfedora.org/)
- [CentOS](https://www.centos.org/about/)
- [SELinux](https://selinuxproject.org/page/Main_Page)
- [Mint Breach](https://www.techrepublic.com/article/why-the-linux-mint-hack-is-an-indicator-of-a-larger-problem/)

### Questions and Answers

1. Which distribution is most flexible and best suited for day-to-day and administrative tasks?
    - **Solution**: Ubuntu

2. Which distribution is built specifically for penetration testers?
    - **Solution**: Kali

3. Which distributions would you use to set up a web or data server?
    - **Solution**: Really, you could use any of them, however, Ubuntu Server and Fedora Server both have easy to configure web services. If you wanted to do things more manually, you could use Debian or CentOS.

4. What is the most widely used Linux desktop environment?
    - **Solution**: Ubuntu
    

### B. Use Cases

Identify which distribution(s) is most appropriate for each situation. There may be more than one correct answer.

**Central Data Server**

- The Central Data Server stores all human resources data, including payroll information. Since its sole purpose is to send data to other machines, it won't have a monitor attached, and doesn't need a GUI.

**Public Web Server**

- The Public Web Server must handle a large number of requests every day. It also doesn't need a GUI. Since the Web Server is central to business operations, it needs to run very quickly.

**IT Audit Workstation**

- The IT Audit Workstation is used for periodic assessments of the security of the network.

**User Workstations**

- User Workstations need a GUI, and should include basic productivity software (such as LibreOffice, email clients, etc.)

### Bonus Questions & Answers

1. What is a "headless server"? Does Ubuntu make a headless server variant? What about Fedora? CentOS?
    - **Solution**: A command line-only server without a desktop environment, keyboard or mouse.  Yes, all three of them do.

2. What distribution is Ubuntu based on? What about Kali?
    - **Solution**: They are both based on Debian.

3. Which distribution is CentOS based on? What about Fedora?
    - **Solution**: They are both based on Red Hat.

4. What is SELinux? Which distributions implement SELinux by default?  
    - **Solution**: SELinux is a built-in file permissions security enhancement developed by the NSA. CentOS and Fedora have it implemented by default.

5. If you were deciding between versions of Ubuntu Server and wanted one that will remain stable over time, which version would you choose?
    - **Solution**: You would choose the "Long Term Support" or _LTS_ version. The latest version is one that will have continual updates and changes. The _LTS_ version will remain stable and only changes about once a year.

6. What are some security implications of using free and open source software or forks of popular Linux distributions?
    - **Solution**: As demonstrated in the Mint OS article, _open source_ means that anyone can contribute. This makes it somewhat easy for an attacker with programing skills to attack. Because of this users, must be vigilant about where they get their software.

-------


#### Summary

Note the following takeaways from this activity:

- Most Linux distributions are forks of Debian or Red Hat.

- Ubuntu is the most common general-purpose Linux distribution, while Kali is designed specifically for security professionals.

With these distros, you can accomplish most anything you need with Linux.


---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.

