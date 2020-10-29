## Activity File: Cryptography Refresher

You will continue your role as a security analyst working for the Hill Valley Police Department. 

- In the last class, you determined that the Alphabet Bandit is likely an insider, as a forged message told you to investigate *outside* of the Hill Valley Police Department.

- Since the Alphabet Bandit has yet to be identified, and in order to protect your fellow police officers, you want to remind everyone to be sure to use digital signatures to create and verify messages.

- Your task is to create a message reminding your fellow officers to use digital signatures. 

- Be sure to follow your own advice by clearsigning the message, and then share it with your fellow officers.
 


### Instructions

1. Verify that you can see your gpg key by running: `gpg --list-keys`. 
   - Note: If you can't see your gpg key, reinstall it using `gpg --gen-key`. 

```
sysadmin@UbuntuDesktop:~$ gpg --list-keys
/home/sysadmin/.gnupg/pubring.kbx
---------------------------------
pub   rsa3072 2020-05-27 [SC] [expires: 2022-05-27]
      FE5AAFF8365F5CD2DB305089DDD05BF1DC3F40C8
uid           [ultimate] sysadmin
sub   rsa3072 2020-05-27 [E] [expires: 2022-05-27]
```

2. Write a simple message reminding your fellow Hill Valley officers to sign and verify all messages until further notice.

3. Using GPG, clearsign the message with a digital signature, and name your output file with your name, such as: `Important_Communication_by_Myname` 

4. Working with the same partner as in the assymetric key activity from last class, send the clearsigned message to the partner.

    - Note: If this partner isn't available, join another group to exchange exported public keys and clearsigned messages with.

5. Once you receive the clearsigned message from your partner, use GPG to verify the message is authentic. 

## Solution Guide: Cryptography Refresher

The goal of this activity was to practice using digital signatures with GPG, and to demonstrate that digital signatures can be used to send messages that are guaranteed to be authentic.

---

1. Verify that you can see your gpg key by running: `gpg --list-keys`. 
   - Note: If you can't see your gpg key, reinstall it using `gpg --gen-key`. 

```
sysadmin@UbuntuDesktop:~$ gpg --list-keys
/home/sysadmin/.gnupg/pubring.kbx
---------------------------------
pub   rsa3072 2020-05-27 [SC] [expires: 2022-05-27]
      FE5AAFF8365F5CD2DB305089DDD05BF1DC3F40C8
uid           [ultimate] sysadmin
sub   rsa3072 2020-05-27 [E] [expires: 2022-05-27]
```

2. Write a simple message reminding your fellow Hill Valley officers to sign and verify all messages until further notice.

This solution is an example, as you will each have a different key and message. The following example demonstrates how to sign and verify a message with GPG.

- First, write a message to a file using echo.

    - Nano or Vi can be used to create a message. The echo command is:
    
      - `echo "This is an Urgent reminder by the security team of Hill Valley PD.  Please be sure to use GPG to sign and verify all messages" > Important_Communication_by_me.txt`
        
   - Be sure to replace the word "me" with your name.
     
3. Using GPG, clearsign the message with a digital signature, and name your output file with your name, such as: `Important_Communication_by_Myname` 

- Sign the message with your private key and create an output file called `Important_Communication_by_me.sig`:
 
   -  `gpg --output Important_Communication_by_me.sig   --clearsign Important_Communication_by_me.txt`
       
- Run the script and display the clearsigned signature by running the following next command:

    - `cat Important_Communication_by_me.sig`
     
  - This should display the following:

    ```
    -----BEGIN PGP SIGNED MESSAGE-----
    Hash: SHA512

    This is an Urgent reminder by the security team of Hill Valley PD. 
    Please be sure to use GPG to sign and verify all messages
    -----BEGIN PGP SIGNATURE-----

    iQGzBAEBCgAdFiEEYSlws2SzZx5pJqjYHX0Iu8WCN4gFAl4OBv8ACgkQHX0Iu8WC
    N4gf/gv+PPq/qZhETpklzIjRpn620H2LpUIPqIEwqyoZ8A7WuLMTyJNjUpp6Q43T
    ZnL8fcBj5c51AswFElI4tGbWASc/YUISZCv/hMZ2q126rbTZnfvVWGlIHEuNw1La
    Ole3C7iRB845nFuY3YZGlKdr2a0X+M/SPEgvOnQP0MIYIfmCILz20ZxJjyn9H47d
    lgAZiijoMMn1OvX60BcLxj5aov6K2YgMDw63z9Z/CB/+Ue2t+M1rm/A9zAQxRiNS
    V3pdHHaBiDx3s3fieWmPR0/HJK8zUOpkzPs/SLZUkz0WZqvLv6RHE9Viab4YwjIP
    ZCaMjSrkCVuq9KwbpWE6ZFdVT3Cq/dNgRRxTuCImoRA0XzLEwLpBQIbFBozlGM/p
    ZDdzHOYkK5ZlnAF/rtmQOCVE5GFyipTXEsD2Sg4Tj52AdTl4JLKjRff5UlWsBW8D
    qJgSybjnYOGaABMIVCTAoUMC4dxGoEbZxPZZFfZKoxNViTykFIuw3xvzG0vTYz5h
    HEqplTYb
    =skQM
    -----END PGP SIGNATURE-----
    ```

  
  - This shows the plaintext message and the separate digital signature in the same file.
 
- We will pretend that the message above is the one we received from our partner.
   
4. Working with the same partner as in the assymetric key activity from last class, send the clearsigned message to the partner.

    - Note: If this partner isn't available, join another group to exchange exported public keys and clearsigned messages with.

  - Since you should already have your partner's public key imported from the previous activity, we don't have to repeat that step.
 
5. Once you receive the clearsigned message from your partner, use GPG to verify the message is authentic. 

-  Verify the message by running the following command:
 
    - `gpg --verify Important_Communication_by_me.sig`
       
  -  The verification response should look similar to the following:

  ``` 
    gpg: Signature made Mon 09 Dec 2019 02:30:52 PM EST
    gpg:                using RSA key 39B2BD6C93E1E63E8C004183FE91AF7A7B4EC267
    gpg: Good signature from "me <metest.com>" [ultimate]
  ```

---

 © 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
