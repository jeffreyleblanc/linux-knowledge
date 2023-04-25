# Debian/Ubuntu Package Management Overview

## Basics

Note that most of these commands (the ones that change the system) must be run as root or with sudo.

```sh
$ apt-cache search TERM
$ apt-cache policy PACKAGE

$ apt-get update
$ apt-get install PACKAGE
$ apt-get -y install PACKAGE
$ apt-get remove PACKAGE
$ apt-get purge PACKAGE

$ apt-get upgrade
$ apt-get dist-upgrade


# List files that a package installed
$ dpkg -L PACKAGE

# Determine which package (if any) installed a file
$ dpkg -S /usr/lib/python3/dist-packages/tornado/websocket.py
#> python3-tornado: /usr/lib/python3/dist-packages/tornado/websocket.py
$ dpkg -S random-file.txt
#> dpkg-query: no path found matching pattern *random-file.txt*
```

Download a deb

```sh
$ apt download PACKAGE
#> .deb will be in cwd
```

Determine dependencies

```sh
# Also look at `apt-rdepends`
$ apt show PACKAGE | grep Dependencies

# For a .deb file
$ dpkg -S DEB_FILE | grep Depends
```

Topics to include:

```sh
## fix broken
## full upgrade
$ dpkg -i
$ dpkg -I
$ dpkg -S
```

## Adding Custom Sources

**TBD**

## Overview of how the System Works

```sh
/etc/apt/
    sources.list
    sources.list.d/
        ...
```


## Useful Links

* Overviews:
    * [AptGet/Howto - Community Help Wiki](https://help.ubuntu.com/community/AptGet/Howto)
    * [Chapter 2. Debian package management](https://www.debian.org/doc/manuals/debian-reference/ch02.en.html)
    * [PackageManagement - Debian Wiki](https://wiki.debian.org/PackageManagement)
* Apt Security
    * [SecureApt - Debian Wiki](https://wiki.debian.org/SecureApt)
    * [Excellent CloudFlare blog on the topic](https://blog.cloudflare.com/dont-use-apt-key/)
