# Podman Misc Topics

## Conmon

`conmon` seems to be a program that helps podman containers with networking.
I've seen it go "zombie" even after something like a `podman system reset`.
It will hold various ports, so I've had to:

```sh
$ pkill -9 conmon
```

Certainly works.


