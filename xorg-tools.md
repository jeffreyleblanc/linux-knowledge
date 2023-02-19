# Xorg Tools

The goal of this page is to outline tools that can be used to configure
and get information about display, window, and processes when running X.

## Basic xrandr

```sh
## Check on DISPLAY
$ echo $DISPLAY

## Set DISPLAY **if** accessing remotely and nothing above
$ export DISPLAY=:0.0

## Looking at current status when a display is available
$ xrandr -q
# Screen 0: minimum 16 x 16, current 3840 x 2160, maximum 32767 x 32767
# XWAYLAND1 connected 3840x2160+0+0 (normal left inverted right x axis y axis) 600mm x 340mm
#    3840x2160     29.98*+
#    2048x1536     29.95
#    --snip--
#    640x350       29.03
$ xrandr -q --verbose
# Screen 0: minimum 16 x 16, current 3840 x 2160, maximum 32767 x 32767
# XWAYLAND1 connected 3840x2160+0+0 (0x23) normal (normal left inverted right x axis y axis) 600mm x 340mm
#         Identifier: 0x4be
#         Timestamp:  59844
#         Subpixel:   unknown
#         Gamma:      inf:inf:inf
#         Brightness: 0.063
#         Clones:
#         CRTC:       0
#         CRTCs:      0
#         Transform:  1.000000 0.000000 0.000000
#                     0.000000 1.000000 0.000000
#                     0.000000 0.000000 1.000000
#                    filter:
#         RANDR Emulation: 1
#         non-desktop: 0
#                 supported: 0, 1
#   3840x2160 (0x23) 338.750MHz -HSync +VSync *current +preferred
#         h: width  3840 start 4080 end 4488 total 5136 skew    0 clock  65.96KHz
#         v: height 2160 start 2163 end 2168 total 2200           clock  29.98Hz
# --snip--

## And if there are no displays attached:
$ xrandr -q --verbose
# Screen 0: minimum 16 x 16, current 0 x 0, maximum 32767 x 32767
```

Note (at least with wayland/sway) when you power cycle the display `XWAYLAND$NUM` will increment.


## Useful Links

* <https://wiki.archlinux.org/title/xrandr>
* <https://xorg-team.pages.debian.net/xorg/howto/use-xrandr.html>

