# Github Notes

## Setting up Locally Stored SSH Keys

```sh
$ cd ~/.ssh
$ ssh-keygen -t ed25519 -C "joe.smith@example.com"
#=> name it id.joesmith.github
# Results in
# private key: id.joesmith.github
# public key:  id.joesmith.github.pub
```

Now add/make `~/.ssh/config` with block:

```
Host github.com
    HostName github.com
    IdentityFile ~/.ssh/id.joesmith.github
```

And if you made it, make sure to `chmod 600`.

Finally add the public key in your github profile.


## Making a new Public Repo

1. Once signed into account, can make a new repo at <https://github.com/new>
2. On your machine (and here we assume using a different email):

```sh
# Set up repo locally
$ cd <my-repo>
$ git init
$ git config user.email <github-username>@users.noreply.github.com
$ git add .gitignore LICENSE
$ git ci -m "Initial commit."

# Set up remote and initial push
$ git remote add github git@github.com:<github-username>/<my-repo>.git
$ git push -u github master
```

3. After this you can push with `git push github master`


## Helpful github links

* Pull requests
    * from a branch: <https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request>
    * from a fork: <https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork>
* SSH key handling: <https://docs.github.com/en/authentication/connecting-to-githu
b-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent>

## Miscellaneous

If you are trying to use a repo with existing commits that use an email that is not tagged as
public on github, you can change past commit emails. I haven't gotten to work clearly yet, but
starting points can reference [this stackoverflow](https://stackoverflow.com/questions/4981126/how-to-amend-several-commits-in-git-to-change-author/25815116#25815116)


