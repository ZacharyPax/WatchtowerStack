#!/bin/bash

# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>. 

clear
echo ----------
echo Watchtower Network Inventory Scanner v0.1
echo Zachary Pax 2024 - Riverland Energy Cooperative
echo ----------
# Set network interface here
INTERFACE="wlan0"
echo Setting interface to: $INTERFACE
echo Change this in the script if needed.
echo ----------
echo Scanning network... This may take some time...
echo ----------
rm inventory-result.csv 2> /dev/null
SCAN=$(arp-scan --interface=$INTERFACE --localnet)
TOTAL=0
FIRST=true
while read COUNT MANUFACTURER
do
    if $FIRST; then
        FIRST=false
    else
        # Remove the trailing comma from the manufacturer name
        MANUFACTURER=$(echo "$MANUFACTURER" | sed 's/,$//')
        echo "$MANUFACTURER,$COUNT" >> inventory-result.csv
        echo "$MANUFACTURER - $COUNT Devices"
    fi
    TOTAL=$((TOTAL + COUNT))
done < <(echo "$SCAN" | awk '!/received|1.10.0|Unknown:/ && NR>2 {print $3}' | sort | uniq -c)
echo "Total,$TOTAL" >> inventory-result.csv
echo "Total Devices - $TOTAL" 
echo
echo Execution complete.
echo ----------
