# Gio Trash

Instead of using `rm` you can:

```sh
$ gio trash $FILEPATH
```

which places the target in `~/.local/share/Trash/files/`


## Details

```sh
$ file ~/.local/share/Trash/files/
# .local/share/Trash/files/: directory
$ ls -al ~/.local/share/Trash/files/*toss*
# ls: cannot access '.local/share/Trash/files/*toss*': No such file or directory
$ touch toss-away.txt
$ ls *toss*
# toss-away.txt
$ gio trash toss-away.txt
$ ls *toss*
# ls: cannot access '*toss*': No such file or directory
$ ls -al ~/.local/share/Trash/files/*toss*
# -rw-r--r-- 1 joesmith joesmith 0 Aug  8 10:58 .local/share/Trash/files/toss-away.txt
```

More details at <https://developer.gnome.org/gio/stable/gio.html>

