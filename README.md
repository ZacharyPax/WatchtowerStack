# Watchtower Stack & Watchtower Observatory
## "The shrewd one sees the danger and conceals himself"
Components created by Zachary Pax in this repository are licensed under the GNU General Public License version 3.

*ALL SCRIPTS, CONFIGURATION FILES, CODE, AND OTHER FILES PROVIDED BY ZACHARY PAX ARE OFFERED WITHOUT ANY WARRANTY, INCLUDING BUT NOT LIMITED TO MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. THE USE OF THESE FILES IS AT YOUR OWN RISK. ZACHARY PAX SHALL NOT BE LIABLE FOR ANY DAMAGES OR NEGATIVE REPERCUSSIONS ARISING FROM THE USE, MISUSE, OR INABILITY TO USE THESE FILES, INCLUDING BUT NOT LIMITED TO ANY DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. PLEASE BE AWARE THAT NETWORK MONITORING SOLUTIONS HAVE THE ABILITY TO BE DANGEROUS AND SHOULD BE DEPLOYED WITH CARE.*

![GPLv3](https://www.gnu.org/graphics/gplv3-with-text-136x68.png)

> [!WARNING]
> Incorrectly configuring various pieces of software in this stack can have catastrophic consequences. It is important to ensure that all network connections made between components are secure. If you have a good understanding of the components, this is easy, and there is generally no need to worry. However, if you do not know what you are doing it is possible to create grave security problems without even realizing it. If you plan to deploy this stack in part or in entirety, you must have a good understanding of how it operates PRIOR to deploying it in order to ensure you're doing so in a safe manner.

> [!CAUTION]
> If you are an electric cooperative or other service provider using services provided by the National Information Solutions Cooperative (NISC), there are additional configuration steps you need to perform to ensure that you are not inadvertently surveilling/aggregating sensitive information, as NISC sends most things including files to "iVUE Vault" unencrypted. Zeek/Strelka will decode these files in real-time and place them in the /nsm datastore on Security Onion, which can present a severe security risk should the stack be compromised.

---
### Introduction

Welcome to the repository for the Watchtower Stack. This repository contains configuration files, scripts, code, and other essential information for the Watchtower Stack, a robust hardware server cluster powered by the Linux-based, free, and open-source hypervisor, Proxmox Virtual Environment.

### Overview

The Watchtower Stack is designed with meticulous attention to detail to provide comprehensive visibility into your network. It features advanced alerting capabilities based on network traffic and system telemetry, ensuring superior network security by ingesting data from both endpoints and the network.

### Features of the Stack

The Watchtower Stack offers a range of features:

  -  Network intrusion detection and monitoring via Security Onion (David)
  -  Full packet capture via Stenographer (David)
  -  Comprehensive endpoint event visibility via Wazuh (Hezekiah)
  -  Automatic file hash inspection of downloaded files with VirusTotal (Hezekiah)
  -  Automatic file behavior analysis with Yara rules (Hezekiah)
  -  Real-time status monitoring for mission-critical systems via Prometheus (Vashti)
  -  Automatic software inventory and vulnerability management system via Wazuh (Hezekiah)
  -  ARP table monitoring via Arpwatch (optional) (Adam/Eve/Moses/Zipporah/Forensic Node/Zechariah)
  -  User-friendly interface via custom HTML and Dashy (Korah & Vashti)
  -  Long-term forensic storage of network connections via the Watchtower-Forensic Datastore & Zeek (David & Manasseh)
  -  A global dashboard to monitor network and system status from all data ingest points via Grafana (Jehoahaz)
  -  A simple HTML interface to inventory all network devices (Zechariah)

### Virtual Machines

The Watchtower Stack comprises several key virtual machines:

   - Vashti: Houses the Prometheus Database, which collects real-time information from mission-critical servers, including RAM, CPU, Network, Disk, Windows Services, and more. It also contains HTTPd for piping data into Elasticsearch and Blackbox for Prometheus.
     
   - Jehoahaz: Contains Grafana for alerting, which allows the creation of custom alerts from Prometheus and Elastic and sends alerts to Discord, Teams, email, and more.
     
   - Hezekiah: Houses the Wazuh Stack, which monitors endpoint events. Custom rules allow for monitoring directories, file tampering, etc. Alerts to email and SMS via email-to-SMS relay services. Wazuh FIM facilitates VirusTotal cryptographic hash inspection on non-whitelisted downloaded files. It also contains Postfix to integrate with Microsoft 365.
     
   - Korah: Contains Dashy, an experimental Strelka UI under development, and an ICMP Status Checker.
     
   - David: The main data ingest virtual machine, which contains Security Onion Console, the ELK Stack, Redis, Suricata, Zeek, Strelka, and Stenographer.
     
   - Manasseh: An Ubuntu Server Installation that maintains extremely long-term historical data on network connections (over ten years capacity expected) and is the target for the Watchtower Data Preservation script.
     
   - Zechariah: An Ubuntu Server Installation that manages network device inventory with “Watch Your LAN”.


### Watchtower Stack 2.1.0 Data Flow

![Watchtower Data Flow](https://i.imgur.com/3E0inR9.jpeg)

### Watchtower Stack 2.1.0 File Inspection Pipeline

![Watchtower File Inspection](https://i.imgur.com/wTLnaOW.png)
