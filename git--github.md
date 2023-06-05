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

## Updating Email

If you have an existing repo where the commits have emails you don't want to make public and you want to update the commits, you can use <https://github.com/newren/git-filter-repo>

For example:

```sh
# Install the tool
$ apt-get install git-filter-repo

# Backup the repo, just in case
$ cp -R --preserve my-repo my-repo~backup

# Enter the repo
$ cd my-repo

# Write out the replacement mailmap file where the format is
# "NAME <NEW_EMAIL> <OLD_EMAIL>", such as
$ echo "Jack Coder <jackcoder@users.noreply.github.com> <jackcoder@gmail.com>" > ../replace.mailmap

# Run the update and then check commits
$ git filter-repo --mailmap ../replace.mailmap --force
$ git log

# Make sure to set local user.email for future commits
$ git config user.email jackcoder@users.noreply.github.com

# Clean up `replace.mailmap` and `my-repo~backup` if you want
```

Now if you are pushing to a new github path, you can just do that.
If you are overwriting an existing one, you need `git push -f`, or something even more complex.


## Renaming a Repo

Say you rename a repo through the github web interface, for example I changed
the name of this repo from `base-linux-knowledge` to `linux-knowledge`.
How can you easily update your remote?

```sh
# Old url
$ git remote -v
#> github  git@github.com:jeffreyleblanc/base-linux-knowledge.git (fetch)
#> github  git@github.com:jeffreyleblanc/base-linux-knowledge.git (push)

# Update the url
$ git remote set-url github git@github.com:jeffreyleblanc/linux-knowledge.git

# Confirm works
$ git pull github master
#> From github.com:jeffreyleblanc/linux-knowledge
#>  * branch            master     -> FETCH_HEAD
#> Already up to date.
```


## Helpful github links

* Pull requests
    * from a branch: <https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request>
    * from a fork: <https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork>
* SSH key handling: <https://docs.github.com/en/authentication/connecting-to-githu
b-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent>


## Github Alternatives

* <https://gitlab.com>
* self hosted <https://gitea.io>

