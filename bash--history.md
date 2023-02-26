# Bash History

## Improving History

This is a *draft*.

In `~/.bashrc` ensure the following:

```sh
# The lines of history stored in memory
HISTSIZE=5000
# Lines of history stored in file
HISTFILESIZE=10000
# Add datestamp to the history
HISTTIMEFORMAT="%F  "
# Ensure we are appending to history
shopt -s histappend
```

If you want to immediately append to history and allow for terminals to share history, you can also add  the following:

```sh
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
```

It's not clear we want this, but worth trying. This is pattern is from  <https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps>.


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

