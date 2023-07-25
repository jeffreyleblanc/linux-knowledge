# Bash Shell Prompt

You can set the prompt like:

```sh
$ PS1="myprompt$ "
myprompt$ echo "there we are"
```

I like to have a simple shell function:

```sh
ps1 (){ PS1="$1$ " }
```

A few notes:

```sh
$ ps1 "\w"
#> prompt becomes full path

$ ps1 "\W"
#> prompt is name of current directory
```

