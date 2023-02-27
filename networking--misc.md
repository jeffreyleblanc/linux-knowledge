# Networking Miscellaneous Topics

## Wifi Ipv4 Keeps Changing (2023-02-27)

I had an issue on my laptop where my wifi ipv4 address kept changing every minute or so.

The first hint I had was looking at `sudo dmesg` and seeing a pattern of these blocks with `<MAC1>` and `<MAC2>` swapping each time:

```
[29291.301542] wlp0s20f3: disconnect from AP <MAC2> for new auth to <MAC1>
[29291.368208] wlp0s20f3: authenticate with <MAC1>
[29291.373483] wlp0s20f3: send auth to <MAC1> (try 1/3)
[29291.399426] wlp0s20f3: authenticated
[29291.401264] wlp0s20f3: associate with <MAC1> (try 1/3)
[29291.402439] wlp0s20f3: RX ReassocResp <MAC1> (capab=0x1011 status=0 aid=25)
[29291.410339] wlp0s20f3: associated
[29291.445614] wlp0s20f3: Limiting TX power to 24 (24 - 0) dBm as advertised by b8:f8:53:79:34:eb
```

This led to some googling and discussion, and this can apparently happen when a given SSID has multiple channels and your connection
is not very good, so it keeps bouncing among them.

For a given ssid, you can specify a channel by looking up its [bssid](https://en.wikipedia.org/wiki/Service_set_(802.11_network)):

```sh
$ sudo iwlist scan
# --snip--
# wlp0s20f3  Scan completed :
#         Cell 01 - Address: <MAC1>
#                     Channel:64
#                     Frequency:5.32 GHz (Channel 64)
#                     Quality=36/70  Signal level=-74 dBm
#                     Encryption key:on
#                     ESSID:"my-internet"
#                     --snip--
#         Cell 02 - Address: <MAC2>
#                     Channel:132
#                     Frequency:5.66 GHz (Channel 132)
#                     Quality=38/70  Signal level=-72 dBm
#                     Encryption key:on
#                     ESSID:"my-internet"
# --snip--
```

Using the network manager GUI, you can set one of the above `Address` as `BSSID` in addition to the `SSID` under the "Identity" tab for the wifi connection. This will show up (or you could edit here), in the relevant `/etc/NetworkManager/system-connections/my-internet.nmconnection` file block:

```
[wifi]
bssid=<MAC>
mode=infrastructure
ssid=my-internet
```

This will prevent the interface from jumping around and thus changing ipv4 constantly. It also locks you into one of the channels, which (if say you move locations relative to the router) might keep you using a suboptimal channel. So you may want to remove the `BSSID` once you move.


