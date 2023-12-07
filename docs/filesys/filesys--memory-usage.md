# Examining Memory Usage

## Tool oveview

* `df` => see disk space usage for whole machine
* `du` => see disk space for directories
* `free` => see 'RAM' usage

Looking at the overall file system

```sh
## Show overall disk utilization in a human readble form
$ df -h
# Filesystem                 Size  Used Avail Use% Mounted on
# tmpfs                      1.6G  2.1M  1.6G   1% /run
# /dev/mapper/vgubuntu-root  915G   32G  837G   4% /
# tmpfs                      7.7G  684K  7.7G   1% /dev/shm
# tmpfs                      5.0M  4.0K  5.0M   1% /run/lock
# /dev/nvme0n1p2             704M  245M  408M  38% /boot
# /dev/nvme0n1p1             511M   11M  501M   3% /boot/efi
# tmpfs                      1.6G  120K  1.6G   1% /run/user/1000

## Show the file system type
$ df -hT
# Filesystem                Type   Size  Used Avail Use% Mounted on
# tmpfs                     tmpfs  1.6G  2.1M  1.6G   1% /run
# /dev/mapper/vgubuntu-root ext4   915G   32G  837G   4% /
# --snip--

## Show filesystem info for a given path
$ df -hT /home/jsandbox/
# Filesystem                Type  Size  Used Avail Use% Mounted on
# /dev/mapper/vgubuntu-root ext4  915G   32G  837G   4% /
```

Looking at Directories

```sh
$ pwd
# /home/myuser/code
$ ls -1
# knowledge
# proj1
# proj2
# --snip--

## List usage of current directory
$ du -sh .
# 169M    .

## List usage of a specific path
$ du -sh knowledge/
# 85M     knowledge/

## List usage of multiple paths
$ du -sh knowledge/ proj1/ proj2/
# 85M     knowledge/
# 53M     proj1/
# 708K    proj2/

## Lists recursive usage
$ du -h knowledge/ | head
# 768K    knowledge/raw/linux/how-linux-works-book-notes/linux
# 8.0K    knowledge/raw/linux/how-linux-works-book-notes/linux-html/_support
# 8.0K    knowledge/raw/linux/how-linux-works-book-notes/linux-html/output/css
# 360K    knowledge/raw/linux/how-linux-works-book-notes/linux-html/output
# 376K    knowledge/raw/linux/how-linux-works-book-notes/linux-html
# --snip--

## Look at directories to a certain depth and sort by size
$ du -h --max-depth=2 | sort -hr
# 169M    .
# 85M     ./knowledge
# 53M     ./proj1
# --snip--
# 8.0M    ./web-ui/vanilla
# 7.0M    ./web-ui/.git
# --snip--
```

Also see use of `-c` flag

Looking at RAM and swap

```sh
$ free -h
#                total        used        free      shared  buff/cache   available
# Mem:            15Gi       861Mi        12Gi       761Mi       2.1Gi        13Gi
# Swap:          975Mi          0B       975Mi
```

