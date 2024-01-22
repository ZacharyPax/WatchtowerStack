# Watchtower Stack
Repository for configuration files and information on the Watchtower Stack

The Watchtower Stack is a collection of virutal machines used to collect extensive network and endpoint telemetry for the purpose of increasing environment security.



Currently, Watchtower consists of the following virtual machines:

Vashti: Prometheus; HTTPd for piping data into Elasticsearch

Jehoahaz: Grafana for alerting

Hezekiah: Wazuh Stack; Postfix

Korah: Dashy; ICMP Status Checker

David: Security Onion (ELK Stack; Redis; Suricata; Zeek; Strelka; Stenographer)


