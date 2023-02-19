# TCPDump

## Examples To Be Parsed

The following have to be unpacked:

```sh
tcpdump -f "not host 192.168.102.5"
tcpdump -f "not host 192.168.102.5"
tcpdump -i eth0 "tcp[tcpflags] & (tcp-syn) != 0"
tcpdump port 443
tcpdump -n -i any
tcpdump -n -i any not udp
tcpdump -n -i any not udp and port not ssh
tcpdump -n -i any and port not ssh
tcpdump -n -i any port not ssh
tcpdump -n -i any port not 22
tcpdump -n -i any port not 22 and 192.168.67.35
tcpdump -n -i any port not 22 and host 192.168.67.21
tcpdump -A -n -i any port not 22 and host 192.168.67.21
tcpdump -n -i any port not 22
tcpdump -n -i any port not 22 | grep -v 39380
tcpdump -n -i any port not 22 | grep 39380
tcpdump -n -i any port not 22 | grep 39380 | head -20
tcpdump -n -i any port not 22 | grep -v 39380 | head -10
tcpdump -n -i brext port 443
```

