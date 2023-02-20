# SSH Basics

This page has basic info on using ssh.

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


