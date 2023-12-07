# Hostname

This is the hostname of a machine.

It is stored at `/etc/hostname`

To change it, the best way (using systemd):

```sh
# List info
$ hostnamectl

# Change the name
$ hostnamectl set-hostname NAME

# The following will also list the hostname
$ hostname
```


