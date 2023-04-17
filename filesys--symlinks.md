# SymLinks

## Making Symbolic Links

```sh
# The pattern is:
$ ln -s <source_path> <symlink_path>

# So for example
$ mkdir -p a/b/c/deep-thing
$ ln -s a/b/c/deep-thing my-deep-thing
$ ls -l my-deep-thing
#> --snip--  my-deep-thing -> a/b/c/deep-thing/
```

## Tracking Links

Consider the following where we have a chain of symlinks:

```sh
$ ls -l /usr/bin/convert
#> --snip-- /usr/bin/convert -> /etc/alternatives/convert
$ ls -l /etc/alternatives/convert
#> --snip-- /etc/alternatives/convert -> /usr/bin/convert-im6.q16
$ ls -l /usr/bin/convert-im6.q16
#> --snip-- /usr/bin/convert-im6.q16
```

We can use the following to unpack

```sh
# To go one link down
$ readlink /usr/bin/convert
#> /etc/alternatives/convert

# To follow all the way to end
$ readlink -f /usr/bin/convert
#> /usr/bin/convert-im6.q16
$ readlink -e /usr/bin/convert
#> /usr/bin/convert-im6.q16

# Or to look at the whole chain:
$ namei /usr/bin/convert
#> f: /usr/bin/convert
#>  d /
#>  d usr
#>  d bin
#>  l convert -> /etc/alternatives/convert
#>    d /
#>    d etc
#>    d alternatives
#>    l convert -> /usr/bin/convert-im6.q16
#>      d /
#>      d usr
#>      d bin
#>      - convert-im6.q16
```


## To Document

* What happens when delete the target of the link?
* Using `stat` to look at the link
    * The link is just a file
* Using absolute vs relative paths

