IP="REDACTED"
PORT="REDACTED"
TIMEOUT=4
response=$(timeout $TIMEOUT nc -w 2 $IP $PORT)
if echo "$response" | grep -iq "REDACTED"; then
    echo "OK! Collector is powered on."
else
    echo "NOT OK! Collector is NOT identifying itself on TCP 22. There a problem."
fi
