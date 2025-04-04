#!/bin/bash

lynx --dump NISC-IP/xymon/nongreen > penguins.txt
tail -n +20 penguins.txt > penguinie.txt
curl \
  -F 'payload_json={"username": "Watchtower NISC Monitor", "content": "@everyone Watchtower has detected a problem with the NISC server. Please see the report below..."}' \
  -F "file1=@img.png" \
  -F "file2=@penguinie.txt" \
WEBHOOK-IP-FOR-DISCORD
rm penguins.txt
rm penguinie.txt
