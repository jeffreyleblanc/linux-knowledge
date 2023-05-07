# Bash Aliases

To Do:

* Note use as `~/.bash_aliases`
* How to list them
* Make temporary
* export to shell scripts
* alias vs function

Some commands

```sh
# Make an alias (temporary to the shell)
$ alias myls='ls -1'

# List all aliases
$ alias -p

# Remove an aliad
$ unalias myls

# Define a functions
$ mycd(){ mkdir -p $1 && cd $1 ; }

# List defined function names
$ declare -F

# List functions including bodies
$ declare -f
```

