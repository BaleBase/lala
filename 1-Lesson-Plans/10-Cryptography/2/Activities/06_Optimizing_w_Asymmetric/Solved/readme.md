## Activity File:  Optimizing with Asymmetric Public Keys

In this activity, you will continue to play the role of security analysts working for the Hill Valley Police Department.

- Hill Valley's largest police divisions, the SWAT team, the Canine Unit, and Internal Affairs, are currently using symmetric keys to exchange secure messages with each other.

- As a security professional, you recommend to Captain Strickland to seriously consider moving to asymmetric keys, as it would mean many fewer keys to manage.

- Captain Strickland is excited about your recommendation, but would like to understand exactly how many fewer keys each division would be managing with this change.

- Your task is to provide a summary report for the captain showing how many keys are saved by moving from symmetric key cryptography to asymmetric key cryptography for the three divisions.
 
### Instructions

1. For each of the following Hill Valley police divisions, calculate how many asymmetric and symmetric keys will be required for secure communication based on the number of officers. 

    - SWAT team: 10 officers
    - Canine Unit: 25 officers
    - Internal Affairs: 45 officers

2. Document how many fewer keys will be required after moving from symmetric to asymmetric cryptography for each division.
  
    - For example: *The SWAT team will need X fewer keys after moving from symmetric to asymmetric cryptography.*

## Solution Guide: Optimizing with Asymmetric Public Keys

The goal of this activity was to compare key distribution and the number of required keys for asymmetric encryption and symmetric encryption. 

You calculated how many symmetric and asymmetric keys are needed depending on the number of people exchanging secure messages.

---

- The key formulas for calculating the number of keys required: 

     - Symmetric encrytion: **(N * (N-1)) / 2** 
     - Asymmetric encryption: **N * 2** 
                
     **In both formulas, N = the number of individuals.** 

1. For each of the following Hill Valley police divisions, calculate how many asymmetric and symmetric keys will be required for secure communication based on the number of officers. 

    - SWAT team: 10 officers
    - Canine Unit: 25 officers
    - Internal Affairs: 45 officers

- To calculate for the SWAT team, with 10 officers:

     - Symmetric: (10 * 9)/2  = 45
     - Asymmetric: 10 * 2   = 20
     - Difference: 45  - 20 = 25

- To calculate for the Canine Unit, with 25 officers:

     - Symmetric: (25 * 24)/2 = 300
     - Asymmetric: 25 * 2 = 50
     - Difference: 300 - 50 =  250

- To calculate for Internal Affairs, with 45 officers:

     - Symmetric: (45 * 44)/ 2 = 990
     - Asymmetric: 45 * 2    = 90
     - Difference: 990 - 90 = 900

2. Document how many fewer keys will be required after moving from symmetric to asymmetric cryptography for each division.
  
    - For example: *The SWAT team will need X fewer keys after moving from symmetric to asymmetric cryptography.*

- The final summary:

    - The SWAT team will need 25 fewer keys after moving from symmetric to asymmetric cryptography.

    - The Canine Unit will need 250 fewer keys after moving from symmetric to asymmetric cryptography.

    - Internal Affairs will need 900 fewer keys after moving from symmetric to asymmetric cryptography.

---

 © 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
