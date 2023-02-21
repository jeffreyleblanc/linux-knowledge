# Nmcli

This details Network Manager's cli interface `nmcli`.

## Basics

Listing and status

```sh
## List status of connections
$ nmcli c show

## List status of devices
$ nmcli d show
$ nmcli d status

## List status of wifi
$ nmcli radio wifi
$ nmcli d wifi list
```

Control

```sh
## Controlling a connection
$ nmcli c up MyVPN
$ nmcli c down MyVPN

## Controlling a device
$ nmcli d disconnect wlp2s0
$ nmcli d connect wlp2s0

## Controlling wifi
$ nmcli radio wifi off
$ nmcli radio wifi on
```

## Files

The connection files are located under `/etc/NetworkManager/system-connections/`.

Note that if you edit any of them, you must restart the NetworkManager service.

This can be done with `systemctl restart NetworkManager`.

An example wifi file might look like:

```toml
[connection]
id=<SOME_NAME_PROBABLY_THE_SSID>
uuid=<UUID>
type=wifi
interface-name=<Device, such as `wlp0s20f3`>
permissions=

[wifi]
mac-address-blacklist=
mode=infrastructure
ssid=<SSID>

[wifi-security]
auth-alg=open
key-mgmt=wpa-psk
psk=<WIFI_PASSWORD>

[ipv4]
dns-search=
method=auto

[ipv6]
addr-gen-mode=stable-privacy
dns-search=
method=auto

[proxy]
```

