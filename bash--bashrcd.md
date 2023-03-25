# Setting Up Bash Environment

## Ideas

For granular control over ssh service

```sh
function ssh-up (){
    ufw allow 22
    systemctl start ssh
}

function ssh-down (){
    systemctl stop ssh
    ufw deny 22
}

function ssh-status (){
    ufw status
    systemctl status ssh
}

```


