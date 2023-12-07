# Grimshot

Grimshot is a wrapper for taking screenshots in wayland.
Install with:

```sh
$ sudo apt-get install grimshot
```

## Example Usage

`grimshot usage` provides an excellent overview.
A few simple examples to get started with:

```sh
# Select an area to save into ~/Pictures
$ grimshot save area

# Save to a specific file
$ grimshot save screen /tmp/my-screen-now.png
```

## More Details

Grimshot is based on a couple other tools:

* Grim is base tool
    * usage: <https://sr.ht/~emersion/grim/>
* Grimshot is a wrapper
    * <https://manpages.ubuntu.com/manpages/jammy/man1/grimshot.1.html>
        * Look at sway example key bindings
    * <https://github.com/swaywm/sway/blob/master/contrib/grimshot>
    * it also uses jq and slurp:
    * <https://github.com/emersion/slurp>


