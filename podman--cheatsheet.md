# Podman Cheatsheet

```sh
# To list all available base images
podman images -a

# To list all containers
podman ps -a

# See if a container with given name exists
podman container exists $CONTAINER; echo $?

# Example for running a container based off an image
podman run --name=$CONTAINER -dt -v $CONTAINER-shared:/mnt/shared docker.io/library/debian

# To control and attach to containers
podman start $CONTAINER
podman stop $CONTAINER
podman restart $CONTAINER
podman attach $CONTAINER

# To stop and then delete a container
podman stop $CONTAINER
podman rm $CONTAINER

# Example of inspecting a container
podman inspect $CONTAINER | jq '.[0]["Mounts"]'

# Example of running a command from the host
$ podman exec [ FLAGS... ] $CONTAINER [ COMMAND AND ARGUMENTS FOR WITHIN CONTAINER ]
# Common Flags
# -it                   Runs 'interactively', compound of --interactive and --tty
# -e $ENVARS            Such as PYTHONPATH=/root/my-project
# -w $WORKING_PATH      Such as /mnt/shared/explorer-mirror
```

A better way to get a shell on a container that you can exit from normally:

```sh
h$ podman exec -ti <container_name> /bin/bash
c$
# do stuff...
c$ exit
h$
```

