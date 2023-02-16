# Yubikey

## Basic Usage

Assumes you've installed needed dependencies, and in `/etc/ssh/ssh_config` add at the end:

```sh
# Add support for yubikeys
Pkcs11Provider /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so
```

Then you can:

```sh
# Setup
$ ssh-add -s /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so
$ ssh-add -L
# ssh-rsa --snip-- PIV AUTH pubkey
# --may be other keys too--

# Do things

# Remove access
$ ssh-add -e /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so
# Card removed: /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so
```

Convenience functions can be added to `.bashrc`:

```sh
function yadd() { ssh-add -s /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so ; }
function yrem() { ssh-add -e /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so ; }
```

## Getting a CSR From a Existing Key

```sh
$ apt-cache policy yubico-piv-tool
$ sudo apt-get install yubico-piv-tool
$ apt-cache policy yubikey-manager
$ sudo apt-get install yubikey-manager
$ which ykman
```

```sh
$ yubico-piv-tool -a status
# Version:    4.3.3
# Serial Number:  XXX
# CHUID:  XXX
# CCC:    No data available
# Slot 9a:
#     Algorithm:  RSAXXX
#     Subject DN: OU=smartcard, CN=joe.smith@example.com
#     Issuer DN:  O=Acme Inc, CN=Acme CA - Users
#     Fingerprint:    XXX
#     Not Before: Mar 19 18:01:49 2020 GMT
#     Not After:  Mar 18 12:02:19 2021 GMT
# PIN tries left: 3
$ ykman piv export-certificate 9a pub.key
$ openssl x509 -pubkey -in pub.key > signkey.pub
$ yubico-piv-tool -a verify-pin -a request-certificate -s 9a -S '/CN=joe.smith@example.com/OU=smartcard' -i signkey.pub -o csr.pem -v2

**MAYBE:**
$ yubico-piv-tool -a verify-pin -a request-certificate -s 9a -S '/CN=joe.smith@example.com/OU=smartcard/' -i signkey.pub -o csr.pem -v2

# After sending the certificate request to the CA and getting a signed certificate:
$ yubico-piv-tool -a import-certificate -s 9a -i joe-smith.pem
Successfully imported a new certificate.
```

## Helpful Links

* <https://developers.yubico.com/yubico-piv-tool/Actions/key_generation.html>
* <https://forum.yubico.com/viewtopicf6b0.html?p=7658>
* <https://developers.yubico.com/yubikey-manager/>
* <https://github.com/Yubico/yubikey-manager>


