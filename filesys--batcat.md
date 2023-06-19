# Bat Cat

* `cat` with nice syntax highlights.
* Pages by default via `less`.
* When looking at a file in a git repo, will show diffs
    * This seems to happen even if cwd is not in repo
    * `-p` or `-n` suppress this

```sh
$ sudo apt-get install bat
$ batcat myfile.py
# or
$ bat myfile.py

# Get help
$ bat -h
$ bat --help

# Print without line numbers or frame
$ bat -p myfile
# Print with line number but no frame
$ bat -n myfile
# Print all characters
$ bat -A myfile

# View a list of matching files from fd
# (May be other methods)
$ bat $(fd TERM)

# List all understood formats
$ bat -L

# View a file with a specific format
$ bat -l "Apache Conf" my-conf
```

