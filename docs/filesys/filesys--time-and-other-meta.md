# File Time and Other Meta Data

## Details

There are 3 kind of "timestamps":

* `atime`, Access - the last time the file was read
    * Note that this is not strictly true. Multiple reads may not change `atime`
    * See <https://en.wikipedia.org/wiki/Stat_(system_call)#Criticism_of_atime>
    * See <https://superuser.com/questions/464290/why-is-cat-not-changing-the-access-time>
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

# To format output (see man stat):
$ stat --printf "b %w\na %x\nm %y\nc %z\n" E2.txt
#> b 2023-04-10 14:56:29.584049757 -0400
#> a 2023-04-10 14:54:49.022378999 -0400
#> m 2023-04-10 14:54:32.098098508 -0400
#> c 2023-04-10 14:56:29.584049757 -0400
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

Using `mv` will update just the files `ctime`:

```sh
$ touch Z.txt
$ stat Z.txt
#> --snip--
#> Access: 2023-04-10 14:50:23.514007677 -0400
#> Modify: 2023-04-10 14:50:23.514007677 -0400
#> Change: 2023-04-10 14:50:23.514007677 -0400
#>  Birth: 2023-04-10 14:50:23.514007677 -0400

$ mv Z.txt Z2.txt
$ stat Z2.txt
#> --snip--
#> Access: 2023-04-10 14:50:23.514007677 -0400
#> Modify: 2023-04-10 14:50:23.514007677 -0400
#> Change: 2023-04-10 14:50:39.674271677 -0400 # changed
#>  Birth: 2023-04-10 14:50:23.514007677 -0400
```

`cp` has multiple options but two main ones are:

* no flag: all new times
* `-p`: same `atime` and `mtime`

```sh
# We make a file
$ echo "time" > T.txt
$ stat T.txt
#> Access: 2023-04-10 15:04:46.748380666 -0400
#> Modify: 2023-04-10 15:04:46.748380666 -0400
#> Change: 2023-04-10 15:04:46.748380666 -0400
#>  Birth: 2023-04-10 15:04:46.748380666 -0400

# And copy with no flags, so all times are "new"
$ cp T.txt T2.txt
$ stat T2.txt
#> Access: 2023-04-10 15:05:06.504713343 -0400
#> Modify: 2023-04-10 15:05:06.504713343 -0400
#> Change: 2023-04-10 15:05:06.504713343 -0400
#>  Birth: 2023-04-10 15:05:06.504713343 -0400

# If we copy with -p
# (same as --preserve=mode,ownership,timestamps)
$ cp -p T.txt T3.txt
$ stat T3.txt
#> Access: 2023-04-10 15:05:06.504713343 -0400 # same
#> Modify: 2023-04-10 15:04:46.748380666 -0400 # same
#> Change: 2023-04-10 15:05:23.036991796 -0400 # diff
#>  Birth: 2023-04-10 15:05:23.036991796 -0400 # diff
$ stat T.txt
#> Access: 2023-04-10 15:05:06.504713343 -0400
#> Modify: 2023-04-10 15:04:46.748380666 -0400
#> Change: 2023-04-10 15:04:46.748380666 -0400
#>  Birth: 2023-04-10 15:04:46.748380666 -0400
```


## Modifying Timestamps

To force update a file's `atime`:

```sh
$ touch -a FILE
```

To change a file's `mtime` to a specific time:

```sh
$ touch -t YYYYMMDDhhmm[.ss] FILE

# For example to change E.txt mtime to 2017-08-09 T 13:15
$ touch -t 201708091315 E.txt
```

This will change `ctime` as well, but to the actual time `touch` was run, **not** the time `touch` set for `mtime`.

