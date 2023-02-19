# Less

An overview of using `less` to look at file contents.

## Lookup:

* search highlighting
* search cancel

## Exit

q

## Moving Around

forward:

    enter       1 line
    d           1/2 screen
    space       full screen

back:

    y           -1 line
    u           -1/2 screen
    d           - full screen

full doc:

    g           start of file
    G           end of file

## Search

    /pattern    search forward
    n           keep searching forward

    ?pattern    search backwards
    N           keep searching backwards

    &pattern    only show lines that match pattern


## Line Numbers


`$ less -N file` will show line numbers.

While in less, `-N` will toggle them.

## Colors

`less -R`

