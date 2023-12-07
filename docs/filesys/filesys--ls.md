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
# Similar but one entry on a line, in a subdir
# though not sure how to get ending commas:
$ ls -1Q subdir/*

# Recursively list directories in chunks
$ ls -R .

# List all files including `.` and `..`
$ ls -a .

# List all files but exclude `.` and `..`
$ ls -A .

# List files with human readable size
$ ls -lsh FILEPATH
```

