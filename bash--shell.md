# Core Shell Topics

## Terminal Redirection

This refers to piping the output of commands.
Below we use `date` as example command, but this can be anything.

```sh
# To write out to a file (will copy over if exists)
$ date > output.txt

# To append to an existing file (will create if needed)
$ date >> output.txt

# To output to terminal and file (will overwrite file)
$ date | tee output.txt

# To output to terminal and append to file
$ date | tee -a output.txt
```

In the terminal there are 3 streams: 

* `stdin` (channel 0)
* `stdout` (channel 1)
* `stderr` (channel 2)

The above patterns only handle `stdin`. `stderr` is written to when
there is an error in the command, and thus:

```sh
$ ls /yaks-do-not-exist > err.txt
ls: cannot access '/yaks-do-not-exist': No such file or directory
$ cat err.txt
$
# `ls /yaks-do-not-exist | tee -a err.txt` behaves the same
```

Will not capture the output in the file.
However we can redirect stderr into stdin with `2>&1`:

```
$ ls /yaks-do-not-exist 2>&1 | tee -a err.txt
#> ls: cannot access '/yaks-do-not-exist': No such file or directory
$ cat err.txt
#> ls: cannot access '/yaks-do-not-exist': No such file or directory
```

**Question** why doesn't `ls /yaks 2>&1 > err.txt` work?


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

