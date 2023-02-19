# Ripgrep

## Installation

``` sh
$ apt-get install ripgrep
$ which rg
```

## Documentation and Links

* <https://github.com/BurntSushi/ripgrep>
* <https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#basics>
* <https://manpages.debian.org/testing/ripgrep/rg.1.en.html>


## Examples

```sh
# Search for something in a given file
$ rg $TERM my-file.txt

# Search recursively in all markdown files
$ rg $TERM -g '*.md'

# Search recursively in all NON markdown files
$ rg $TERM -g '!*.md'

## Contrast with -f, also note all options within -g and multiple -g

# Output as json
$ rg $TERM -g '*.md' --json

# Only print files with contents:
$ rg $TERM -g '*.md' -l

# Example of not using color in output
$ rg hello -g '*.md' --color never

# Just print files that match on the path
$ rg $TERM ~/some/path/ --color never -l
```

More useful flags:

```sh
# --hidden      search for hidden files and directories
# -i            ignore case
# -N            don't print the line number in the output
#               --no-line-number
# --trim        remove whitespace around lines
```

## More Examples

```sh
# Look for certain calls in a file
$ rg -e 'P\.\w+\(' snackpack.py --trim -N -o | sort | uniq
# P.b(
# P.c(
# P.g(
# P.header(
# P.k(
# P.p(
# P.r(
# P.rb(
# P.rule(

$ rg -e '\bsso\b'
$ rg -e 'thing\.other'
$ rg "'thing'"
$ rg '"thing"'

$ rg -e '[^_]function'
# compare to using \b

$ rg -e '[g|G]uest'
```
