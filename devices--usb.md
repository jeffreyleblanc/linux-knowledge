# USB General Notes

## 1) Hardware

* <https://en.wikipedia.org/wiki/USB_hardware>
* Overview of 2+3 connectors: <https://en.wikipedia.org/wiki/File:USB_2.0_and_3.0_connectors.svg>

![USB Connectors SVG](https://upload.wikimedia.org/wikipedia/commons/8/82/USB_2.0_and_3.0_connectors.svg)


## 2) Listing USB Devices

Note, this feels a little harder than it needs to be, but here are options.
Among the issues that the below commands don't do a great job of making immediately clear:

* What is an actual external device vs a built-in hub or device?
* What speeds/protocol is a given device available at?


### 2.1) Without installing any special tools:

```sh
$ sudo cat /sys/kernel/debug/usb/devices | grep -E "^([TSPD]:.*|)$"
```

### 2.3) Installable Tools

Perhaps the most useful command is (with notes on connected devices):

```sh
$ apt-get install usbutils
# Provides lsusb and usb-devices

$ lsusb -tv
# /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 10000M
#     ID 1d6b:0003 Linux Foundation 3.0 root hub
#===> Here I have a external HD
#     |__ Port 2: Dev 8, If 0, Class=Mass Storage, Driver=uas, 10000M
#         ID 14b0:0208 StarTech.com Ltd. 
# /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 480M
#     ID 1d6b:0002 Linux Foundation 2.0 root hub
# /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 10000M
#     ID 1d6b:0003 Linux Foundation 3.0 root hub
#     |__ Port 4: Dev 11, If 0, Class=Mass Storage, Driver=usb-storage, 5000M
#===> Here I have a USB Key
#         ID 090c:1000 Silicon Motion, Inc. - Taiwan (formerly Feiya Technology Corp.) Flash Drive
# /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/12p, 480M
#     ID 1d6b:0002 Linux Foundation 2.0 root hub
#     |__ Port 3: Dev 14, If 0, Class=Human Interface Device, Driver=usbhid, 1.5M
#===> Here I have a mouse
#         ID 046d:c069 Logitech, Inc. M-U0007 [Corded Mouse M500]
#     |__ Port 8: Dev 3, If 0, Class=Video, Driver=uvcvideo, 480M
#         ID 04f2:b67c Chicony Electronics Co., Ltd 
#     |__ Port 8: Dev 3, If 1, Class=Video, Driver=uvcvideo, 480M
#         ID 04f2:b67c Chicony Electronics Co., Ltd 
#     |__ Port 8: Dev 3, If 2, Class=Video, Driver=uvcvideo, 480M
#         ID 04f2:b67c Chicony Electronics Co., Ltd 
#     |__ Port 8: Dev 3, If 3, Class=Video, Driver=uvcvideo, 480M
#         ID 04f2:b67c Chicony Electronics Co., Ltd 
#     |__ Port 9: Dev 13, If 0, Class=Vendor Specific Class, Driver=, 12M
#         ID 06cb:00bd Synaptics, Inc. Prometheus MIS Touch Fingerprint Reader
#     |__ Port 10: Dev 5, If 0, Class=Wireless, Driver=btusb, 12M
#         ID 8087:0aaa Intel Corp. Bluetooth 9460/9560 Jefferson Peak (JfP)
#     |__ Port 10: Dev 5, If 1, Class=Wireless, Driver=btusb, 12M
#         ID 8087:0aaa Intel Corp. Bluetooth 9460/9560 Jefferson Peak (JfP)
```

Other commands include:

```sh
$ usb-devices
# more detailed info

$ apt-get install usbview
$ usbview
# pops up a GUI that is primitive but useful
```

Also see <https://wiki.debian.org/HowToIdentifyADevice/USB> for more details. From there, this is moderately useful pattern:

```sh
$ lsusb -v | grep -E '\<(Bus|iProduct|bDeviceClass|bDeviceProtocol)' 2>/dev/null
# Couldn't open device, some information will be missing
# Couldn't open device, some information will be missing
# Bus 004 Device 008: ID 14b0:0208 StarTech.com Ltd. SSD 870 EVO 1TB
#   bDeviceClass            0 
#   bDeviceProtocol         0 
#   iProduct                3 SSD 870 EVO 1TB
# Couldn't open device, some information will be missing
# Couldn't open device, some information will be missing
# Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
#   bDeviceClass            9 Hub
#   bDeviceProtocol         3 
#   iProduct                2 xHCI Host Controller
# Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
#   bDeviceClass            9 Hub
#   bDeviceProtocol         1 Single TT
#   iProduct                2 xHCI Host Controller
# Bus 002 Device 011: ID 090c:1000 Silicon Motion, Inc. - Taiwan (formerly Feiya Technology Corp.) Flash Drive
#   bDeviceClass            0 
#   bDeviceProtocol         0 
#   iProduct                2 Flash Drive
# Couldn't open device, some information will be missing
# Couldn't open device, some information will be missing
#       (Bus Powered)
# Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
# Couldn't open device, some information will be missing
#   bDeviceClass            9 Hub
#   bDeviceProtocol         3 
#   iProduct                2 xHCI Host Controller
# Bus 001 Device 013: ID 06cb:00bd Synaptics, Inc. Prometheus MIS Touch Fingerprint Reader
#   bDeviceClass          255 Vendor Specific Class
#   bDeviceProtocol       255 
#   iProduct                0 
#       (Bus Powered)
# Bus 001 Device 003: ID 04f2:b67c Chicony Electronics Co., Ltd Integrated Camera
#   bDeviceClass          239 Miscellaneous Device
#   bDeviceProtocol         1 Interface Association
#   iProduct                1 Integrated Camera
#       (Bus Powered)
# Couldn't open device, some information will be missing
# Couldn't open device, some information will be missing
# Bus 001 Device 014: ID 046d:c069 Logitech, Inc. M-U0007 [Corded Mouse M500]
#   bDeviceClass            0 
#   bDeviceProtocol         0 
#   iProduct                2 USB Laser Mouse
#       (Bus Powered)
# Bus 001 Device 005: ID 8087:0aaa Intel Corp. Bluetooth 9460/9560 Jefferson Peak (JfP)
#   bDeviceClass          224 Wireless
#   bDeviceProtocol         1 Bluetooth
#   iProduct                0 
# Couldn't open device, some information will be missing
# Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
#   bDeviceClass            9 Hub
#   bDeviceProtocol         1 Single TT
#   iProduct                2 xHCI Host Controller
```
