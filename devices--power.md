# Monitor Power and Battery State

```sh
# List power device paths (example below)
$ upower -e
#> /org/freedesktop/UPower/devices/line_power_AC
#> /org/freedesktop/UPower/devices/battery_BAT0
#> /org/freedesktop/UPower/devices/line_power_ucsi_source_psy_USBC000o001
#> /org/freedesktop/UPower/devices/DisplayDevice

# Dump all information
$ upower -d

# Get information on a specific device
$ upower -i /device/path

# View more options
$ upower -h
```

A condensed form could take:

```sh
$ upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage"
```


