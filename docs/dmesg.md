# Dmesg

Print or update the kernel ring buffer

```sh
# Dump the buffer
$ sudo dmesg

# Dump buffer with readable timestamps
$ sudo dmesg -T

# Inject a message into the buffer
# Can be useful in some debugging scenarios
$ echo "hi" | sudo tee /dev/kmsg

# Filter
$ sudo dmesg -T | grep suspend
```


