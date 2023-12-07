# Linux Clipboard

## Wayland Copy/Paste

Copy:

```sh
# Copy a string
$ wl-copy Hello world!

# Copy output of a command
$ ls ~/Downloads | wl-copy

# Copy file
$ wl-copy < ~/Pictures/photo.png
$ wl-copy < ~/some-text.xt

# Clear clipboard
$ wl-copy -c
```

Paste:

```sh
# Paste clipboard into file
$ wl-paste > clipboard.txt

# List the type the clipboard is
$ wl-paste --list-types
```


## Copy and Paste from command line

``` sh
# Copy current path (or output from the command)
$ pwd | xclip -sel clip

# Copy full text of a file
$ cat $FILE | xclip -sel clip
```

## Notes

[Arch clipboard notes](https://wiki.archlinux.org/title/clipboard)
