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

Make git based marker like `file.d`, e.g. `project-name.gitd/`


