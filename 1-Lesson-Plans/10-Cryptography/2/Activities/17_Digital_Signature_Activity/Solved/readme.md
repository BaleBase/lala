## Activity File: Digital Signatures

In this activity, you will continue to play the role of a security analyst working for the Hill Valley Police Department.

- Captain Strickland has sent you several more urgent messages about the Alphabet Bandit case.

- It's quite likely that one of the messages was sent by the Alphabet Bandit pretending to be Captain Strickland to throw off the investigation.

- Your task is to use GPG to determine which of the messages is not authentic.

### Instructions

1. Extract the messages from Captain Strickland.

2. Import Captain Strickland's public key.

3. Use GPG to determine which of the messages are not authentic and thus not from Captain Strickland.

## Solution Guide: Digital Signatures 

The goal of this exercise is to illustrate how digital signatures can be used to validate authenticity. You were tasked with validating signatures with GPG to determine authenticity.

---

1. Extract the messages from Captain Strickland.

- First, extract the messages from Captain Strickland.

2. Import Captain Strickland's public key.

- Next, import Captain Strickland's public key with the following command:

  - `gpg --import strickland_publickey.gpg`

3. Use GPG to determine which of the messages are not authentic and thus not from Captain Strickland.

- After importing the public key, verify each clearsigned message with the following commands:

  - `gpg --verify message1.sig`
  - `gpg --verify message2.sig`
  - `gpg --verify message3.sig`
  
- This will clearly show that `message1` and `message2` are authentic:
  
  ```
  gpg: Signature made Mon, Nov 25, 2019  2:17:27 PM EST`
  gpg:                using RSA key 4C0E98AC34FF09005EF0451899DDD0570ABED677`
  gpg: Good signature from "strickland <strickland@hillvalleypd.com>" [ultimate]`
  ```       

- This will also show that `message3` is not authentic and likely forged:

  ```
    gpg: CRC error; E606B8 - 74217B
    gpg: no signature found
    gpg: the signature could not be verified.
    Please remember that the signature file (.sig or .asc)
    should be the first file given on the command line.
  ```
---

 © 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
