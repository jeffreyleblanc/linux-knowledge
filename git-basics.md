# Git Basics

## Inbox

### Clean Repo

Clean of everything not tracked:

```sh
$ git clean -fxd
```

### Diff by file type

```sh
# Only show diff for certain kinds of files
$ git diff -- '*.js' '*.vue'
```

### Basic Stats

Determining basic stats on a repo:

```sh
# Total commits (here from master but could be branch of commit hash)
$ git rev-list --count master

# Total commits across all branches etc
$ git rev-list --count --all

# Commits by contributer on current branch
$ git shortlog -sn

# Commits by contributer across all branches
$ git shortlog -sn --all
```

### New Repo from Another

Generating a new repo from a path on another

**NOTE**: mileage may vary here.

```sh
# 1. Make a clone of the repo (and you probably only need the master branch)

# 2. Go into it and
$ git filter-repo --path PATH/TO/KEEP
```

Note you need <https://github.com/newren/git-filter-repo>, or `apt-get install git-filter-repo`.


### Config

```sh
# To see config within a repo
$ git config --list
```

## 1) Git Super Basics

```sh
# Make a directory the root of a repo
$ git init

# Look at unstaged differences
$ git diff
# Look at staged differences
$ git diff --cached

# Add files to be commited
$ git add FILE_PATH
# Add all files (not ignored) to be committed
$ git add .
# Dry run what will be added
$ git add -n .

# Remove files from tracking that are deleted
$ git rm FILE_PATH

# Look at the status of the repo
$ git status

# Commit
$ git commit -m "My commit Message"
```

Basic reset

```
# Revert all unstaged files
$ git restore .

# Revert specific file
$ git restore <file-path>
```


## 2) Git Branches

```sh
# List info on local branches
$ git branch
# List on all/remote **REVIEW**
$ git branch -a/-v

# Make a local branch
$ git checkout -b my-branch

# Push a branch (initially) to a remote
$ git push REMOTE -u my-branch
```

## 2.A) Deleting a local branch example

``` sh
$ git br
# * master
#   tmux-update

$ git br -d tmux-update
# Deleted branch tmux-update (was 2b4cc47).

$ git br
# * master
```


## 2.1) Git delete remote and local branches

```sh
$ git push -d <remote_name> <branchname>
$ git branch -d <branchname>
```

## 2.2) Rebasing A Branch

And then the process once again of rebasing a branch

```sh
# First checkout and pull in new material:
$ git co master
$ git pull origin master

# Then checkout the branch and procedd
$ git co desktop_20180516
$ git rebase master
    # First, rewinding head to replay your work on top of it...
    # Applying: Desktop: Adding some window ordering debug output.
    # Applying: Desktop: Initial new ordering method.
    # etc... and hopefully no conflict!

# Double check things
$ git st
$ git hist

# Push newly rebased version onto remote:
$ git push -f origin desktop_20180516
```

Note that anyone pulling needs to know its been rebased

## 2.3) Looking at branch differences

``` sh
$ git diff branch_1..branch_2
# That will produce the diff between the tips of the two branches.
# If you'd prefer to find the diff from their common ancestor to test, you can use three dots instead of two:
$ git diff branch_1...branch_2
```

## 2.4) Resetting a messed up branch

``` sh
$ git fetch origin
$ git reset --hard origin/master
```

If you want to save your current branch's state before doing this (just in case), you can do:

git commit -a -m "Saving my work, just in case"
git branch my-saved-work

## 2.5) Finding Common Commit for 2 branches

`git merge-base master interaction_rendering`


## 3) Git Searching Commit Log

### 3.1) Search through commits

```sh
# Across all branches
$ git log --all --grep='0.3.15'
# commit 3a5--snip--
# Author: Joe Smith <joe.smith@site.com>
# Date:   Mon Jun 4 17:22:29 2018 +0000

#     Some Commit Message...

## Across probably just current branch
$ git log --grep='0.3.15'
# commit 3a5--snip--
# Author: Joe Smith <joe.smith@site.com>
# Date:   Mon Jun 4 17:22:29 2018 +0000

#     Some Commit Message...
```


```sh
$ git log -- <file>
    # Show commits that altered
$ git log -p -- <file>
    # Show patches as well
$ git log --follow -p -- <file>
    # if renamed... show
```

### 3.2) Search for terms

To search all of history:

`git log -S $TERM`

## 3.3) View history of a file by commits

`git log -p -- $PATH_TO_FILE`


## 4A) Git Remotes

```sh
$ git clone

```

## Remove a file from tracking

`.gitignore` will prevent untracked files from being added (without an add -f) to the set of files tracked by git, however git will continue to track any files that are already being tracked.

To stop tracking a file you need to remove it from the index. This can be achieved with this command.

```sh
    $ git rm --cached <file>
```

The removal of the file from the head revision will happen on the next commit.

For example:

```sh
$ git st
# On branch spa.v1
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git restore <file>..." to discard changes in working directory)
#         modified:   webresources/builder/js/main.js
#         modified:   webresources/builder/js/utils/dom.js
#         modified:   webresources/static/main.min.css
#         modified:   webresources/static/main.min.js
#         modified:   webresources/static/main.min.js.map

# no changes added to commit (use "git add" and/or "git commit -a")

$ git rm --cached webresources/static/*.js*
# rm 'webresources/static/main.js'
# rm 'webresources/static/main.min.js'
# rm 'webresources/static/main.min.js.map'

$ git rm --cached webresources/static/*.css*
# rm 'webresources/static/main.css'
# rm 'webresources/static/main.min.css'

$ git st
# On branch spa.v1
# Changes to be committed:
#   (use "git restore --staged <file>..." to unstage)
#         deleted:    webresources/static/main.css
#         deleted:    webresources/static/main.js
#         deleted:    webresources/static/main.min.css
#         deleted:    webresources/static/main.min.js
#         deleted:    webresources/static/main.min.js.map

# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git restore <file>..." to discard changes in working directory)
#         modified:   webresources/builder/js/main.js
#         modified:   webresources/builder/js/utils/dom.js
```


## Check on a git merge

To check on a merge:

```sh
$ git pull origin master
$ git merge --no-commit --no-ff clientcontrol_may2
#    Auto-merging setup.py
#    Auto-merging library/webserver/js.py
#    Auto-merging library/common/processor.py
#    Auto-merging debian/rules
#    Automatic merge went well; stopped before committing as requested
$ git merge --abort
$ git st
#    On branch master
#    Your branch is up-to-date with 'origin/master'.
#    nothing to commit, working tree clean
```

