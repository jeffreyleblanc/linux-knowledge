# More Tmux

## Rearranging Windows

You can change a windows number by:

* `ctrl+b/a .`
* type the new number and hit enter

Note you can only assign a window number that doesn't exist, so you might
need to move windows to higher numbers.

So if you have windows `1,2,3,4`, to swap `2` and `3`:

* assign `2` to `9`
* assign `3` to `2`
* assign `9` to `3`

There is probably a smart way to swap, but the above is flexible.


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

