# Find and Other File Listing Methods

## Find by File Names

```sh
$ find . -name 'TIME*'
# ./sketch/TIME.md
# ./thinkpad/TIME.md
# --snip--

$ find . -name '*.md'
# ./raw/linux/tomb.md
# ./raw/linux/tty-switching.md
# --snip--
```

## Using Grep

```sh
# Note that we escape the '$'
grep -r "\$G" .

# To search for just files of a certain type:
grep -r --include "*.vue" "\$G" .
```

To review:

* case insenstive
* regex, particullarly word boundaries
* match multiple file types
* multiple matches on a line (likely by chaining grep)
* show line numbers
* just show lines
* just show files (without duplicates)
* Using `git grep`

## Miscellaneous

```sh
## Only list hidden files/folders:
$ ls -ld .?*
```

