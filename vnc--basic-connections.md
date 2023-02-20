# Setting up a VNC Connection

This shows how to enable a vnc server on a machine and then connect to it.

This is a first pass, and there are probably tweaks for ease of use and security that can be made. For example I don't discuss server firewall/encryption options at the moment.


## Setting up on the Source Machine

Install dependencies. Note we are going to use xfce for the vnc window manager. Current version is 4, but check before installing.

```sh
$ sudo apt-get install tightvncserver
$ sudo apt-get install xfce4 xfce4-goodies
# likely don't need: `tigervnc-common`
```

> if asked about window manager, can use gdm

Now we are going to make a password file:

```sh
$ mkdir ~/.vnc
# For a modicum of security, add a ' ' before next command
# so it's not logged to bash history
$  echo <password> | vncpasswd -f > ~/.vnc/passwd
#> Insanely, this should be exactly 8 characters
$ chmod 600 ~/.vnc/passwd
```

then put the following as `~/.vnc/xstartup`

```sh
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
```

```sh
$ chmod 700 ~/.vnc/xstartup
```

Now we will also make a systemd unit to control the vncserver:

In `/etc/systemd/system/vncserver@.service` (changing `<MY_USER>` and the geometry if you wish):

```
[Unit]
Description=Start TightVNC server at startup
After=syslog.target network.target

[Service]
Type=forking
User=<MY_USER>
Group=<MY_USER>
WorkingDirectory=/home/<MY_USER>

PIDFile=/home/<MY_USER>/.vnc/%H:%i.pid
ExecStartPre=-/usr/bin/vncserver -kill :%i > /dev/null 2>&1
ExecStart=/usr/bin/vncserver -depth 24 -geometry 1920x1080 :%i
ExecStop=/usr/bin/vncserver -kill :%i

[Install]
WantedBy=multi-user.target
```

Then:

```sh
$ sudo systemctl daemon-reload
$ sudo systemctl enable vncserver@1.service
$ sudo systemctl start vncserver@1
```

Note we can always `systemctl disable` the service if we wish to have more manual control.

## Running Clients

Note: `xtightvncviewer` is not a great option as it seems to:

* not scale the remote desktop to the size of your viewer window.
* at least on gnome, doesn't respond to any key combo to escape `-fullscreen`

Though you could try `xtigervncviewer`, see if you have `remote-viewer` already installed. Seems better.

However, if you want, here is how to use tightvnc:

```sh
$ sudo apt-get install xtightvncviewer
$ xtightvncviewer <hostname>::5901
#--> will prompt for password
```

And tigervnc:

```sh
$ sudo apt-get install tigervnc-common tigervnc-viewer
$  echo <pw> | vncpasswd -f > _vnc_pw
$ xtigervncviewer <hostname>:5901 -passwordFile _vnc_pw -SecurityTypes VncAuth
```

Note that in this setup, each viewer is to the same vnc session.

## Using an SSH Tunnel

To use an ssh tunnel, on the client machine run:

```
$ ssh -L 5901:127.0.0.1:5901 -C -N -l <MY_USER> <SERVER_IP>
#> Just leave this running while you are using it.
#> Likely no output.
```

The flags basically mean:

    -L  specifies port forwarding rules
    -C  compresses data
    -l  specifies the login name on the remote machine
    -N  suppresses executing a remote command, used when forwarding ports

Then you can connect at `localhost:5901` (for `remote-viewer` specifically `vnc://localhost:5901`).

Note, you'll want different local ports if multiple connections.

## Misc Notes on Interacting in the Viewer

I've noticed that if you have another graphical session (e.g. I've got swaywm running on same machine), I get errors if I'm trying to run firefox in both the physical and vnc sessions.


## Interacting with the VNC Session over SSH

If you also have an ssh connection to the machine, note you need
to set your `DISPLAY` envar to the correct X server, likely something
like:

```
$ export DISPLAY=:1.0
$ firefox
```


