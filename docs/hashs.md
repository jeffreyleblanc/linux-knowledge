# Hashes

## Calculating

For basic calculation of the hashes of a file:

```sh
$ md5sum <file_path>
$ shasum -a 1 <file_path>
$ shasum -a 256 <file_path>
$ shasum -a 384 <file_path>
$ shasum -a 512 <file_path>
```

Note also that there are purpose named sha commands as well:

```sh
$ ls /usr/bin/sha*sum
#> /usr/bin/sha1sum    /usr/bin/sha256sum  /usr/bin/sha512sum
#> /usr/bin/sha224sum  /usr/bin/sha384sum  /usr/bin/shasum
```

One of the things that can be annoying with the above commands, is that
the name of file is printed after the hash. There are a couple of ways
to deal with that on the command line if you want:

```sh
$ shasum -a 256 LICENSE
#> a1c966f4f2dbb7cf2c73969b4782a9ec85846b08ecffa16752ab695a976a31c1  LICENSE

$ shasum -a 256 LICENSE | cut -d " " -f 1
#> a1c966f4f2dbb7cf2c73969b4782a9ec85846b08ecffa16752ab695a976a31c1

$ hold=($(shasum -a 256 LICENSE)) && echo $hold
#> a1c966f4f2dbb7cf2c73969b4782a9ec85846b08ecffa16752ab695a976a31c1
```


