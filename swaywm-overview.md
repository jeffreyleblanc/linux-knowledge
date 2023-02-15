# Sway Window Manager

Sway is a tiling window manager for wayland. It is basically a clone of i3 (which works with X).

Helpful links:

* <https://swaywm.org/>
* <https://wiki.debian.org/sway>


## Setup

```sh
$ apt-get install sway
$ mkdir ~/.config/sway
$ cp /etc/sway/config ~/.config/sway
```

I make the following updates to the config file:

```sh
# Your preferred terminal emulator
#orig set $term foot
set $term gnome-terminal

#
# Workspaces:
#
    # --snip--

    #custom: Add moving workspaces
    bindsym Control+Alt+Left workspace prev
    bindsym Control+Alt+Right workspace next
```


## Keybindings

```
$M mapped to 'windows' key

# Application Control
$M Enter             start a terminal
$M d                 start program launcher

# Window Controls
$M Arrows            move among windows in workspace
$M Shift+space       toggle floating
$M Shift+q           quit focus window
$M left-click/drag   resize floating windows
$M right-click/drag  move floating window

# Non floating window layout ( $M arrows moves among them)
$M e                 Default view all windows
$M s                 Stacked layout
$M w                 Tabbed layout
$M f                 Toggle focus window fullscreen

# Workspaces
$M NUM               Make or go to that workspace
$M shift+$N             move window to workspace $N
Ctrl+alt+arrow          move prev/next workspace

# Overall
$M Shift e           prompt to exit sway
```

See also <https://i3wm.org/docs/refcard.html>


## Program Specifics

* For a file browser use `nautilus`
    * To make multiple windows hit 'ctrl+n'

## Questions

* Document wl-copy
* Screenshots
* Change background
* Better status bar
* Notification system
* Screen Lock
* Sleep/lock on laptop


