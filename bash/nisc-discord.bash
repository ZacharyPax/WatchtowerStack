#!/bin/bash

STOPSPAM="/tmp/nisc-timeout.lock"
if [ -e "$STOPSPAM" ]; then
    echo "NISC 45 minute timeout is in progress..."
    exit 1
fi

touch "$STOPSPAM"

cleanup() {
    rm -f "$STOPSPAM"
}
trap cleanup EXIT
URL="http://NISC-IP/xymon/nongreen.html"

wget -q -O /tmp/nongreen.html "$URL"

if ! grep -q "All Monitored Systems OK" /tmp/nongreen.html; then
  echo "The NISC server did not return the expected response from Xymon to hezekiah.vm.wt.local! The full error is in the Watchtower NISC Monitor Discord channel. Check if the server is okay!  This script normally runs every minute, but will now sleep for 45 minutes to prevent alert fatigue." | mail -s "[WATCHTOWER NISC MONITORING] NISC may be borked!" -r SENDEREMAIL RECIPIENT-EMAILS
  tail -n +20 /home/notroot/NISC-Monitor/penguins.txt > /home/notroot/NISC-Monitor/penguinie.txt
  /bin/curl \
    -F 'payload_json={"username": "Watchtower NISC Monitor", "content": "@everyone Watchtower has detected a problem with the NISC server. Please see the report below..."}' \
    -F "file1=@/home/notroot/NISC-Monitor/img.png" \
    -F "file2=@/home/notroot/NISC-Monitor/penguinie.txt" \
  DISCORD-WEBHOOK-URL
  echo "Sleeping for 2700 seconds..."
  sleep 2700
fi

rm /tmp/nongreen.html
