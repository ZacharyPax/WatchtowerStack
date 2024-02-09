# Watchtower Stack
## "The shrewd one sees the danger and conceals himself"
![GPLv3](https://www.gnu.org/graphics/gplv3-with-text-136x68.png)

Welcome to the Watchtower Stack repository! 🚀 This repository houses configuration files and essential information for the Watchtower Stack, a robust hardware server cluster powered by the Linux-based, free, and open-source hypervisor, Proxmox Virtual Environment.

### Overview

Watchtower is meticulously designed to offer comprehensive visibility into your network, coupled with advanced alerting capabilities based on network traffic and system telemetry. This ensures top-notch network security by ingesting data from endpoints and the network itself.

### Stack Features

1. Network intrusion detection and monitoring via Security Onion
2. Full packet capture via Stenographer
3. Full endpoint event visibility via Wazuh
4. Instantaneous status monitoring for mission-critical systems via Prometheus
5. Automatic software inventory system via Wazuh
6. ARP table monitoring via Arpwatch (optional)
7. Easy-to-use interface via custom HTML and Dashy
8. Ultra-long-term forensic storage of network connections indexed by Zeek via the Watchtower-Forensic Datastore
9. A global dashboard to monitor network and system status from all data ingest points via Grafana
10. So much more! (Wow!)

### Virtual Machines

Here are the key virtual machines that constitute the Watchtower Stack:

1. **Vashti:**
   - Prometheus Database
      - Collects real-time information from mission-critical servers
      - RAM, CPU, Network, Disk, Windows Services, and more
   - HTTPd for piping data into Elasticsearch

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


