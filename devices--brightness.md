# Brightness Control

## From the Shell

```sh
# Install
$ sudo apt-get install brightnessctl

# List state of all devices
$ brightnessctl -l
#> Available devices:
#> Device 'intel_backlight' of class 'backlight':
#> 	Current brightness: 102 (26%)
#> 	Max brightness: 400
#>
#> Device 'platform::mute' of class 'leds':
#> 	Current brightness: 0 (0%)
#> 	Max brightness: 1
#>
#> --snip--
#>
#> Device 'tpacpi::kbd_backlight' of class 'leds':
#> 	Current brightness: 0 (0%)
#> 	Max brightness: 2
#>
#> --snip--


# Get info on a device
$ brightnessctl i -d intel_backlight
#> Device 'intel_backlight' of class 'backlight':
#>         Current brightness: 100 (25%)
#>         Max brightness: 400

# Get just brightness value
$ brightnessctl g -d intel_backlight
#> 100

# Set brightness with value
$ sudo brightnessctl s -d intel_backlight 150
#> Updated device 'intel_backlight':
#> Device 'intel_backlight' of class 'backlight':
#>         Current brightness: 150 (38%)
#>         Max brightness: 400

# Set brightness with percentage
$ sudo brightnessctl s -d intel_backlight 35%
#> Updated device 'intel_backlight':
#> Device 'intel_backlight' of class 'backlight':
#>         Current brightness: 140 (35%)
#>         Max brightness: 400
```

