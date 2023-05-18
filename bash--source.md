# Source

## Scenario: Setting up Environment

I often am testing code on a server and want an easy way once I log in
to set up my environment. One simple way is to make a script like:

`~/src--setup-myproj.sh`

```sh
#! /bin/bash
cd ~/code/my-project
export PYTHONPATH=~/code/dependency:~/code/my-project
PS1="proj$ "
```

And then:

```sh
$ source src--setup-myproj.sh
```

Note that `source` just executes the script in context of the shell.

Not sure the script needs the `#! /bin/bash`?


