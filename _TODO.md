# Todo

There is always tons to do, but initial things to add/update:

## Strucure

The goal is not have an overly complicated structure, but perhaps a pattern of:

`<category>--<topic>`, e.g. `networking--nmcli.md` works.

So what categories are there?

```
bash--
networking--
filesys--
users--
core--
wm--  (for window manager, graphics?)
```

## Topics

* `.bashrc` and patterns of setup/split of subfiles
    * include `source` as well
* tmux
    * more on distinction of:
        * server
        * session
        * window
        * pane
    * tmux config file example
    * controlling tmux remotely with commands
    * sharing tmux sessions
* basics of screen
* how linux start up
    * bootloader
    * uefi/efi/grub
    * kernel
    * dmesg
    * userspace
    * getty and the tty
    * window manager
* clipboard with discussion of
    * xorg vs wayland
    * integration with tmux
    * integration with vim/nvim
    * wl-copy, wl-paste
    * `xclip-*`
* vim/nvim
    * installation and setup
    * config file and plugins
    * key mappings
* ssh (initial topics)
    * generation of and basic use of keys
    * ssh vs sshd and managing that
        * include local keys, server hashes, etc
    * the `.ssh` folder and `config` files
    * use of `ssh-agent`
        * also integration with `.bashrc`
        * key forwarding
    * reuse of connections
    * use of `-J` to jump
    * integration with pkcsll
    * on server side, limiting the commands a key can do
    * recipes over ssh
        * port/user mapping with rsync and scp
        * becoming a remote user
        * escape clauses
        * sending tmux commands
* pki
    * provide overview of pki basics
        * public/private certificates
        * file formats
    * expand/clean `openssl` examples
    * generation of self signed certificates
    * general use of let's encrypt and `cerbot` updates
* networking overview
    * basics of OSI layers
    * Mac addresses, IP addresses
    * tcp vs udp
    * LAN and gateways, arp
    * firewalls
    * ip tables / routes
    * ports
        * permissable ports (e.g. ports that require root)
    * dns overview
    * dns resolution
        * records
    * basics of ssl
    * /etc/hostname
    * /etc/hosts
        * how can "fake" dns here
* file system
    * `ln -s`
    * `stat`
* networking tools
    * expand on `ip2` tools
    * netstat
    * use of netcat and telnet
    * dig, dnsmasq
    * ping, traceroute
    * more on tcpdump
    * iw
    * network manager gui
* http
    * more on wget and curl
    * uses of `python3 -m http.server`
* linux users and permisions
    * chown, chgrp, chmod
    * sudo and su patterns
* process examination
    * signal processes
    * kill/killall
    * /proc tree
    * ps options
    * pgrep, pkill, ptree
    * strace
* xorg
    * example for the following
    * xwininfo
    * xprop
    * xdpyinfo
    * xset for background etcs
    * xsetroot
* nmcli
    * more on start/stop service
    * more on /etc/NetworkManager files
    * use of gnome or other UI to handle configuration
* compression etc
    * tar patters
    * zip
    * zcat
* encryption and hashes
    * md5sum
    * shasum
    * relevant gpg and openssl commands
* file systems
    * mount/unmount
    * lvm
    * mkfs
    * parted
* screeshots
* ubuntu
    * understand snap
* systemd
    * systemctl listing of units etc
    * systemctl control of a unit
    * journalctl
    * making/editing systemd units
    * `systemctl` vs `service`
* system info
    * uptime
    * date time
    * uname
    * etc/os-release
* processes
    * `type` resolution
    * PATH
    * /usr/bin, /usr/sbin, /usr/local/bin
    * manually installing programs and symlinking

More misc topics/programs:

    dmesg and the kernel message
        /var/log...
        using tail to watch the logs
    envars
    diff
    sed
    gpg
    head
    host
    jq
    loginctl
    who
    => how tell other users logged in
    shutdown
    pdf manipulation
    image manipulation
    echo/print/printf
    wc
    chron

