# Virsh


```sh
# List vm
$ virsh list
$ virsh list --all

# Creating vm
$ virsh create PATH_TO_MACHINE_CONFIG.xml
$ virsh define PATH_TO_MACHINE_CONFIG.xml

# Destroy vm
$ virsh undefine MACHINE --remove-all-storage

# Vm lifecyle
$ virsh shutdown MACHINE
$ virsh start MACHINE
$ virsh destroy MACHINE
$ virsh reboot MACHINE

# Get info on vm
$ virsh domiflist MACHINE
$ virsh dumpxml MACHINE
$ virsh vncdisplay MACHINE
$ virsh dominfo MACHINE
$ virsh domdisplay MACHINE
$ virsh vol-info MACHINE

# Access and edit a vm
$ virsh console MACHINE
$ virsh edit MACHINE

# List info on networks
$ virsh net-list
$ virsh net-info NETWORK
$ virsh net-dhcp-leases NETWORK

# Misc other commands
$ virsh qemu-monitor-command MACHINE info block --hmp
$ virsh snapshot-list
$ virsh snapshot-list MACHINE
$ virsh blockresize PATH_TO_MACHINE_RAW_IMAGE 16G

# Specifying qemu
$ virsh --connect qemu:///system
$ virsh --connect qemu:///system start MACHINE
```



