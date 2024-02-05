Changelog 2-5-2024

Watchtower 2.0.0

Completely rebuilt Vashti on "Eve"

Rebuilt Prometheus

Rebuilt HTTPd

Properly installed VirtIO Red Hat drivers on Vashti

QEMU Guest Integration Fixed on Vashti

Moved Korah to Moses to make room for Vashti on Eve (see image) 

Rebalanced RAM allocations for guests (101, 102, 103, 105) (see Proxmox qemu configs)


Result of changes:

Lowered disk IO wait on Moses node

Increased Prometheus performance on SSD

Grafana on Moses node is more responsive polling data from SSD
