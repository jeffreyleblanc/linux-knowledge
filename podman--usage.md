# Podman Usage

## Basic Start

Assume starting from scratch (almost)

Getting general Info:

```sh
# See if have any images downloaded
$ podman images -a

# See if have any containers running
$ podman ps -a
```

And to search for a fetch an image:

```sh
# Search for an image
$ podman image search debian
#> NAME                        DESCRIPTION
#> docker.io/library/ubuntu    Ubuntu is a Debian-based Linux...
#> docker.io/library/debian    Debian is a Linux distribution...
#> --snip--

# Pull an image
$ podman pull docker.io/library/debian

# Now it's listed
$ podman images -a
#> REPOSITORY                TAG         IMAGE ID      CREATED       SIZE
#> docker.io/library/debian  latest      49081a1edb0b  41 hours ago  121 MB
```

Now let's make a basic container:

```sh
# Make a container
$ podman run --name test1 -dt -p 8080:9000 -v test1-shared:/mnt/shared docker.io/library/debian

# We can see it running
$ podman ps -a
#> CONTAINER ID  IMAGE                            COMMAND     CREATED         STATUS             PORTS                   NAMES
#> 3bfe1cce6b98  docker.io/library/debian:latest  bash        1 minutes ago   Up 1 minutes ago   0.0.0.0:8080->9000/tcp  test1

# Now the mounted storage is at the following in the host:
$ ls ~/.local/share/containers/storage/volumes/test1-shared/_data/
# So we can
$ touch ~/.local/share/containers/storage/volumes/test1-shared/_data/hello.txt
# And then within the container
$ podman exec -ti test1 ls /mnt/shared
#> hello.txt

# To get a shell on the container
$ podman exec -ti test1 /bin/bash

# With the debian image, by default we don't get much so:
c$ apt-get update
c$ apt-get install python3

# Now we can test the port mapping by
c$ cd /mnt/shared
c$ python3 -m http.server 9000

# On the host (output condensed)
$ curl localhost:8080
#> <!DOCTYPE HTML>
#> <h1>Directory listing for /</h1>
#> <li><a href="hello.txt">hello.txt</a></li>
```

Let's examine the run command more closely:

```sh
podman run --name test1 -dt -p 8080:9000 -v test1-shared:/mnt/shared docker.io/library/debian

podman run
    --name test1                    assigns name to the container
                                    note the container also gets a uuid
    -d                              detach mode
    -t                              allocated a pseudo-tty for shells
    -p 8080:9000                    map container port 9000 to host port 8080
    -v test1-shared:/mnt/shared     setup a shared volume called test1-shared to /mnt/shared in
                                    container
    docker.io/library/debian        base image to use
```

See also <https://docs.podman.io/en/latest/markdown/podman-run.1.html>


## Todos and Issues

### Overlay

You want to configure podman to use overlays. Check on how to do and confirm this.

### Overlay Error

I was getting this issue <https://github.com/containers/podman/issues/5114>

> User-selected graph driver "overlay" overwritten by graph driver "vfs" from database - delete libpod local files to resolve

I resolved by just `sudo rm -rf ~/.local/share/containers/` but of course do with caution.

