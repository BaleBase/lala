## Activity File: Cryptographic Attacks

You will continue your role as a security analyst working for the Hill Valley Police Department.

- Captain Strickland shared some news: they have been secretly capturing and monitoring all the online activity of the Hill Valley detectives.

- They believe that Detective Tannen is the Alphabet Bandit, as Tannen has been recently saving suspicious encrypted files on their computer.

- The captain believes these encrypted files contain evidence that can be used to prosecute Detective Tannen.

- While capturing Detective Tannen's online activity, Captain Strickland was able to capture the following:
    - Detective Tannen's password encryption script, which generates encrypted passwords from plaintext.

    - Detective Tannen's encrypted password, which is **cbzhptmm**.

- Your task is to see if you can figure out the algorithm of the encryption script to figure out Detective Tannen's plaintext password.

- Then, you will try to use Detective Tannen's password to log into their account and gather evidence that they are the Alphabet Bandit.

### Instructions

1. Enter any plaintext into the Password Encrypter and determine the algorithm being used for encryption.

    - To run the password encrypter, run: `python3 encrypter.py`.
  
         *Hint: Try multiple plaintext passwords to help determine the algorithm.*

3. Once the algorithm has been determined for encryption, apply this method in reverse to determine Tannen's plaintext password from his encrypted password, **cbzhptmm**.

4. Apply this password on Tannen's login website to confirm that the password is correct. Look for any hard evidence that suggests Detective Tannen is the Alphabet Bandit. 

    - To test Tannen's Login password, run: `python3 password.py`.

## Solution File: Cryptographic Attacks 

The goal of this activity was to use a chosen-plaintext attack method to crack a password. You used an algorithm that converts plaintext into ciphertext to determine the plaintext of an encrypted text.

---

1. Enter any plaintext into the Password Encrypter and determine the algorithm being used for encryption.

    - To run the password encrypter, run: `python3 encrypter.py`.
  
         *Hint: Try multiple plaintext passwords to help determine the algorithm.*

- First, download the two scripts (`encrypter.py` and `password.py`) to your virtual machine.
  
- Next, test the `encrypter.py` with several plaintext words to see the results.
  - For example, if you run `python3 encrypter.py`, you will be asked:
      ```
     What is your password?
      ```
  - We will first test:  **hello**. The following is returned:

      ```
      Your Password is: hello
      Your Encrypted Password is: axeeh
      ```

   - We can determine that the letters are being substituted, as both **l**s are substited with an **e**. 

   - We will test it again with one letter, **a**,  to see if we can determine the algorithm. The following is returned:

      ```
       Your Password is: a
       Your Encrypted Password is: t
      ```
   - Since **a** is the first letter in the alphabet, and **t** is the twentieth letter in the alphabet, we can conclude that this algorithm is a Caesar cipher shifting the letter 19 characters. 
   
   - Let's apply this algorithm in reverse for each letter.
     - A good way to do this is to write or type out the whole alphabet and count 19 characters to the left for each letter of the encrypted password.

     - If you pass the letter **a** while counting, start back at the letter **z**.

3. Once the algorithm has been determined for encryption, apply this method in reverse to determine Tannen's plaintext password from his encrypted password, **cbzhptmm**.

    - To test Tannen's Login password, run: `python3 password.py`.
   - Once we apply this to every letter, the plaintext of Detective Tannen's encrypted password (**cbzhptmm**) is decrypted as **jigowatt**.

4. Apply this password on Tannen's login website to confirm that the password is correct. Look for any hard evidence that suggests Detective Tannen is the Alphabet Bandit. 

 - Next we will test out this password by running `python3 password.py`. This will return the following:

      ```
      Hi Mr Tannen,  What is your password (lowercase only) ?
      ``` 
      
  - Enter in the password `jigowatt`, and the following will be returned:
      ```
      Hello Detective Tannen, the last file you accessed is: topsecret.txt.
      ```

---

 © 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
