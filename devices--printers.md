# Using Printers

state: **MOLTEN**
note: Also review `cups`

In general with Debian/Ubuntu, the printer gui is pretty decent.
But what about using the command line?
Common programs are `lpr`,`lp`,`lpq`, and `lpstat`

To see what printers available:

```sh
$ lpstat -a
# Or:
$ lpq -a
```

To print (Note `lp` and `lpr` seem roughly equivilant):

```sh
# Get options
$ man lp

# Basic print
$ lp file-path

# Number of copies
$ lp -n 3 file-path

# Pages to print
$ lp -p "1,3-8,17"

# Common options, `man lp` to review:
-o media-size=          "legal","a4",...
-o number-up=           2,4,6,... number pages on a side
-o print-quality=
-o orientation-requested=
-o sides=...

# lpr has `-h` for no banner... what about lp?
```


