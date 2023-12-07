# Dhclient

`dhclient` can release/renew dhcp leases:

```sh
## Release an ipv4 lease on a given interface
$ dhclient -4 -r enp1s0

## Renew the lease
$ dhclient -4 -1 enp1s0
```


