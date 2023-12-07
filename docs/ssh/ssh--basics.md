# SSH Basics

This page has basic info on using ssh.

## Inbox

Sometimes your `TERM` profile isn't on a remote machine (e.g. if you have tmux on yours).
This results in weird backspace and tab behavior.

You can force the remote to use a sensible TERM like so:

```sh
$ TERM=screen ssh user@server
```

More on `TERM`: <https://www.gnu.org/software/gettext/manual/html_node/The-TERM-variable.html>


## Super Basic

In this scenario we have a *local* machine and a *server*.
We want to be able to `ssh` into the *server*.
This assumes the *server* has `sshd` installed and running,
and we have a *myuser* account on the *server*

```sh
# On the local machine:
l$ ssh-keygen -b 4096
#> Name the keypair "for-server"
#> choose a passphrase, or not

# Copy the ssh key public over
$ ssh-copy-id -i for-server.pub myuser@server_addr

# Now ssh into the server
l$ ssh -i ~/.ssh/for-server myuser@server_addr
#> you will be prompted for your password

# Now within the server:
s$ sudo nano /etc/ssh/sshd_config
#> use ctrl+w to find 'Password', and make sure you have this:
#>  PasswordAuthentication no
#> then save file

# Finally restart ssh and exit
s$ sudo systemctl restart ssh
s$ exit

# Now try logging back in and it should use your keypair
```

## The client config file

You can make a `~/.ssh/config` file that will specify details on how to connect to various hosts. Some basic options look like:

```
# You can have IP, hostnames, and fqdn in the Host section
Host 123.123.89.89 my-site-hostname
    User siteadmin
    IdentityFile ~/.ssh/my-site
    Port 743

Host another-hostname
    User joe
    IdentityFile ~/.ssh/another-site
```



