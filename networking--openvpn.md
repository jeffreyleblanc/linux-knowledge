# Openvpn


## Misc

If you set up a client vpn connection via `gnome-control-center`, in the IPv4 section
check the box for "Use this connection only for resources on this network"

This turns into a line in the `[ipv4]` section of the `.nmconnection` file that is:

```
never-default=true
```

This basically prevents iptables from having a confusing second default route added.

