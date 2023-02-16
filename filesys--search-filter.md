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

## Miscellaneous

```sh
## Only list hidden files/folders:
$ ls -ld .?*
```

