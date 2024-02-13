#! /bin/bash

# The Watchtower Data Preservation Tool is intended to be used to quickly preserve forensic PCAP data from an endpoint following a cybersecurity incident.
# It generates the data and then copies it to the Watchtower-Forensic Manasseh Virtual Machine.
# Requires Putty
# Zachary Pax 2024 made for Riverland Energy Cooperative

clear
echo ----------
echo WATCHTOWER DATA PRESERVATION TOOL
echo ""The shrewd one sees the danger and conceals himself""
echo Zachary Pax 2024 for Riverland Energy Cooperative
echo ----------
echo This tool will automatically preserve PCAP files indefinitely for an endpoint you select.
echo This tool is intended to be used in the event of a cybersecurity incident.
echo ----------
read -p "Enter the IP Address involved in the cybersecurity incident: " badip
read -p "Enter the amount of hours to preserve: " hours
read -p "Enter the desired PCAP file name to create: " filename
echo ----------
echo Generating forensic PCAP file...
echo ----------
echo Stenographer query created:
echo host $badip before $hours\h ago $filename
sudo so-pcap-export "host $badip AND before $hours h ago" $filename
echo PCAP file has been generated.
echo ----------
echo Connecting to Watchtower-Forensic Datastore...
echo ----------
sudo pscp -pw REDACTED-PASSWORD /nsm/pcapout/$filename\.pcap notroot@wt-forensic.local:Watchtower-Forensic-Datastore/watchtower-data-preservation/
echo ----------
echo Please connect to wt-forensic.local to copy the forensic PCAP file.
echo ----------
echo Execution complete.
echo ----------
