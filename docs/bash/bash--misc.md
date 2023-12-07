# Miscellaneous Bash

## Pretty Error Code

```sh
$ ping google.com -c 1 > /dev/null 2>&1 && echo Y || echo N
#> Y
$ ping google.comQ -c 1 > /dev/null 2>&1 && echo Y || echo N
#> N
```

Where raw output is:

```sh
$ ping google.com -c 1
#> --snip--
#> 1 packets transmitted, 1 received, 0% packet loss, time 0ms
$ echo $?
#> 0

$ ping google.comQ -c 1
#> ping: google.comQ: Name or service not known
$ echo $?
#> 2
```


