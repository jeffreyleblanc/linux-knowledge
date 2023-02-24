# SSH Agent


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

