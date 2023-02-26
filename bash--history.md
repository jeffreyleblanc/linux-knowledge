# Bash History

## Improving History

This is a *draft*.

In `~/.bashrc` ensure the following:

* `HISTSIZE=5000`
* `HISTFILESIZE=10000`
* `HISTTIMEFORMAT="%F "`
* `shopt -s histappend`
* `export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"`


## Miscellaneous

* Commands that start with a space are not added to bash history
* listing unique commands from bash history:

```sh
$ grep SEARCHTERM ~/.bash_history | sort -u
# or
$ grep SEARCHTERM ~/.bash_history | sort | uniq
```

## Questions/Document

* How to change length of history
* Behavior with multiple terminals/tmux

