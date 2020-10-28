## Activity File: Cryptography Refresher

In this upcoming activity you will use your Key and IV that you had created in the previous class, and had saved into a file called `key_and_IV`. 

- You will continue to act as a security analyst working for the Hill Valley Police Department.

- Captain Strickland has moved a meeting to 6:00 p.m. and would like you to notify your partner of this change.

- As secrecy is still critical, your task is to write an updated message, and encrypt it with OpenSSL.

- Next, send the encrypted message to your partner with your key and IV (initialization vector), and decrypt the message you receive from your partner.

### Instructions

1. Choose a partner, preferably the same partner as in the previous class.

2. Write an updated message using your code name, indicating the meeting is now at 6:00 p.m. at Lou's Cafe.
    - Encrypt the message with OpenSSL.
    - Send the encrypted message to your partner with the key and IV.
    - Once you received your partner's encrypted message, key, and IV, decrypt it with Open SSL.

3. After decrypting your partner's message, answer the following questions:
    - What method did you use to transfer the key and IV?
    - Is this a secure method for transmitting the key and IV? Why or why not?

## Solution Guide: Cryptography Refresher
The goal of this exercise was to review how to use OpenSSL and illustrate the challenge that securely exchanged keys pose to security professionals.

---

2. Write an updated message using your code name, indicating the meeting is now at 6:00 p.m. at Lou's Cafe.
    - Encrypt the message with OpenSSL.
    - Send the encrypted message to your partner with the key and IV.
    - Once you received your partner's encrypted message, key, and IV, decrypt it with Open SSL.

3. After decrypting your partner's message, answer the following questions:
    - What method did you use to transfer the key and IV?
    - Is this a secure method for transmitting the key and IV? Why or why not?

- Write a message (you can use Nano or Vi) to create a message  titled `meetingplace_update.txt` containing the following information:

    ```
    Dear [partner's code name]

    Captain Strickland would like us to now meet at Lou's Cafe at 6 p.m. to discuss some additional information about the Alphabet Bandit. See you there!

    From, 
    [your code name]
    ```               
 - Use OpenSSL to encrypt the message by running the following:
 
    `openssl enc -pbkdf2 -nosalt -aes-256-cbc -in meetingplace_update.txt -out meetingplace_update.txt.enc -base64 -K <your_key> -iv <your_iv>`
               
 - Send the following to your partner:
      - `meetingplace_update.txt.enc`
      - Key
      - IV
     
- Upon receiving your partner's message, key, and IV, decrypt the message with the following command, updated with your partner's key and IV in the correct locations:

    `openssl enc -pbkdf2 -nosalt -aes-256-cbc -d -in meetingplace_update.txt.enc -base64 -K [partner key] -iv [partner IV]`
           
3. After decrypting your partner's message, answer the following questions:
    - What method did you use to transfer the key and IV?
    - Is this a secure method for transmitting the key and IV? Why or why not?

- It's likely that most of you used Slack or email to transmit the key and IV. While Slack and email may seem secure:
        
    - Emails are typically not encrypted.
    - Slack administrators can have access to view private messages between parties.

---

 © 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.

