# Fd

`fd` is alternative to `find`, and a bit nicer to use.
On Debian/Ubuntu `fdfind` is used instead of `fd`.

Source is at <https://github.com/sharkdp/fd>

```sh
# On Debian/Ubuntu do the following:
$ sudo apt-get install fd-find
$ fdfind -h
```

To look for hidden files:

```sh
$ fdfind -H .gitignore
```

