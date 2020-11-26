## Activity File: Inspecting with Developer Tools

For this activity, you will continue in your role as a web app security engineer.

- You have been tasked with examining the request and response headers of one of your vendor's websites to assess their HTTP security.

- For this activity, you'll use Chrome Developer Tools to examine the initial request and response set from www.crowdstrike.com.

### Lab Setup

Before you get started with this activity, you'll need to make sure you have Google Chrome and a few other activity files installed. If your instructor has not walked you through running the setup script, please do the following:

- Run the following command in your VM and enter sysadmin's password when prompted: `wget tinyurl.com/14-1--setup-script && sudo chmod +x 14-1--setup-script && sudo ./14-1--setup-script`

    - After it's done running, feel free to delete the `14-1--setup-script` file.

### Instructions

1. Open Developer Tools by going to Chrome's settings, then **More Tools**, then **Developer Tools**.

    - Click on the **Network** tab so that your browser is ready to process HTTP requests and responses.

2. Go to www.crowdstrike.com.

    - In the **Name** column on the left-hand side of the Developer Tools console, scroll to the first response and select it. It should be named www.crowdstrike.com.

    Note that if you do not see this, you can use your personal computer's Chrome browser to inspect this site's responses.

3. Answer the following questions for each section:

    - Scroll to the bottom of the **Headers** tab to view the **Request Headers**.

        - Are there any noticeable security request headers that we've discussed? If so, what do they mean?

    - Scroll up to view the **Response Headers**.

        - What response headers do you recognize from today's class? What do they mean? 

        - Are there any notable security response headers that we've discussed? If so, what do they mean? 

## Solution Guide: Inspecting with Developer Tools

The goal of this activity was to get comfortable using your browser's native tools to examine HTTP requests and responses, and particularly security headers. For this specific task, you inspected request and response headers from www.crowdstrike.com.

---
1. Open Developer Tools by going to Chrome's settings, then **More Tools**, then **Developer Tools**.

    - Click on the **Network** tab so that your browser is ready to process HTTP requests and responses.

2. Go to www.crowdstrike.com.

    - In the **Name** column on the left-hand side of the Developer Tools console, scroll to the first response and select it. It should be named www.crowdstrike.com.

    Note that if you do not see this, you can use your personal computer's Chrome browser to inspect this site's responses.

3. Answer the following questions for each section:

### Request Headers

    - Scroll to the bottom of the **Headers** tab to view the **Request Headers**.

        - Are there any noticeable security request headers that we've discussed? If so, what do they mean?

    - Solution: The **Upgrade-insecure-requests** header, which is the browser's way of requesting that the HTTP server use HTTPS to communicate with it.


    - Scroll up to view the **Response Headers**.

        - What response headers do you recognize from today's class? What do they mean? 

        - Are there any notable security response headers that we've discussed? If so, what do they mean? 

### Response Headers

    - Scroll up to view the **Response Headers**.

        - What response headers do you recognize from today's class? What do they mean? 

    - **Date** and **status**

        - Are there any notable security response headers that we've discussed? If so, what do they mean? 

    - Solution:

        - **Referrer Policy**: `strict-origin-when-cross-origin` means that when a link on an external website leads to crowdstrike.com, that website is logged for statistical analysis (usually for ad payment). 
        
            It also forbids your browser from sending information between https://crowdstrike.com and http://crowdstrike.com (secure HTTPS to plaintext HTTP).

        - **Strict-transport-security** tells an HTTP client that it should only be accessed over HTTPS and not HTTP. This is the response header version of **upgrade-insecure-requests**.

        - **X-xss-protection**: `1`

            - While we didn't cover this in the demo, it is a notable response header that tells the browser: *if you detect a cross-site script being loaded, stop loading the page*. It's essentially another level of protection, in case the page has been compromised.

---

© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
