# DIG

`dig` is a DNS lookup tool.

## Basic Commands

```sh
$ dig google.com
#>
#> ; <<>> DiG 9.18.1-1ubuntu1.3-Ubuntu <<>> google.com
#> ;; global options: +cmd
#> ;; Got answer:
#> ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 41365
#> ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1
#>
#> ;; OPT PSEUDOSECTION:
#> ; EDNS: version: 0, flags:; udp: 65494
#> ;; QUESTION SECTION:
#> ;google.com.                    IN      A
#>
#> ;; ANSWER SECTION:
#> google.com.             151     IN      A       142.250.72.110
#>
#> ;; Query time: 15 msec
#> ;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
#> ;; WHEN: Fri Mar 17 16:20:34 EDT 2023
#> ;; MSG SIZE  rcvd: 55
#>

# Pull out IP
$ dig google.com | grep -A 1 "ANSWER SECTION"
#> ;; ANSWER SECTION:
#> google.com.             119     IN      A       142.250.72.110
```
