# SSH Agent

**NOTE**: Lot's of missing info here

## Forwarding Issues

I've noticed that if you forward and into a remote and then join a tmux there:

```sh
l$ ssh -A myuser@myremote
r$ tmux a -t mysess
r$ echo SSH_AUTH_SOCK
#> Old and stale
```

So you need to determine the new path to the socket, of form
`/tmp/ssh--HASH--/agent--etc`, and `export SSH_AUTH_SOCK=the/path`

Note that `SSH_AGENT_PID` is not set on the remote since there isn't
a `ssh-agent` running there.


## Setup

In `~/.bashrc` you can consider something like:

```sh
## Handle ssh-agent ###########################################################

# In my case something was starting `ssh-agent -s`, so we kill it if it exists.
pkill -f "ssh-agent -s"

# Start ssh-agent if not running, and store the agent info in a common file
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    echo "Setting up ssh-agent"
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi

# If we have no auth sock, load it from common file
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    echo "Using existing ssh-agent"
    eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")"
fi

##############################################################################
```

