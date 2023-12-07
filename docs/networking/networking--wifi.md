# Wifi Topics

Also see the `nmcli` page.

## Looking for available access points

```sh
# List network interfaces
$ ip link

# Scan for access points
# ( Remove grep for details )
$ sudo iwlist INTERFACE_NAME scan | grep SSID
```

## More

Google "Linux wifi on the command line".

