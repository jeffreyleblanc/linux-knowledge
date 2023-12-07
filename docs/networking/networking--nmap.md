# Nmap

## Super Basic Usage

```sh
# Find all machines on local network using ping query
# (replace your ip range)
$ nmap -sn 192.168.1.0/24

# The above just lists found IP, to list all queried
$ nmap -sn -v 192.168.1.0/24

# To look for open ports (here 80)
$ nmap -p 80 192.168.1.0/24
```


## Topics

Might be a better way to query for IP of a known mac address on LAN with `ip neigh` or similar.

