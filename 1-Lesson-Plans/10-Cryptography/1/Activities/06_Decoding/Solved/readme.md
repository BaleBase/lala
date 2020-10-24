## Activity File: Decoding 

You will continue the role of a security analyst working for the Hill Valley Police Department.

- There was another burglary last night, which occurred at Mayor Wilson's residence.

- The bandit left behind an encoded message at the Mayor's house.

- You are tasked with decoding the message to determine the bandit's next target.

### Instructions

1. View the message left at the Mayor's house, provided in the TXT file. Use one of the following websites to decode the message:
    - [Browserling](https://www.browserling.com/tools/hex-to-text)
    - [Rapid Tables](https://www.rapidtables.com/convert/number/hex-to-ascii.html)

2. Document the bandit's next target to provide to the police department.  

## Solution File: Decoding  

1. View the message left at the Mayor's house, provided in the TXT file. Use one of the following websites to decode the message:
    - [Browserling](https://www.browserling.com/tools/hex-to-text)
    - [Rapid Tables](https://www.rapidtables.com/convert/number/hex-to-ascii.html)

In this activity, you were asked to decode a character-encoded message  left at the Mayor's house. 

This activity required the following steps:

  - Reviewing encoded data to determine what type of encoding was applied.

  - Using web resources to decode a message.

Open the TXT file containing the code from the message left at Mayor's house. The code is in hex. 

- To decode the message, we can use the [Browserling Hex-to-Text converter](https://www.browserling.com/tools/hex-to-text).
   
  - Once decoded, it shows:
   
    `Ha Ha Ha! You can never catch the Alphabet Bandit! See if you can follow me here: 01101000 01110100 01110100 01110000 00111010 00101111 00101111 01110111 01110111 01110111 00101110 01110000 01100001 01100111 01100101 01101111 01110010 01100001 01101101 01100001 00101110 01100011 01101111 01101101 00101111 00111111 01110000 00111101 01100001 01100010 01110101 01110010 01100111 01101100 01100001 01110010`
   
- This message includes a code in binary, so we'll have to use the [Browserling Binary-to-Text converter](https://www.browserling.com/tools/binary-to-text). 
 
  - Once decoded, it shows:
 
     `http://www.pageorama.com/?p=aburglar`
 
- This webpage shows the following message: 
 
  `The Mayor is just the beginning of my Reign, My next target will be:  68 74 74 70 3a 2f 2f 77 77 77 2e 70 61 67 65 6f 72 61 6d 61 2e 63 6f 6d 2f 3f 70 3d 63 6c 75 65 32 `
 
- The coded part of the message is in hex again. We can decode it using
the [Browserling Hex-to-Text converter](https://www.browserling.com/tools/hex-to-text). 
 
  - Once decoded, it shows:

     `http://www.pageorama.com/?p=clue2`
 
- This webpage shows the following message:
 
  `Impressive work solving my puzzles, my next target will be: 
68 111 99 116 111 114 32 66 114 111 119 110 39 115 32 72 111 117 115 101`

2. Document the bandit's next target to provide to the police department.  

  - This code is in ASCII. To decipher it we will use the [Browserling ASCII-to-Text converter](https://www.browserling.com/tools/ascii-to-text). 
 - Once decoded, it shows that the Alphabet Bandit's next target is:

    `Doctor Brown's House` 
 
---

 © 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.