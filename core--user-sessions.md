# User Sessions

How to determine who else is logged into a machine:

```sh
# To get the TTY of your current session
$ ps -q $$ -o tname=

# Note that if a user is using a tmux session
# each pane will have its own pseudo terminal listed

# To list other users using `w`
$ w

# Or who with all the fixings
$ who -Hu

# Or using last but only show current
$ last | grep "still logged in"

# List all ssh connections
$ ss | grep ssh
```


