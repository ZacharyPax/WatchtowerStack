#! bin/bash

# This script should be ran at Jehoahaz startup on Jehoahaz
# You can use/create an rc.local systemd service if you want this to run automatically
# Run these commands as root

# Release current IP (likely 192.168.0.80 static route)
dhclient -r

# Get a new IP from ArcadiaDC DHCP Server (192.168.0.67)
dhclient

# Forward all traffic from TCP 3000 to TCP 80
# This enables status.local to work without a port
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 3000  