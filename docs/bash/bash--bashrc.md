# Dot bashrc

I typically make customizations off of `~/.bashrc`.

## Basic Structure

I will leave `.bashrc` mostly as is but add the following at the bottom:

```sh
## Custom ###########################################################

# Set umask to 0022 (meaning by default groups cannot execute)
umask 0022

# Pickup contents of ~/.bashrc.d
# UPDATE: we should check if the directory exists
for FILE in ~/.bashrc.d/*.sh; do source "$FILE"; done
```

And then in `~/.bashrc.d/` you can make files like:

`custom.sh` for commands

```sh
# tmux helpers
function tmn(){ tmux new -s $1 "${@:2}"; }
function tmnf(){ tmux new "$@" -s $(uuidgen); }
function tml(){ tmux ls; }
function tma(){ tmux a -t $1; }
function tmk(){ tmux kill-session -t $1; }

# clipboard
function xcp(){ xclip -sel clip; }
function here(){ pwd | xcp; }

# system
export LIBVIRT_DEFAULT_URI="qemu:///system"
```

`places.sh`

```sh
export PODMAN_VOLS=$HOME/.local/share/containers/storage/volumes
```

You can set file permissions on these as you like.


