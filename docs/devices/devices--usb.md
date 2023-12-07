# USB General Notes

## Hardware

* <https://en.wikipedia.org/wiki/USB_hardware>
* Overview of 2+3 connectors: <https://en.wikipedia.org/wiki/File:USB_2.0_and_3.0_connectors.svg>

![USB Connectors SVG](https://upload.wikimedia.org/wikipedia/commons/8/82/USB_2.0_and_3.0_connectors.svg)


## Listing USB Devices

Without installing any special tools:

```sh
$ sudo cat /sys/kernel/debug/usb/devices | grep -E "^([TSPD]:.*|)$"
```

Specific Tools:

```sh
$ apt-get install usbutils
$ lsusb
#> basic info
$ usb-devices
#> more detailed info
```

See <https://wiki.debian.org/HowToIdentifyADevice/USB> for more details.

