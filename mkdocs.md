# Mkdocs

[Mkdocs](https://www.mkdocs.org/) is a decent document framework written in Python

## Installation

If you are on Debian/Ubuntu and don't mind a slightly older version:

```sh
$ sudo apt-get install mkdocs
```

Otherwise, something like:

```sh
$ python3 -m venv venv
$ source venv/bin/activate
()$ pip install mkdocs
```

## Setup and Use

To start a project:

```sh
# Make in a new subdirectory
$ mkdocs new my-project

# Or, setup in current directory
$ mkdocs new .
```

This just generates:

```sh
mkdocs.yml
docs/
    index.md
```

See the docs for more, but I found the following is effective:

```yaml
# mkdocs.yml
site_name: My Docs
theme: readthedocs
```

Then I setup docs along the lines of:

```sh
index.md
_media/
    # put media files here
topic1/
    pages.md...
topic2/
    pages.md...
```

To serve the site, be within directory where `mkdocs.yml` is, and:

```sh
$ mkdocs serve
#> localhost:8000

# To make available outside localhost:
$ mkdoc serve -a 0.0.0.0:8000
```

Additional notes:

* By default mkdocs will autodetect `*.md` files and sort them alphabetically in the nav
* If you have a setup like above, link media like `![Media Info](/_media/subdir/thing.jpg)`
* The first `# Header` block in a file will become the sidebar nav title for a page if present, otherwise it will be the filename
    * Note `-` and `_` seem to get turned into spaces











