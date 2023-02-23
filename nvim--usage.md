# Vim Usage

## Key Binding Basics

I'm trying to get more adept, but so far the following makes using
vim decent. Thus below is **NOT** complete.

```
1. Modes
--------------------

1.1 About

Vim uses modes to handle interaction. Some of the main modes are:

    command mode        you can execute various commands
    insert mode         like normal typing
    selection mode      you can select chunks of text and then
                        execute commands on them.
                        there is a line and character version

1.2 Managing Mode

    i           enter insert mode
    ctrl-[      exit insert mode to command mode
    esc         exit insert mode to command mode
    shift-V     enter line selection mode
    shift-v     enter character selection mode

2. Insert mode
--------------

    ctrl+o      will let you execute 1 command and then
                go back to insert mode

3. Command mode document interaction
------------------------------------

3.1 Actions

    dd          delete current line
    dw          delete current word
    p           paste focus (starting in a line below)

3.2 Movement

    0           to start of line
    $           to end of line
    w           forward a word
    b           backwards a word
    :N          jump to line N
    gg          to top of document
    G           to end of document

3.3 Commands

    :u          undo

4. Selection mode
-----------------

    y           copy selection
    d           cut selection
    shift >     indent selection
    shift <     dedent selection

5. Management
-------------

5.1 Saving and Quitting

    :w          write changes to disk
    :q          quit
    :wq         write and quit
    :q!         quit and don't save changes

5.2 Buffer Management

    :pwd        see root working directory buffers extend
    :ls         list all buffers
    :bN         go to buffer N
    :bn         go to next buffer
    :bp         go to previous buffer
    :bd         close current buffer (if saved)
    :e path     open buffer on path
```

## Next To Figure Out

* more movement
    * half and full page
    * centering on a line
* patterns of saving file changes like emacs does by default
* improve search skills/docs
    * also how to enter insert mode on a search item
* improve replace skills/docs
* confirm `:e path` reuses buffers?
* comment/uncomment for selections for:
    * python
    * js
* if can get syntax highlighting within markdown fenced code blocks


