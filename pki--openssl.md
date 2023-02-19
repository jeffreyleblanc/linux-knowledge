# Openssl and PKI


## Example Commands

Getting information:

```sh
## See full details
$ openssl x509 -in cacerts.pem -text

## Get info on all the certs (the command above just handles the first in a file)
$ openssl crl2pkcs7 -nocrl -certfile cacerts.pem | openssl pkcs7 -print_certs -text -noout
$ openssl crl2pkcs7 -nocrl -certfile cacerts.pem | openssl pkcs7 -print_certs -noout

## Get just the enddate
$ openssl x509 -enddate -noout -in local-credentials.pem
```

Using `s_client`

```sh
$ echo | openssl s_client -CAfile ~/cacerts.pem -connect www.example.com:8888 -brief
# CONNECTION ESTABLISHED
# Protocol version: TLSv1.3
# Ciphersuite: TLS_AES_256_GCM_SHA384
# Requested Signature Algorithms: ECDSA+SHA256:ECDSA+SHA384:ECDSA+SHA512:Ed25519:Ed448:RSA-PSS+SHA256:RSA-PSS+SHA384:RSA-PSS+SHA512:RSA-PSS+SHA256:RSA-PSS+SHA384:RSA-PSS+SHA512:RSA+SHA256:RSA+SHA384:RSA+SHA512:ECDSA+SHA224:RSA+SHA224
# Peer certificate: CN = example.com
# Hash used: SHA256
# Signature type: RSA-PSS
# Verification: OK
# Server Temp Key: X25519, 253 bits
# DONE

$ echo | openssl s_client -CAfile ~/cacerts.pem -connect www.example.com:443 -brief
# CONNECTION ESTABLISHED
# Protocol version: TLSv1.3
# Ciphersuite: TLS_AES_256_GCM_SHA384
# Peer certificate: CN = www.example.com
# Hash used: SHA256
# Signature type: RSA-PSS
# Verification: OK
# Server Temp Key: X25519, 253 bits
# DONE


$ echo | openssl s_client -connect example.com:443 2>/dev/null | openssl x509 -noout -ext subjectAltName
# X509v3 Subject Alternative Name:
#     DNS:example.net, DNS:example.com
$ echo | openssl s_client -connect example.com:8888 2>/dev/null | openssl x509 -noout -ext subjectAltName
# X509v3 Subject Alternative Name:
#     DNS:example.com
```


Verification

```sh
## Verify a file against a public cert
$ openssl verify -CAfile cacerts.pem local-credentials.pem
```

## Merge

```sh
# look at details of a cert
openssl x509 -in pki/ca.pem -text

# check expiration date
openssl x509 -enddate -noout -in file.pem

# check on the following
openssl verify -CAfile cacerts.pem local-credentials.pem
openssl s_client -verify 5 -CAfile ~/cacerts.pem -host example.com -port 8888
$ openssl x509 -enddate -noout -in joe_credentials.pem
$ openssl verify -CAfile ca.pem joe_credentials.pem
$ openssl pkey -in joe-credentials.pem
```

## links

* <https://www.redhat.com/sysadmin/6-openssl-commands>
