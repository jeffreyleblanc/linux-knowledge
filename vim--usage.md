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
    ctrl [      exit insert mode to command mode
    esc         exit insert mode to command mode
    shift V     enter line selection mode
    shift v     enter character selection mode

2. Insert mode
--------------

    ctrl o      will let you execute 1 command and then
                go back to insert mode
    ctrl p      brings up a list of potential word completions
                use up/down to select the replacement

3. Command mode document interaction
------------------------------------

3.1 Actions

    dd          delete current line
    dw          delete current word
    p           paste focus (starting in a line below)

3.2 Movement and Cursor Placement

    0           to start of line
    _ or ^      to first non whitespace of line
    $           to end of line (in practice 1 from end of line)
    w           forward a word
    b           backwards a word

    A           go to end of line and enter insert mode (append)
    I           go to start of line (non whitespace) and enter insert mode

    :N          jump to line N
    gg          to top of document
    G           to end of document

    ctrl b      move back full screen
    ctrl f      move forward full screen
    ctrl d      move forward half screen
    ctrl u      move back half screen

    zz          center cursor on screen
    zt          cursor at top of screen
    zb          cursor at bottom of screen

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
    :e          reload the current buffer from disk

6. Windows
----------

    C-w v           split vertically
    C-w s           split horizontally
    C-w q           close focus window
    C-w arrow       move between windows

Note that when you split a window, the new window
has the original buffer. To get a new file in the new
window use :e or :bN

7. Search and Replace
---------------------

Search

    1. type `/search-term`
    2. enter
    3. use 'n' / 'N' to move through the matches
    4. on a given selection you can enter insert mode with 'i'

Other notes

    :noh            clear highlighting from search

Replace

    :%s/old/new/g   replace all old with new in file
    :%s/old/new/gc  replace all old with new in file with confirmations

8. Vim Commentary
-----------------

In command mode

    gcc             toggle line comment

With a visual block selection

    gc              toggle per line comments

```

## Next To Figure Out

* use vim shortcuts in sublimetext and/or kate
* more movement
    * better movement to end of line
    * half and full page
    * centering on a line
* insert mode line movements?
* patterns of saving file changes like emacs does by default
* improve search skills/docs
    * also how to enter insert mode on a search item
* improve replace skills/docs
* confirm `:e path` reuses buffers?
* comment/uncomment for selections for:
    * python
    * js
* if can get syntax highlighting within markdown fenced code blocks


