# Swaylock

```sh
$ sudo apt-get install swaylock
```

I tried the swayidle config (you have to install swayidle too)
but didn't seem to work.

What seems fine is just run the following (and we can bind a key later if we want)

```sh
$ swaylock -flFe -c 000000
```

When screen is locked black, just start entering pw

You can probably also do a config, but the above is simple and direct

I think a good thing might be:

```sh
alias swayaway='swaylock -flFe -c 000000'
```


