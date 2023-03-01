# USB General Notes

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

