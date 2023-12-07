# Notes on Debian Installation

## Flavors

There are a large number of available installers, the main relevant ones I find (for *testing*), are:

* netinst: a very basic installation good for servers and virtual machines
* normal: includes window managers etc
* normal non-free: includes non-free drivers you might need for a laptop etc

Links:

* The main *testing* download page: <https://www.debian.org/devel/debian-installer/>
    * Link to download the netinst image which is a minimal install: <https://cdimage.debian.org/cdimage/bookworm_di_alpha2/amd64/iso-cd/debian-bookworm-DI-alpha2-amd64-netinst.iso>
    * Link to the download page for a full installation: <https://cdimage.debian.org/cdimage/bookworm_di_alpha2/amd64/iso-dvd/>
* One of the issues with the above links is they don't include non free firmware. If you want that, following links from:
    * <https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/>

Confusingly, as of bookworm alpha 2, the non free page claims the standard download includes firmware, but that page still indicates it doesn't.

