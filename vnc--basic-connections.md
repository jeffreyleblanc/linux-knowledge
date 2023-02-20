# Setting up a VNC Connection

This shows how to enable a vnc server on a machine and then connect to it.

This is a first pass, and there are probably tweaks for ease of use and security that can be made.


## Setting up on the Source Machine

Install dependencies. Note we are going to use xfce for the vnc window manager. Current version is 4, but check before installing.

```sh
$ sudo apt-get install \
tightvncserver \
tigervnc-common \
xfce4 xfce4-goodies
```

Now we are going to make a password file:

```sh
$ mkdir $HOME/.vnc
$ echo $$PW | vncpasswd -f > ~/.vnc/passwd
$ chmod 600 $HOME/.vnc/passwd
```

then put the following as `~/.vnc/xstartup`

```sh
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
```

```sh
$ chmod 700 $HOME/.vnc/xstartup
```

Now we will also make a systemd unit to control the vncserver:

In `/etc/systemd/system/vncserver@.service` (changing `<MY_USER>`):

```
[Unit]
Description=Start TightVNC server at startup
After=syslog.target network.target

[Service]
Type=forking
User=aces
Group=aces
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
$ systemctl daemon-reload
$ systemctl enable vncserver@1.service
$ systemctl start vncserver@1
```

Note we can always `systemctl disable` the service if we wish to have more manual control.

## Running Clients

```sh
# Install dependencies, you only have to choose one of these
$ sudo apt-get install xtightvncviewer
$ sudo apt-get install tigervnc-common tigervnc-viewer

# Run the tight viewer
$ xtightvncviewer test-3.$CT::5901
#--> will prompt for password

# Run xtiger
$ echo $$PW | vncpasswd -f > _vnc_pw
$ xtigervncviewer test-3.$CT:5901 -passwordFile _vnc_pw -SecurityTypes VncAuth
```

Note that in this setup, each viewer is to the same vnc session.

To use an ssh tunnel:

```
$ ssh -L 5901:127.0.0.1:5901 -C -N -l <MY_USER> <SERVER_IP>
```

and then you connect on localhost:5901

Note, you'll want diff local ports if multiple connections.


## Interacting with the VNC Session over SSH

If you also have an ssh connection to the machine, note you need
to set your `DISPLAY` envar to the correct X server, likely something
like:

```
$ export DISPLAY=:1.0
$ firefox
```


