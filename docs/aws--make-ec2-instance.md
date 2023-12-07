# Making an ec2 Instance

Go to:

* <https://us-east-1.console.aws.amazon.com/ec2/home?region=us-east-1>
    * Or a more relevant region for you
* "Launch Instance"

What I choose roughly:

* Name: my-aws-instance
* Debian 11
* t2.small
* Make a keypair for initial access as a PEM
    * Move the file into `~/.ssh` and `chmod 600`
    * You can then use `ssh -i ~/.ssh/my-aws-instance.pem admin@PUBLIC_IP`
    * Note this ends up in `/root/.ssh/authorized_keys`
* Nnetwork: select existing group and `all_open`
    * You can probably run your own firewall later
* Disk: the default is 8G, a little small, so choose 32G

