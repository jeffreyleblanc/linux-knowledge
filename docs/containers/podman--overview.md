# Podman Overview

Note: Still very rough

## Linux Base Concepts

* 8 Namespaces
    * <https://en.wikipedia.org/wiki/Linux_namespaces>


## Podman Concepts

* container
* pod
    * acts like a "vm" for sub containers
    * overwrites/shares:
        * users
        * process id -- cgroups
        * networking -- subcontainers can use localhost
        * hostname
        * filesystem
    * (HEX)-infra is a container auto made for the pod to hold namespace
    * <https://developers.redhat.com/blog/2019/01/15/podman-managing-containers-pods>
    * <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/building_running_and_managing_containers/assembly_working-with-pods_building-running-and-managing-containers>
* podman network
    * acts like a LAN


