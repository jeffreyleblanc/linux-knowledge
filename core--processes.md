# Processes


## Overall

Some notes (needs review and update):

* Processes 'fork'. On linux process id '1' is `/sbin/init` and it
  is the root of the process tree.
* Processes can be tracked out of `/proc`.

## PS

`ps` is the basic way to look at processes. It has duplicate flag options which I'll parse out a bit better in the future.

Some basic commands:

```sh
# See all processes with lots of information
$ ps aux
# Alternative flags that shows full command line
$ ps -efww
# Foolproof way to search for processes
$ ps -efww | grep <search_term>

# See all processes owned by user
$ ps -U <user>

# Look at a specific pid
$ ps <pid>
# Look at a list of pid
$ ps -p <pid>,<pid>,...

# See processes in a rough tree (pstree is an alt)
$ ps -efH
```

## Pgrep

`pgrep` provides a nice interface for looking at processes:

```sh
# Search for command
$ pgrep <command>
# Example
$ pgrep tmux

# Search against full command line pattern
$ pgrep -f "tmux new -s"
```

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


