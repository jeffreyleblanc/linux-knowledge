# IP2


## Controlling interfaces

Bringing an interface down/up

```sh
$ ip link set dev enp1s0 down
$ ip link set dev enp1s0 up
```


## Commands to explore / unpack

Commands to try:

    7427  ip link show
    7428  ip bridge link show
    7429  bridge link show
    7430  sudo bridge link show
    7431  sudo bridge vlan show
    7432  bridge link
    7433  sudo bridge link
    7434  brctl
    7435  sudo brctl
    7436  sudo brctl show
    7437  sudo bridge fdb show
    7438  sudo bridge mdb show
    7439  ip link show master virbr0
    7440  sudo bridge monitor all
    7441  brctl show
    7442  sudo brctl show
    7443  ip link show
    7444  ip addr snow
    7445  ip addr show
    7446  ip route list
    7447  sudo ip addr show
    7448  ip route list
    7449  ip neigh show
    7450  ip route list -h
    7451  ip route list --help
    7452  ip -h
    7453  sudo ip addr show -j
    7454  sudo ip -j addr show
    7455  sudo ip -j -p addr show
    7457  sudo ip -j -p link show

## Links

* Overviews
    * [Useful basic overview from DO](https://www.digitalocean.com/community/tutorials/how-to-use-iproute2-tools-to-manage-network-configuration-on-a-linux-vps)

