# Tmux

## Managing Sessions

```sh
# List available sessions
$ tmux ls

# Make a new named session
$ tmux new -s NAME

# Attach to an existing name session
$ tmux a -t NAME
```

## Key Mappings

```
Within tmux

<C> = ctrl+b or ctrl+a

Sessions
--------

    <C> $           rename current session
    <C> d           detach from session

Windows
-------

    <C> c           create a new window in current session
    <C> ,           rename current window
    <C> <NUMBER>    switch to that window index
    <C> n           next window
    <C> p           prev window
    <C> &           kill current window

Panes
-----

    <C> |           split pane into left/right (custom)
    <C> -           split pane into top/bottom (custom)
    <C> %           split pane into left/right
    <C> "           split pane into top/bottom
    <C> arrow       move around panes
    alt+arrow       move to pane (custom)
    <C> }           switch current and last pane
    <C> space       switch pane layout style
    <C> z           focus/unfocus pane
    <C> x           kill pane (y/n prompt)
    <C> q           display pane indices
    <C> space       toggle amoung pane layouts
                    note: may lose nested layouts
    <C> alt arrow   resize pane

Copy mode (Need to review)
--------------------------

    <C> [           enter copy mode
    <C> space       start copy mark
    y               grab selection to clipboard
    q               exit copy mode
    # If global clipboard fails
    ctrl w          copy selection
    <C> ]           paste selection

More
----

    <C> ?           List all keybindings, 'q' to quit menu
    <C> =           List buffer selections: usefulness TBD
```


## Miscellaneous

### Understanding the status bar

On the lower left:

```
[<session-name>] 0:<window-name-1>- 1:<window-name-2>*

where * signifies the current focus window
each entry is <idx>:<window-name>
```

### Moving a pane to another window

1) break it out with `ctrl+a !`
2) move to index of desired window

* `ctrl+a :`
* on command line `join-pane -t <idx>`
* can include `-h` or `-v` to specify how to join

