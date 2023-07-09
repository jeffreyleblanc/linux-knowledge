# Some `ls` patterns

```sh
# sort by time new -> old
$ ls -t -1

# sort old -> new
$ ls -tr -1

# Only list hidden files/folders:
$ ls -ld .?*

# Quote entries and separate with commas
$ ls -mQ .

# Recursively list directories in chunks
$ ls -R .

# List all files including `.` and `..`
$ ls -a .

# List all files but exclude `.` and `..`
$ ls -A .
```

