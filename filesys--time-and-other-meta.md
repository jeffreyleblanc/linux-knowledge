# File Time and Other Meta Data

## Details

There are 3 kind of "timestamps":

* `atime`, Access - the last time the file was read
* `mtime`, Modify - the last time the file was modified (content has been modified)
* `ctime`, Change - the last time meta data of the file was changed (e.g. permissions)
    * This is also updated whenever `mtime` is updated
* There is also often `Birth` (for example with ext4)


## Viewing Timestamps

`stat` can show full file details:

```sh
$ stat E.txt
#>   File: E.txt
#> --snip--
#> Access: 2023-04-10 12:02:47.219340289 -0400
#> Modify: 2018-08-08 01:23:00.000000000 -0400
#> Change: 2023-04-10 12:02:17.668846407 -0400
#>  Birth: 2023-04-10 11:52:28.059086726 -0400
```

`ls` uses `mtime` by default unless otherwise directed:

```sh
$ ls -l E.txt
#> -rw-r--r-- 1 myuser myuser 10 Aug  8  2018 E.txt

# By default ls uses mtime
$ ls -l E.txt
#> -rw-r--r-- 1 myuser myuser 10 Aug  8  2018 E.txt

# We can also have ls list the full time
$ ls --full-time E.txt
#> -rw-r--r-- 1 myuser myuser 10 2018-08-08 01:23:00.000000000 -0400 E.txt

# Finally, we can use different timestamps
$ ls --full-time --time=atime E.txt
#> -rw-r--r-- 1 myuser myuser 10 2023-04-10 12:02:47.219340289 -0400 E.txt
$ ls --full-time --time=ctime E.txt
#> -rw-r--r-- 1 myuser myuser 10 2023-04-10 12:02:17.668846407 -0400 E.txt
$ ls --full-time --time=birth E.txt
#> -rw-r--r-- 1 myuser myuser 10 2023-04-10 11:52:28.059086726 -0400 E.txt
```

Also note that `ls -l` will abbreviate timestamps based on their recency.


## Move and Copy Impacts

**FILL IN**


## Modifying Timestamps

`touch` can change mtime directly with:

```sh
$ touch -t YYYYMMDDhhmm[.ss] FILE

# For example to change E.txt mtime to 2017-08-09 T 13:15
$ touch -t 201708091315 E.txt
```

This will change `ctime` as well, but to the actual time `touch` was run, **not** the time `touch` set for `mtime`.

