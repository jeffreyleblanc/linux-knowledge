# Listing open ports

The following shows how to examine what ports are in use and what processes
are using them.

## INBOX

Looking for actively bound ports:

```sh
$ lsof -iPn | grep LISTEN

$ netstat -tulpn | grep LISTEN
```


## Examples

```sh
$# lsof -nP -iTCP -sTCP:LISTEN
# COMMAND   PID     USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
# sshd      425     root    3u  IPv4  12465      0t0  TCP *:22 (LISTEN)
# sshd      425     root    4u  IPv6  12476      0t0  TCP *:22 (LISTEN)
# nginx     468     root    6u  IPv4  10151      0t0  TCP *:80 (LISTEN)
# nginx     468     root    7u  IPv6  10152      0t0  TCP *:80 (LISTEN)
# nginx     468     root    8u  IPv4  10153      0t0  TCP *:443 (LISTEN)
# nginx     470 www-data    6u  IPv4  10151      0t0  TCP *:80 (LISTEN)
# nginx     470 www-data    7u  IPv6  10152      0t0  TCP *:80 (LISTEN)
# nginx     470 www-data    8u  IPv4  10153      0t0  TCP *:443 (LISTEN)
# nginx     472 www-data    6u  IPv4  10151      0t0  TCP *:80 (LISTEN)
# nginx     472 www-data    7u  IPv6  10152      0t0  TCP *:80 (LISTEN)
# nginx     472 www-data    8u  IPv4  10153      0t0  TCP *:443 (LISTEN)
# postgres 6035 postgres    5u  IPv6  43846      0t0  TCP [::1]:5432 (LISTEN)
# postgres 6035 postgres    6u  IPv4  43847      0t0  TCP 127.0.0.1:5432 (LISTEN)

$# ss -tunlp
# Netid    State     Recv-Q    Send-Q         Local Address:Port         Peer Address:Port    Process
# udp      UNCONN    0         0                    0.0.0.0:68                0.0.0.0:*        users:(("dhclient",pid=4074,fd=9))
# udp      UNCONN    0         0                    0.0.0.0:68                0.0.0.0:*        users:(("dhclient",pid=309,fd=9))
# udp      UNCONN    0         0                    0.0.0.0:68                0.0.0.0:*        users:(("dhclient",pid=310,fd=9))
# tcp      LISTEN    0         128                  0.0.0.0:22                0.0.0.0:*        users:(("sshd",pid=425,fd=3))
# tcp      LISTEN    0         244                127.0.0.1:5432              0.0.0.0:*        users:(("postgres",pid=6035,fd=6))
# tcp      LISTEN    0         511                  0.0.0.0:443               0.0.0.0:*        users:(("nginx",pid=472,fd=8),("nginx",pid=470,fd=8),("nginx",pid=468,fd=8))
# tcp      LISTEN    0         511                  0.0.0.0:80                0.0.0.0:*        users:(("nginx",pid=472,fd=6),("nginx",pid=470,fd=6),("nginx",pid=468,fd=6))
# tcp      LISTEN    0         128                     [::]:22                   [::]:*        users:(("sshd",pid=425,fd=4))
# tcp      LISTEN    0         244                    [::1]:5432                 [::]:*        users:(("postgres",pid=6035,fd=5))
# tcp      LISTEN    0         511                     [::]:80                   [::]:*        users:(("nginx",pid=472,fd=7),("nginx",pid=470,fd=7),("nginx",pid=468,fd=7))
```


## To incorporate

```sh
$ which netstat
$ netstat -ltnp | grep -w ':80'
$ netstat -ltnp | grep -w ':5911'
# Using netstat to look at open ports:
$ sudo netstat -4lpn | grep ssh
```

---

```sh
$ lsof -i :5911
$ lsof -i :80
$ lsof -i :443
# `lsof -p $process_name` will list what ports are in use if any
```
