# iPhone and Ubuntu

The following is on 23.04:

* Attach your iPhone via USB
* Your iPhone will ask if you trust the machine
* The iPhone will show up as a mounted device
* The images are accessible on the device in a series of month based folders

**NOTE** For the moment I'm just copying out... I'm not sure you want to delete files via this method.

Also, apparently you can use `gthumb` to pull files off, though I like the directness of the above.

**HOWEVER** The above is not that great, for the following reasons:

* The mounted DCIM main folder is not mounted as proper mounted filesystem, but through some interface
* The main folder contains subfolder that seem to have a rough `YYYY_MM` format, but:
    * There are images from random other dates within each
    * Some files reported `mtime` makes no sense
* The above means it seems hard to clearly download a new block of files from a start to an end date and be certain the metadata is correct

There is probably a way to do this well (likely needing a script of some sort).

For the moment I am grudgingly using `image capture` on the Mac and moving to my Linux machine.
Image capture seems to propely order the files out of the `DCIM` folders.

I also looked at `shotwell` and `gthumb` a bit, but they seem to access the files via the above `DCIM` folders without the intrepretation Image capture is doing, so not great.

