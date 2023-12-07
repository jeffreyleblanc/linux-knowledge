# Machinectl

```sh
# List machines
$ machinectl list
$ machinectl list --all

# List available images
$ machinectl list-images

# Handle a specific machine
$ machinectl status $NAME
$ machinectl show $Name
$ machinectl stop $NAME
$ machinectl start $NAME

# Access a machine
$ machinectl login $NAME
$ machinectl shell $NAME /bin/bash
```

