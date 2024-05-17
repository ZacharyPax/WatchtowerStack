#! /bin/bash

# This script should be ran at system startup on the hypervisor before starting David virtual machine
# You can use/create an rc.local systemd service if you want this to run automatically

# turns off swap on hypervisor (if you have very high IOPS you can remove this line)
swapoff -a

# sets all of our interfaces to promiscuous mode 
ip link set enp3s0f0 promisc on
ip link set enp3s0f1 promisc on
ip link set enp4s0f0 promisc on
ip link set enp4s0f1 promisc on
ip link set ens1f0 promisc on
ip link set ens1f1 promisc on

# sets bridge MAC address aging to 0 (your bridges might not be vmbr420-422)
brctl setageing vmbr420 0
brctl setageing vmbr421 0
brctl setageing vmbr422 0

# sets bridge to forward traffic instantly
brctl setfd vmbr420 0
brctl setfd vmbr421 0
brctl setfd vmbr422 0


# launches PVE exporter (https://github.com/prometheus-pve/prometheus-pve-exporter)
pve_exporter
