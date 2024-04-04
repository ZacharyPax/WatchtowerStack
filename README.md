# Watchtower Stack & Watchtower Observatory
## "The shrewd one sees the danger and conceals himself"

### DISCLAIMERS
Components created by Zachary Pax in this repository are licensed under the GNU General Public License version 3.

*ALL SCRIPTS, CONFIGURATION FILES, CODE, AND OTHER FILES PROVIDED BY ZACHARY PAX ARE OFFERED WITHOUT ANY WARRANTY, INCLUDING BUT NOT LIMITED TO MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. THE USE OF THESE FILES IS AT YOUR OWN RISK. ZACHARY PAX SHALL NOT BE LIABLE FOR ANY DAMAGES OR NEGATIVE REPERCUSSIONS ARISING FROM THE USE, MISUSE, OR INABILITY TO USE THESE FILES, INCLUDING BUT NOT LIMITED TO ANY DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. PLEASE BE AWARE THAT NETWORK MONITORING SOLUTIONS HAVE THE ABILITY TO BE DANGEROUS AND SHOULD BE DEPLOYED WITH CARE.*

![GPLv3](https://www.gnu.org/graphics/gplv3-with-text-136x68.png)

> [!WARNING]
> The misconfiguration of any software within this stack could potentially lead to severe repercussions. It is of paramount importance to ascertain that all network connections established between components are secure. With a comprehensive understanding of the components, this task becomes straightforward, and there is typically no cause for concern. However, a lack of knowledge can inadvertently result in significant security vulnerabilities. Therefore, if you intend to deploy this stack, either partially or wholly, it is essential to have a thorough understanding of its operation prior to deployment to guarantee a secure implementation.

> [!CAUTION]
> If you represent an electric cooperative or any other service provider utilizing the services offered by the National Information Solutions Cooperative (NISC), it is crucial to undertake additional configuration measures. This is to prevent the unintentional surveillance or aggregation of sensitive information. NISC typically transmits a majority of data, including files, to the “iVUE Vault” in an unencrypted format. Tools such as Zeek/Strelka included in the Watchtower Stack and/or its components are capable of **decoding these files in real-time and storing them** in the /nsm datastore on Security Onion. This could potentially pose a significant security threat in the event of a compromise of the stack. Therefore, it is essential to ensure the proper configuration to maintain the security and integrity of your data.

---
### Introduction

Welcome to the repository for the Watchtower Stack. This repository contains configuration files, scripts, code, and other essential information for the Watchtower Stack, a robust hardware server cluster powered by the Linux-based, free, and open-source hypervisor, Proxmox Virtual Environment.

### Overview

The Watchtower Stack is designed with meticulous attention to detail to provide comprehensive visibility into your IT environment. It features advanced alerting capabilities based on network traffic and system telemetry, ensuring superior network security by ingesting data from both endpoints and the network.

### Features of the Stack

The Watchtower Stack offers a range of features:

  -  Network intrusion detection and monitoring via Security Onion (David)
  -  Full packet capture via Stenographer (David)
  -  Comprehensive endpoint event visibility via Wazuh (Hezekiah)
  -  Automatic file hash inspection of downloaded files with VirusTotal (Hezekiah)
  -  Automatic file behavior analysis with Yara rules (Hezekiah)
  -  Real-time status monitoring for mission-critical systems via Prometheus (Vashti)
  -  Automatic software inventory and vulnerability management system via Wazuh (Hezekiah)
  -  ARP table monitoring via Arpwatch (Adam/Eve/Moses/Zipporah/Forensic Node/Rebekah/Andrew/Delilah/Watchtower-Orchestration)
  -  User-friendly interface via custom HTML and Dashy (Korah & Vashti)
  -  Long-term forensic storage of network connections via the Watchtower-Forensic Datastore & Zeek (David & Manasseh)
  -  A global dashboard to monitor network and system status from all data ingest points via Grafana (Jehoahaz)
  -  A simple HTML interface to inventory all network devices (Zechariah/Ruth)

### Virtual Machines

The Watchtower Stack comprises several key virtual machines:

   - Vashti: Houses the Prometheus Database, which collects real-time information from mission-critical servers, including RAM, CPU, Network, Disk, Windows Services, and more. It also contains HTTPd for piping data into Elasticsearch and Blackbox for Prometheus.
     
   - Jehoahaz: Contains Grafana for alerting, which allows the creation of custom alerts from Prometheus and Elastic and sends alerts to Discord, Teams, email, and more.
     
   - Hezekiah: Houses the Wazuh Stack, which monitors endpoint events. Custom rules allow for monitoring directories, file tampering, etc. Alerts to email and SMS via email-to-SMS relay services. Wazuh FIM facilitates VirusTotal cryptographic hash inspection on non-whitelisted downloaded files. It also contains Postfix to integrate with Microsoft 365.
     
   - Korah: Contains Dashy, an experimental Strelka UI under development, and an ICMP Status Checker.
     
   - David: The main data ingest virtual machine, which contains Security Onion Console, the ELK Stack, Redis, Suricata, Zeek, Strelka, and Stenographer.
     
   - Manasseh: An Ubuntu Server Installation that maintains extremely long-term historical data on network connections (over ten years capacity expected) and is the target for the Watchtower Data Preservation script.
     
   - Zechariah: An Ubuntu Server Installation that manages network device inventory with “Watch Your LAN”.

   - Ruth: An Ubuntu Server Installation that manages VoIP phone device inventory.

   - Lazarus: An Ubuntu Server Installation that does Internal Watchtower Stack status monitoring and orchestration.

### Watchtower Stack 2.1.1 Data Flow (Excluding Zechariah, Ruth, and Lazarus)

![Watchtower Data Flow](https://i.imgur.com/3E0inR9.jpeg)

### Watchtower Stack 2.1.1 File Inspection Pipeline

![Watchtower File Inspection](https://i.imgur.com/wTLnaOW.png)
