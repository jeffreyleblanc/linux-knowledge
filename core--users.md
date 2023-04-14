# Linux Users

## Basic Commands

Checking on your current user

```sh
# Check your username
$ whoami
#> myname

# Get information about your uid, gid, and groups
$ id
#> uid=1000(myname) gid=1000(myname) groups=1000(myname),4(adm),
#> --snip--

# Change your password
$ passwd
```

Making new users

```sh
# Making a new user
$ sudo adduser USERNAME

# Adding a user to a group (sudo for example)
$ sudo usermod -aG sudo USERNAME
```

Note there is also a lower level `useradd`, though `adduser` is preferred.

Removing users

```sh
$ deluser --remove-home USERNAME
```

