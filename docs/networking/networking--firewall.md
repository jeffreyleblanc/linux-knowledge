# Firewalls

## Using `ufw` to Manage

Basics:

```sh
# Installation
$ sudo apt-get install ufw
$ type ufw
#> ufw is /usr/sbin/ufw

# Check status and enable/disable
$ sudo ufw status
$ sudo ufw enable
$ sudo ufw disable

# To allow/deny a port
$ sudo ufw allow 8000
$ sudo ufw deny 8000

# To delete a rule for a port
$ sudo ufw delete deny 8000
```

For more:

* <https://wiki.ubuntu.com/UncomplicatedFirewall>
* <https://ubuntu.com/server/docs/security-firewall>
* <https://wiki.archlinux.org/title/Uncomplicated_Firewall>

