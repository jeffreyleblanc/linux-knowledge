# More Tmux


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

