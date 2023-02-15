# Github Notes

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

### Miscellaneous

If you are trying to use a repo with existing commits that use an email that is not tagged as
public on github, you can change past commit emails. I haven't gotten to work clearly yet, but
starting points can reference (this stackoveflow)[https://stackoverflow.com/questions/4981126/how-to-amend-several-commits-in-git-to-change-author/25815116#25815116]


