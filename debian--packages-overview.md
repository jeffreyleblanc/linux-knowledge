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

## fix broken
## full upgrade


$ dkpg -L
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
