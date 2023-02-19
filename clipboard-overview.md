# Linux Clipboard

## Copy and Paste from command line

``` sh
# Copy current path (or output from the command)
$ pwd | xclip -sel clip

# Copy full text of a file
$ cat $FILE | xclip -sel clip
```

