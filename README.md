# Watchtower Stack
## "The shrewd one sees the danger and conceals himself"

### Repository for configuration files and information on the Watchtower Stack

"Watchtower" is a hardware server cluster running the Linux-based free and open-source hypervisor “Proxmox Virtual Environment.” Watchtower’s design provides extensive visibility into your network, with additional alerting capabilities based on network traffic and system telemetry to ensure maximum network security. To accomplish this, Watchtower ingests data from endpoints and the network directly.


Currently, Watchtower consists of the following virtual machines:

Vashti: Prometheus; HTTPd for piping data into Elasticsearch

Jehoahaz: Grafana for alerting

Hezekiah: Wazuh Stack; Postfix

Korah: Dashy; ICMP Status Checker

David: Security Onion (ELK Stack; Redis; Suricata; Zeek; Strelka; Stenographer)

Manasseh: Ubuntu Server Installation for keeping extremely long-term historical data on network connections (over 2 years capacity expected)


![Watchtower Data Flow](https://i.imgur.com/3dDJ9Of.jpg)
