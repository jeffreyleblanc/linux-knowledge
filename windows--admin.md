# Notes on Windows Admin

Very rough!

You have two options for a terminal

* Command Prompt
* Power Shell

Differences with linux shells

* Almost no shell expansions

Some commands

```sh
$ netstat -?
$ netstat -ano

$ find /?

$ tasklist | find "TERM"
$ tasklist /FI "PID eq 45"

# sc is somewhat analogous to systemctl
# and most windows programs run/managed by
# services
$ sc query
$ sc query > out.txt

$ ipconfig /all
$ ipconfig /renew

$ route print
$ arp -a
$ ping 8.8.8.8
$ ping google.com

# similar to tcpdump
# sometimes need Admin access and pcap
$ pktmon
```

