# Watchtower Stack

## "The shrewd one sees the danger and conceals himself"

Welcome to the Watchtower Stack repository! 🚀 This repository houses configuration files and essential information for the Watchtower Stack, a robust hardware server cluster powered by the Linux-based, free, and open-source hypervisor, Proxmox Virtual Environment.

### Overview

Watchtower is meticulously designed to offer comprehensive visibility into your network, coupled with advanced alerting capabilities based on network traffic and system telemetry. This ensures top-notch network security by ingesting data from endpoints and the network itself.

### Virtual Machines

Here are the key virtual machines that constitute the Watchtower Stack:

1. **Vashti:**
   - Prometheus Database
   - HTTPd for piping data into Elasticsearch

2. **Jehoahaz:**
   - Grafana for alerting

3. **Hezekiah:**
   - Wazuh Stack
   - Postfix

4. **Korah:**
   - Dashy
   - ICMP Status Checker

5. **David:**
   - Security Onion
     - ELK Stack
     - Redis
     - Suricata
     - Zeek
     - Strelka
     - Stenographer

6. **Manasseh:**
   - Ubuntu Server Installation
     - Maintains extremely long-term historical data on network connections (over 2 years capacity expected)

### Watchtower Data Flow

![Watchtower Data Flow](https://i.imgur.com/3dDJ9Of.jpg)


