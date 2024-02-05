## Basic Installation Procedure

1. Install Security Onion in Standalone mode on a virtual machine receiving all network traffic
2. Install Grafana Server OSS on a virtual machine
3. Forward Elastic data to Grafana through the GUI or IPTables
4. Install Windows Exporter on all servers and/or endpoints, alongside Wazuh Agent on all endpoints
5. Use a Prometheus Database to scrape data from all servers and/or endpoints, and the Wazuh stack to monitor clients
6. Forward Prometheus data into Grafana
7. Use alerting rules and/or make dashboards based on Prometheus and/or Elastic data
