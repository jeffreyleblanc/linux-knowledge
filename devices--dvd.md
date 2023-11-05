# DVD on Linux

I have a [LG GP65NB60 Slim Portable DVD Writer](https://www.lg.com/us/burners-drives/lg-gp65nb60-ultra-slim-external-dvd-drive),
which may not be available anymore, but there are many similar products.

For access data, it works just fine. To play DVD movies (say from library), I use VLC and do the following:

* `sudo apt-get install libdvd-pkg`
* `sudo dpkg-reconfigure libdvd-pkg`
* From <https://www.videolan.org/developers/libdvdcss.html>

The whole experience in VLC is a little clunky to get through menus to actual film, but it works fine overall.


