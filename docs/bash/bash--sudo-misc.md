# Bash and Sudo

If you want to echo/cat something into a file as sudo:

```sh
# WRONG!
$ sudo echo 'hello' > /root/root-file.txt
#> Fails because the redirection portion is executed as normal user

# RIGHT!
$ echo 'hello' | sudo tee /root/file.txt

# Also works:
$ sudo bash -c "echo 'hello' > /root/root-file.txt"
```

