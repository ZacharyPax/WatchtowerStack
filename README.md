# Watchtower Stack & Watchtower Observatory
## "The shrewd one sees the danger and conceals himself"
![GPLv3](https://www.gnu.org/graphics/gplv3-with-text-136x68.png)

> [!WARNING]
> Incorrectly configuring various pieces of software in this stack can have catastrophic consequences. It is important to ensure that all network connections made between components are secure. If you have a good understanding of the components, this is easy, and there is generally no need to worry. However, if you do not know what you are doing it is possible to create grave security problems without even realizing it. If you plan to deploy this stack in part or in entirety, you must have a good understanding of how it operates PRIOR to deploying it in order to ensure you're doing so in a safe manner.

> [!CAUTION]
> If you are an electric cooperative or other service provider using services provided by the National Information Solutions Cooperative (NISC), there are additional configuration steps you need to perform to ensure that you are not inadvertently surveilling/aggregating sensitive information, as NISC sends most things including files to "iVUE Vault" unencrypted. Zeek/Strelka will decode these files in real-time and place them in the /nsm datastore on Security Onion, which can present a grave security risk should the stack be compromised.

---

Welcome to the Watchtower Stack repository! 🚀 This repository houses configuration files, scripts, and other essential information for the Watchtower Stack, a robust hardware server cluster powered by the Linux-based, free, and open-source hypervisor, Proxmox Virtual Environment.

### Overview

Watchtower is meticulously designed to offer comprehensive visibility into your network, coupled with advanced alerting capabilities based on network traffic and system telemetry. This ensures top-notch network security by ingesting data from endpoints and the network itself.

### Stack Features

1. Network intrusion detection and monitoring via Security Onion 👀 (David)
2. Full packet capture via Stenographer ✍🏻 (David)
3. Full endpoint event visibility via Wazuh 🎫 (Hezekiah)
4. Automatic file hash inspection of downloaded files with VirusTotal 🔍 (Hezekiah)
5. Instantaneous status monitoring for mission-critical systems via Prometheus 💓 (Vashti)
6. Automatic software inventory system via Wazuh 📒 (Hezekiah)
7. ARP table monitoring via Arpwatch (optional) 📋 (Adam/Eve/Moses/Forensic Node)
8. Easy-to-use interface via custom HTML and Dashy 🧠 (Korah & Vashti)
9. Ultra-long-term forensic storage of network connections via the Watchtower-Forensic Datastore & Zeek 💾 (David & Manasseh)
10. A global dashboard to monitor network and system status from all data ingest points via Grafana 🆗 (Jehoahaz)
11. So much more! (Wow!) 🎆

### Virtual Machines

Here are the key virtual machines that constitute the Watchtower Stack:

1. **Vashti:**
   - Prometheus Database
      - Collects real-time information from mission-critical servers
      - RAM, CPU, Network, Disk, Windows Services, and more
   - HTTPd for piping data into Elasticsearch
   - Blackbox for Prometheus

2. **Jehoahaz:**
   - Grafana for alerting
      - Allows the creation of custom alerts from Prometheus and Elastic
      - Send alerts to Discord, Teams, email, and more

3. **Hezekiah:**
   - Wazuh Stack
        - Monitors endpoint events
        - Custom rules allow for monitoring directories, file tampering, etc.
        - Alerts to email and SMS via email-to-SMS relay services
   - Postfix

4. **Korah:**
   - Dashy
   - ICMP Status Checker

5. **David:**
   - Security Onion
     - Main data ingest virtual machine
     - ELK Stack
     - Redis
     - Suricata
     - Zeek
     - Strelka
     - Stenographer

6. **Manasseh:**
   - Ubuntu Server Installation
     - Maintains extremely long-term historical data on network connections (over ten years capacity expected)

### Watchtower Stack Data Flow

![Watchtower Data Flow](https://i.imgur.com/3dDJ9Of.jpg)


