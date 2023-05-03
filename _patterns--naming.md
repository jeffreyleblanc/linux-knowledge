# File System Naming Patterns

Some patterns I use:

* `YYYYMMDD_file-name-things.txt`
* `category--file-name.txt`
* `category--YYYYMMDD.txt`

For directories

* In a "stream" I'll make either:
    * `YYYY-MM/`
    * `YYYYMM--/`
* For "meta" folders I'll use all caps:
    * `~/JOURNAL/`
* Follow pattern of `.d` to designate directories, such as:
    * File: `~/.bashrc`
    * Supporting directory: `~/.bashrc.d/`

Using symlinks to raise structure

```sh
~/
    # Nested directories
    code/
        github/
        local/
    admin/
        _inbox/
        company/
        home/

    # Top level symlinks
    # Note can use full names, or abbreviate
    code-gh         => code/github
    code-local      => code/local
    admin-IN        => admin/inbox
    admin-company   => admin/company
    admin-home      => admin/home
```

Ideas:

* Converting paths to single file names
* For example say want to move a file to a trash can, but preserve some info on it
* Transform:
    * `media/stream/2017-09/20170923_file.jpg`
    * =>
    * `_P-media_d-stream_d-2017-09_P-20170923_file.jpg`
* So `path` => `f"_P-{'_d-'.join(path.parts()[:-1]}_P-{path.name} "`
    * Need to test

Make git based marker like `file.d`, e.g. `project-name.gitd/`


