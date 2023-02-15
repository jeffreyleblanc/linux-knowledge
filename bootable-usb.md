# Making a bootable Linux USB stick

## TDLR

Do the following once you have your `iso`:

```sh
# Double check device
$ sudo fdisk -l
    # Likely the USB will be /dev/sdb, but make sure

# Write it
$ sudo dd if=$ISO_PATH of=$DEV_PATH oflag=direct  bs=1048576

# So for example with the dev path:
$ sudo dd if=$ISO_PATH of=/dev/sdb oflag=direct  bs=1048576
    # Will take 2-3 minutes
```

To boot it, you may need to either set the BIOS to load USB devices first, or hold the `esc` key if the machine already has the `grub` bootloader installed.


## Longer Explanation

### 1) Make sure you know which device to write to

Without the USB stick in:

```sh
$ sudo fdisk -l
# Disk /dev/sda: 21.5 GB, 21474836480 bytes
# 255 heads, 63 sectors/track, 2610 cylinders, total 41943040 sectors
# Units = sectors of 1 * 512 = 512 bytes
# Sector size (logical/physical): 512 bytes / 512 bytes
# I/O size (minimum/optimal): 512 bytes / 512 bytes
# Disk identifier: 0x00011a0f
#
#   Device Boot      Start         End      Blocks   Id  System
# /dev/sda1   *        2048    39845887    19921920   83  Linux
# /dev/sda2        39847934    41940991     1046529    5  Extended
# /dev/sda5        39847936    41940991     1046528   82  Linux swap / Solaris
```

And then with the stick in:

```sh
$ sudo fdisk -l
# Disk /dev/sda: 21.5 GB, 21474836480 bytes
# 255 heads, 63 sectors/track, 2610 cylinders, total 41943040 sectors
# Units = sectors of 1 * 512 = 512 bytes
# Sector size (logical/physical): 512 bytes / 512 bytes
# I/O size (minimum/optimal): 512 bytes / 512 bytes
# Disk identifier: 0x00011a0f
#
#   Device Boot      Start         End      Blocks   Id  System
# /dev/sda1   *        2048    39845887    19921920   83  Linux
# /dev/sda2        39847934    41940991     1046529    5  Extended
# /dev/sda5        39847936    41940991     1046528   82  Linux swap / Solaris
#
# Disk /dev/sdb: 4004 MB, 4004511744 bytes
# 255 heads, 63 sectors/track, 486 cylinders, total 7821312 sectors
# Units = sectors of 1 * 512 = 512 bytes
# Sector size (logical/physical): 512 bytes / 512 bytes
# I/O size (minimum/optimal): 512 bytes / 512 bytes
# Disk identifier: 0x00000000
#
#   Device Boot      Start         End      Blocks   Id  System
# /dev/sdb1               2     7821311     3910655    7  HPFS/NTFS/exFAT]
```

So its pretty clear /dev/sdb is our stick.

### 2) Writing

Do this, replacing with proper device path:

```sh
$ sudo dd if=~/Desktop/linuxmint.iso of=/dev/sdx oflag=direct  bs=1048576
```

So for example for the above I do:

```sh
$ sudo dd if=~/Desktop/linuxmint.iso of=/dev/sdb oflag=direct  bs=1048576
# ... time will elapse ...
#
# 881+0 records in
# 881+0 records out
# 923795456 bytes (924 MB) copied, 171.316 s, 5.4 MB/s
```

And it will have worked

