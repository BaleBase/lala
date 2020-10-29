## Activity File: Steganography

You will continue your role as a security analyst working for the Hill Valley Police Department. 

- Unfortunately, the Alphabet Bandit committed another burglary, this time at Mrs. Peabody's house.

- The Alphabet Bandit left a thumb drive that contained only a JPG image of a car.

- While all the other detectives believe that this is just a regular image, your captain wants you to investigate if the image holds any secret messages.

- You must use steganography tools to determine if the image contains any hidden messages.


### Instructions

1. Download the image of the car from [here](https://tinyurl.com/y4m3zftl) onto your virtual machine, then open the file. 

2. Run `steghide` to determine if the image file contains a secret message.
  
  - *Hint: The password is the brand of the car.* If you get stuck, ask your instructor or TA for help. 

3. If the image contains a secret message, find out what it says.

## Solution Guide: Steganography

The goal of this activity was to demonstrate how steganography is used as an applied cryptographic concept to hide a message within non-secret data, such as an image. You applied the command-line tool `steghide` to find the secret message.

---

1. Download the image of the car from [here](https://tinyurl.com/y4m3zftl) onto your virtual machine, then open the file. 

- Preview the image by double-clicking the image from the desktop of your VM.
  
  - The image should display a DeLorean car:
  
       ![delorean](images/mydreamcar.jpg)
       
2. Run `steghide` to determine if the image file contains a secret message.
  
  - *Hint: The password is the brand of the car.* If you get stuck, ask your instructor or TA for help. 

- Next, from the command line, go to your desktop directory to run the following `steghide` command:

  - `steghide extract -sf mydreamcar.jpg`

- When it asks for the password, enter the brand of the car:
   
  - `delorean`
         
- This extracts the hidden file, called  `list_of_targets.txt`.

3. If the image contains a secret message, find out what it says.
- Save the image to your virtual machine.

- Preview the contents. This clearly reveals the previous and future targets of the Alphabet Bandit:

  ```
  List of Homes to Break Into

  Doctor Brown House - Done
  Mayor Wilson's House - Done
  Mrs Peaboday's House - Done
  Captain Strickland's house - Next
  ```
---

 © 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
