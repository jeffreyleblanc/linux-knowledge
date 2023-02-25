# Processes


## Overall

Some notes (needs review and update):

* Processes 'fork'. On linux process id '1' is `/sbin/init` and it
  is the root of the process tree.
* Processes can be tracked out of `/proc`.


## Pstree

`pstree` is a nicer way to view the relationship amoung processes.
To install `apt-get install pstree`.

Some basic patterns:

```sh
# Show full tree
$ pstree

# Show tree for processes owned by user
$ pstree <user>

# Show tree with root at PID
$ pstree <pid>
# Show the parent chain as well
$ pstree <pid> -s
```

Some additional flags, `man pstree` to see all:

```sh
# Use ascii characters
$ pstree -A

# Show pid for each tree entry
$ pstree -p

# Hide threads in the tree
$ pstree -T

# Color code processes by age
$ pstree -C
```

## Kill

```sh
# Matching against flags:
$ pgrep -f "ssh-agent -s"
$ pkill -f "ssh-agent -s"

```


