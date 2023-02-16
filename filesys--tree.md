# Tree

## Usage Overview

```sh
# Only show 2 levels deep
$ tree -L 2

# Output in only ascii
$ tree --charset=ascii

# Print all files, including dot files
$ tree -a
```

Additional useful flags

```
   -h     Print the size of each file but in a more human readable way, e.g.  append‐
          ing  a  size  letter  for kilobytes (K), megabytes (M), gigabytes (G), ter‐
          abytes (T), petabytes (P) and exabytes (E).

   --si   Like -h but use SI units (powers of 1000) instead.

   --du   For each directory report its size as the accumulation of sizes of all  its
          files  and  sub-directories (and their files, and so on).  The total amount
          of used space is also given in the final report (like the 'du -c' command.)
          This option requires tree to read the entire directory tree before emitting
          it, see BUGS AND NOTES below.  Implies -s.

   -D     Print the date of the last modification time or if -c  is  used,  the  last
          status change time for the file listed.

   -F     Append  a `/' for directories, a `=' for socket files, a `*' for executable
          files, a `>' for doors (Solaris) and a `|' for FIFO's, as per ls -F
```

Using tree in a programmatic way to output json and fullpaths:

```sh
# Output as json with full filepaths
$ tree ../public -J -f
# [
#   {"type":"directory","name":"../public","contents":[
#     {"type":"directory","name":"../public/linux","contents":[
#       {"type":"file","name":"../public/linux/bash-history.md"},
#       {"type":"file","name":"../public/linux/bluetooth.md"},
# --snip--
```

