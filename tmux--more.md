# More Tmux

## Capturing Output on a Pane

To capture the whole pane this is run in and output to a file:

```sh
$ tmux capture-pane -pJ -S -1000000 > /tmp/tmux-history1.txt
```

See `man tmux` then search for `capture-pane` for more options.


## Flags

```sh
-L      specify socket_name
-S      specify socket_path
```

## File and Processes

```sh
$ tmux new -s code

$ ls /tmp/tmux-1000/
#> default

$ ps aux | grep tmux
#> lists twice?

```

## Structure

* server
* session
* window
* pane

