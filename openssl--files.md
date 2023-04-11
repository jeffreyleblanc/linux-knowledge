# Using openssl with Files

## Unlocking Legacy Encrypted Files

At some point the hash used was upgraded, so you may need to try:

```sh
$ openssl aes-256-cbc -md md5 -a -d -in FILE
```

