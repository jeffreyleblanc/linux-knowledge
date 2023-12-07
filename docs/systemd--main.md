# Systemd

## Commands

### System Wide Overview

To get an overview of systemd status

```sh
# What units are running
$ systemctl list-units

# List any failed units
$ systemctl --failed

# List installed unit files
$ systemctl list-unit-files

# Using wildcards to look for services
$ systemctl status "*getty*"
```

### Specific Services

To interact with a specific service ( Note that `.service` is implied in the names ):

```sh
# Show summary output (here using nginx as example service)
$ systemctl status nginx
#> Will show relevant information

# Show all information in a key=value list
$ systemctl show --no-page nginx

# Show the systemd unit file contents
$ systemctl cat nginx

# Quickly see status
$ systemctl is-active nginx
$ systemctl is-enabled nginx

# Control service
$ systemctl stop nginx
$ systemctl start nginx
$ systemctl restart nginx
$ systemctl reload nginx
```

## Unit Files

### Where Unit Files Are Located

Typically systemd unit files are located in (this can vary):

```sh
/lib/systemd/system     # services installed by packages
/etc/systemdd/system    # admin installed packages
/usr/lib/systemd/user   # user based units
```

`systemctl status <service> | grep loaded` will show you the unit file location.


### A Simple Example Custom Unit

Let's say we have a python script we want to run as a service.
We can create the file `/etc/systemd/system/myservice.service` as `root`:

```
[Unit]
Description=My Script That Does Cool Stuff
After=network.target

[Service]
ExecStart=/usr/bin/python3 /root/myservice/server.py
Restart=on-failure
WorkingDirectory=/root/myservice

[Install]
WantedBy=multi-user.target
```

Then we can enable it (so it runs on startup), and start it:

```sh
$ ls -al /etc/systemd/system/demo.service
#> -rw-r--r-- 1 root root 192 Jan 01  2020 /etc/systemd/system/myservice.service
$ systemctl enable myservice
$ systemctl start myservice
```

### Enabled and Disabled

What does it actually mean for a unit to be `enabled` or `disabled`?
Consider the example service `myservice` from above:

```sh
# Enabled the service
$ systemctl enable myservice
#> Created symlink /etc/systemd/system/multi-user.target.wants/myservice.service ->
#>    /etc/systemd/system/myservice.service.

# So if we look at all the `*.wants` directories we see:
$ ls /etc/systemd/system/*.wants
#> --snip--
#> /etc/systemd/system/multi-user.target.wants:
#> myservice.service  nginx.service  remote-fs.target  rsync.service  ssh.service
#> --snip--

# And if we then disable it
$ systemctl disable myservice
#> Removed "/etc/systemd/system/multi-user.target.wants/myservice.service".

# And it is no longer listed:
$ ls /etc/systemd/system/multi-user.target.wants
#> nginx.service  remote-fs.target  rsync.service  ssh.service
```

So basically this is done with symlinks from `*.wants` directories.
Note that the unit file includes how to `enable` it with the block:

```
[Install]
WantedBy=multi-user.target
```

## Resources and Links

* <https://wiki.archlinux.org/title/systemd>
* <https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units>
* <https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files>
* <https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs>


