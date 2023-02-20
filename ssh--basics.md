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

## Basic Topics to add

* general overview of file locations and tools
    * keypairs
        * public and private components
    * client
        * `~/.ssh`
            * `authorized_keys`
            * `known_hosts`
            * keypairs
        * `ssh-keygen`, `ssh-copy-id`, `ssh-agent`, `ssh-add`
    * server
        * `ssh` and `sshd` systemd units
        * `/etc/ssh`
        * server identification certs
* key generation
    * specifying output file name as part of call
    * key size
    * key type
* static key management
    * checking if a keypair is passcode protected
    * changing a keypair passcode
* live key management
    * overview of ssh-agent
        * how start / tell if running
        * envars, `AUTH_SOCK` etc
        * using the same agent from multiple terminals
        * list, add, remove keys with `ssh-add`
    * basics of ssh forwarding
* client config
    * patterns for `~/.ssh/config`
    * enabling pkcs11 keys
* server
    * enforcing no password
    * enforcing no root login
    * sshd management with systemctl
    * listing incoming ssh sessions
    * log file locations
* ssh command
    * specifying which key to use
    * specifying which port to use
    * command patterns

## Advanced Topics to Add (Probably in another file)

* server side restrictions
    * restricting certain users/keys to specific actions only
* ssh command
    * jumping
    * reusing connections
    * tunneling
    * reference to usage with `rsync`
    * more complex command patterns
        * with `sudo/su`
        * with tmux

Unpack difference on Debian of `sshd` vs `ssh`, e.g.

```sh
$ systemctl status ssh
#>  * ssh.service - OpenBSD Secure Shell server
#>  --snip--

$ systemctl status sshd
#> Unit sshd.service could not be found.

$ ls -1 /lib/systemd/system/ssh*
#> /lib/systemd/system/ssh.service
#> /lib/systemd/system/ssh@.service
#> /lib/systemd/system/ssh.socket
```


