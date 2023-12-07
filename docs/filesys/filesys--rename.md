# Renaming multiple files

``` sh
$ sudo apt-get install rename
#--> installs it

$ ls
# action04-jsk.py  action05-erm.py  action06-7888.py  util.py

$ rename -n 's/action/scenario/' action*.py
# rename(action04-jsk.py, scenario04-jsk.py)
# rename(action05-erm.py, scenario05-erm.py)
# rename(action06-7888.py, scenario06-7888.py)

$ rename 's/action/scenario/' action*.py

$ ls
# scenario04-jsk.py  scenario05-erm.py  scenario06-7888.py  util.py
```

Example of removing leading chunk:

``` sh
$ rename -n 's/layout_//' layout_*.py
```

An example of changing file types from javascript to typescript (with dry run flag):

```sh
$ rename -n 's/.js/.ts/' src/*.js
```

