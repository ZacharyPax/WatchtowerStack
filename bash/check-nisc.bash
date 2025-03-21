#!/bin/bash

URL="http://NISC-IP/xymon/nongreen.html"

wget -q -O /tmp/nongreen.html "$URL"

if ! grep -q "All Monitored Systems OK" /tmp/nongreen.html; then
  echo "The NISC server did not return the expected response from Xymon to hezekiah.vm.wt.local! Check if the server is okay! This script normally runs every minute, but will now sleep for 45 minutes to prevent alert fatigue." | mail -s "[WATCHTOWER NISC MONITORING] NISC may be borked!" -r SENDER@address.com destination@address.com destination2@address.com
  echo "Sleeping for 2700 seconds..."
  sleep 2700
fi

rm /tmp/nongreen.html
