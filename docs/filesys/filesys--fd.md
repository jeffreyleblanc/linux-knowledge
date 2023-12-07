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

More patterns associated with hunting `.DS_Store`

```sh
# Find them, -H needed since a dot file
$ fd -H .DS_Store

# Find but don't look in mirror
$ fd -H .DS_Store -E mirror/

# Find and delete them
$ fd -H .DS_Store -x rm

# Find exact match
# The above also match stuff like: hi.DS_Store-more
$ fd -H "^.DS_Store$"

# Find and pipe to xargs with confirmation on each delete
# Review!
$ fd -H "^.DS_Store$" | xargs -p -I {} rm {}
```

