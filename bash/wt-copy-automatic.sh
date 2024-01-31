#! /bin/bash

# Requires putty

# This script is used for extracting forensic Zeek log data from David to Manasseh (Watchtower-Forensic)
# This data is contained in gzip archives with json sorted by protocol and by hour automatically
# It is very highly compressed and thus we can keep ludicrous amounts of historical connection data on every source and destination IP and protocol
# Replace REDACTED-PASSWORD with your password in bash syntax, and/or username notroot with your non-root username on Security Onion/Zeek/whatever you use 
# Also replace IP of course if yours isn't the same

# find yesterday
today=$(date "+%Y-%m-%d")
thedayiwant=$(date -d "$today - 1 day" "+%Y-%m-%d")

# shove yesterday into putty scp 
wtforensiccopy="pscp -pw REDACTED-PASSWORD -r notroot@192.168.0.119:/nsm/zeek/logs/$thedayiwant Watchtower-Forensic-Datastore/"

# Run your command
$wtforensiccopy
