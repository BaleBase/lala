# 9.1 Lesson Plan: IPs and Routing

## Demo:  DHCP Four-Step Walkthrough

Now we will walk through these four steps using Wireshark.

- Start Wireshark and open the [~/Cybersecurity-Lesson-Plans/1-Lesson-Plans/09-Networking-Fundamentals-II-and-CTF-review/1/Resources/dhcp.pcap file](Resources/dhcp.pcap).

- Point out that this Wireshark capture only contains the **Four-Step DHCP process** points.

  ![DHCP1](Images/DHCP1.png)

First, note the following IP addresses and what each represents:
  - `0.0.0.0` is the new device trying to get an IP address from the DHCP server.

  - `255.255.255.255` is a special broadcast address used to send a message to everyone in the LAN. With this IP, you can send a broadcast packet to everyone in the network you're connected to.

  - `192.168.0.1` is the IP address of the DHCP server.
  - `192.168.0.10` is the IP address that the DHCP server provides to the device. Once the device receives it, it takes on this IP address.

Walk through each packet and explain what is taking place:

  ![DHCP2](Images/DHCP2.png)

   1. **DHCP Discover**: In this first step, the DHCP client needs an IP. It is temporarily using the source IP `0.0.0.0`. The DHCP client broadcasts a message to the whole LAN, represented by the destination IP  `255.255.255.255`.

   2. **DHCP Offer**: The DHCP server with the IP `192.168.0.1` responds to the first DHCP discover request by offering the IP `192.168.0.10`.

   3. **DHCP Request**: The DHCP client, still represented as `0.0.0.0`, sends a message back across the whole LAN, represented by `255.255.255.255`, saying, _"Thanks for the IP address, I will take it."_

   4. **DHCP ACK**: In response, the DHCP server `192.168.0.1` says to the DHCP client `192.168.0.10`, _"Great, glad you have the IP address. I will need it back after a certain period of time."_  
    - In this last step, The DHCP server issues a **DHCP lease** and any other configuration information the client may have requested.

- Point out that in the packet, the DHCP server is telling the client that the lease for this IP address is for one hour.

  ![DHCP4](Images/DHCP4.png)

Explain that we can use filters to look for DHCP packets, and more specifically, DHCP steps.     

Enter in the following filters and explain their uses:

- To view all DHCP packets:

  - Enter `dhcp` in the filter and press Enter.

- To view specific DHCP steps:

  - **DHCP Discover** filter: `dhcp.option.dhcp == 1`

  - **DHCP Offer** filter: `dhcp.option.dhcp == 2`

  - **DHCP Request** filter: `dhcp.option.dhcp == 3`

  - **DHCP ACK** filter : `dhcp.option.dhcp == 5`

  - Clarify that `dhcp.option.dhcp == 4` is used for **DHCP Decline**. This is why DHCP ACK is `dhcp.option.dhcp == 5`.

  ![DHCP3](Images/dhcp3.png)

Explain that in the next lesson we will see practical applications for these filters.

Take a moment to address remaining questions on DHCP before proceeding to the next section.

## Demo:  DHCP Starvation

Now we'll visualize a DHCP starvation attack by opening up the [.../09-Networking-Fundamentals-II-and-CTF-review/1/Resources/DHCPAttack.pcap](Resources/DHCPAttack.pcap) file in Wireshark.

![dhcpstarvepcap](Images/dhcpstarve.png)

Point out the following about the above image:
  - This is a capture of DHCP traffic for one network.

  - There are only milliseconds between each packet.

  - If we scan through the traffic, we notice many DHCP requests, indicating that an attacker is attempting to starve the DHCP server's IP addresses.

  - This capture is just a small sample. In a real DHCP starvation attack, there may be more than 50,000 DHCP packets.


Explain that one way to protect against this attack  is to set a **maximum threshold**. This threshold is the number of DHCP requests per second that can be accepted by the DHCP server.  When the threshold is reached, the DHCP server ignores requests until a certain period of time.

 ## Demo:  Visualizing Wireless in Wireshark

Now we will now use Wireshark to visualize wireless beacon signals, capture BSSIDs and SSIDs, and determine which wireless security is being used by the wireless access points.

- Open the wireless packet capture:  [Resources/Beacon.pcapng](Resources/Beacon.pcapng).

- Note that there are two beacon signals in this wireless packet capture.

  - The `Info` column identifies the beacon signal.

  - All protocols found in this capture are identified in the `Protocol` column as `802.11`, indicating they are wireless packets.

   ![Wireless1](Images/wireless1.png)

- Note that the two beacon signals have a destination address of `ff:ff:ff:ff:ff:ff`.

- Explain that `ff:ff:ff:ff:ff:ff` is a broadcast address used by devices to broadcast the packet to everyone on a network.

    ![Wireless1b](Images/wireless1b.png)


Explain that Wireshark has an tool for analyzing the details of wireless traffic.

  - Click `Wireless` in the toolbar, then `WLAN Traffic`.

    ![Wireless2](Images/wireless2.png)

- A `Wireless LAN Statistics` page should appear:

    ![Wireless3](Images/wireless3.png)

- Explain that on this page the SSIDs, BSSID, and wireless security protection are clearly identified.

    ![Wireless4](Images/wireless4.png)

- The two WAPs have the following details:

   1. **SSID** = `Ment0rNet`, **BSSID** =  `00:23:69:61:00:d0`, **Security Protection** = `WEP`.

   2. **SSID** = `Coherer`, **BSSID** = `00:0c:41:82:b2:55`, **Security Protection** = `Unknown`.

- Explain that Wireshark is able to detect that Ment0rNet was using WEP, but unable to detect the security being used by Coherer.

Luckily, there is a way to manually analyze the packet to determine the security being used by Coherer.

- The first step is to create a column to easily see the SSIDs of the different WAPs.

  - To do this, select one beacon packet and expand the following trees in the Packet Details frame:
    -  `IEEE 802.11 wireless LAN`  > `Tagged parameters` > `Tag: SSID parameter set`

    - Right-click `SSID: Ment0rNet` and select `Apply as Column`.

  ![Wireless5](Images/wireless5.png)

Now you should easily be able to see the different SSIDs:

  ![Wireless6](Images/wireless6.png)

**Note:** depending on your screen real estate, you may want to remove other columns that you aren't using to see your new ssid column without having to scroll. Just right click and deselect a few columns you aren't using.

Explain that in order to view whether or not they are using WPA, and find out the WPA version, expand the following trees in packet details frame:

  - `IEEE 802.11 wireless LAN` > `Tagged parameters`  > `Tag: Vendor Specific: Microsoft Corp.: WPA Information Element`
  - Right-click on `WPA Version: 1` then select `Apply as Column`.

- Explain that you should now be able to see WPA Version:

![Wireless7](Images/wireless7.png)

Explain that in the next activity, we will analyze a wireless packet capture to determine the SSIDs, BSSIDs, and wireless security being used by multiple access points.

Take a moment to address remaining questions before proceeding to the wireless networking activity.

## Demo: Decrypting with Aircrack-NG

Remind class that in the previous sections, we covered multiple versions of wireless security protocols, including the weaker wireless security protocols, such as WEP.

Explain that in the following walkthrough, we will demonstrate decrypting WEP-encrypted wireless traffic using a tool called **Aircrack-NG**.

- Aircrack-NG is a free wireless decryption tool that is provided in Kali Linux. Here we have installed it on the Ubuntu machine you are already using.

Open the packet capture [Resources/WEP.pcap](Resources/WEP.pcap)

- Explain that this is the wireless traffic from the SSID `Ment0rNet`, from the previous lesson.

  - Remember: `Ment0rNet` was using **WEP**.

- Run `Aircrack-ng WEP.pcap`

  - The syntax is: `Aircrack-ng  [.pcap file name]`

Note the following while the decryption is running:
  - Aircrack-ng needs a certain number of wireless packets in order to figure out the secret key to decrypt, typically a minimum of 10,000.

    - The secret key is _not_ the same thing as the password for authenticating a wireless network.

    - The secret key is used to encrypt the wireless traffic from the device, and decrypt the wireless traffic from the WAP.

- Once it completes, note that Aircrack-ng figured out the secret key: `D0:E5:9E:B9:04`.

![aircrack2](Images/aircrack2.png)

Explain that we will use this key to decrypt the wireless traffic captured in Wireshark.

- Open up the same packet capture in Wireshark.

- Note that only the encrypted `802.11` packets are in this capture.

- Next, explain that the Wireless Toolbar should be enabled. Navigate to `View` and check  `Wireless Toolbar`.

![aircrack3](Images/aircrack3.png)

- In the Wireless Toolbar, select `802.11` preferences. A page will appear with `IEEE 802.11` pre-selected.

- On this page, confirm that `Enable Decryption` is checked and select `Edit` next to `Decryption keys`.

![aircrack5](Images/aircrack5.png)

 - On this page, click on the `+` icon to add the key.

 - Select `WEP` and copy and paste the key, `D0:E5:9E:B9:04`.
   - **Note:** The key may not be accepted if you _type_ it into Wireshark.
 - Select `OK` on both pages to save your changes.

![aircrack6](Images/aircrack6.png)

- Return to the Wireshark capture page, and scroll through the packets.

- Point out that there are now more than just the `802.11` protocol packets.  

- Explain that Wireshark was able to decrypt the encrypted wireless traffic and it found ARP and TCP packets.

![aircrack7](Images/aircrack7.png)

Explain that this walkthrough demonstrates how to decrypt wireless traffic that uses the weak WEP wireless protocol.

- While WPA and WPA aren't completely protected from similar attacks, they are much more difficult to decrypt and provide better protections.

Explain that cybercriminals have several methods of finding these weak wireless security routers:

  - **Wardriving** is the act of physically driving around an area with a computer and a wireless antenna to find wireless LANs that may be vulnerable.

  - Once a cybercriminal determines potential vulnerable targets, they mark the locations on the street with symbols in chalk so they can attempt to exploit these access points at a later time. This is called **warchalking**.

  - Some cybercriminals have evolved to use drones to find vulnerable access points, a process known as **warflying**.

Explain that while all the above methods are attacks that use a legitimate wireless access point, cybercriminals can also create a fake wireless access point, called an **evil twin**.

  - With an evil twin, an attacker can make a fake SSID to trick unsuspecting users into connect to the attacker's wireless access point.

    - For example, an attacker can set up a fake a WAP with the SSID `Starbucks_FreeWifi` in a Starbucks coffee shop. Once the user is connected, the attacker can capture and view their traffic.

Explain that in the last activity, students used Aircrack-ng and Wireshark to decrypt wireless traffic from the WEP wireless access point found in the previous activity.

Take a moment to address remaining questions before proceeding to the wireless attacks activity.
