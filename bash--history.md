# Bash History


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

