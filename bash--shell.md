# Core Shell Topics

## Understanding Program and Functions

Note the following is within a python venv for greater examples.

```sh
## Using type and which on something in the PATH
$ type pip3
# pip3 is /home/joesmith/code/jknowledge/public/python/venv/bin/pip3
$ which pip3
# /home/joesmith/code/jknowledge/public/python/venv/bin/pip3

## With a declared function
$ type deactivate
# deactivate is a function
# deactivate ()
# {
#    if [ -n "${_OLD_VIRTUAL_PATH:-}" ]; then
#        PATH="${_OLD_VIRTUAL_PATH:-}";
#        export PATH;
# --snip--
$ which deactivate

## Looking at declared value and envars
$ declare -F
# declare -f __expand_tilde_by_ref
# declare -f __get_cword_at_cursor_by_ref
# --snip--
# declare -f deactivate
# --snip--
$ env
# SHELL=/bin/bash
# --snip--
$
```

To add:

* `export`
* `define`
* `echo $PATH`
* setting env for specific function calls
    * e.g. `TERM=screen ssh user@host`
* `alias`
* common/core env

## Stdin and all that

Understand the following as a jumping off point: <https://unix.stackexchange.com/questions/119648/redirecting-to-dev-null>

