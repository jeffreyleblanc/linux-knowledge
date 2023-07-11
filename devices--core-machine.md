# Looking at Core Machine Attributes

## Paths and Commands

General information about the machine

```sh
$ sudo dmidecode

# Get just main info
$ sudo dmidecode | grep -A 8 "^System Information"
```

How a machine is hosted and other info:

```sh
# Can help tell if this is a vm or container
$ systemd-detect-virt

# Has a bunch of functionality, but status is very useful
# hostnamectl status
```

OS Version

```sh
$ cat /etc/os-release
```

Memory

```sh
# Looking at memory details
$ cat /proc/meminfo
# Just list total in kB
$ grep MemTotal /proc/meminfo

# To get total memory (RAM)
$ free -h
```

CPU

```sh
# Looking at details
$ cat /proc/cpuinfo
# OR
$ lscpu

# List info on cores
$ lscpu -e

# Output in json
$ lscpu -J
```


