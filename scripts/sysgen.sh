# Use /dev/udp to write to syslog every 5 seconds

while true; do sleep 5; date; done > /dev/udp/localhost/514
