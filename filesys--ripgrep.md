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
$ rg TERM my-file.txt

# Search recursively in all markdown files
$ rg TERM -g '*.md'

# Search recursively in all NON markdown files
$ rg TERM -g '!*.md'

## Contrast with -f, also note all options within -g and multiple -g

# Output as json
$ rg TERM -g '*.md' --json

# Only print files with contents:
$ rg TERM -g '*.md' -l

# Example of not using color in output
$ rg hello -g '*.md' --color never

# Just print files that match on the path
$ rg TERM ~/some/path/ --color never -l

# Paging with color output preserved
$ rg -p TERM | less -R

# Never print files
$ rg -I TERM
```

More useful flags:

```sh
# -.            search for hidden files and directories
# --hidden
# -i            ignore case
# -N            don't print the line number in the output
#               --no-line-number
# --trim        remove whitespace around lines
```

Showing additional lines for each match

```sh
-A N        Show N lines after each match
-B N        Show N lines before each match
-C N        Show N lines before and after each match
```

## More Examples

```sh
# Look for python main class definitions
$ rg -N "^class"

# Look for control characters like "Auth("
$ rg "Auth\("

# Use batcat
$ rg -p TERM | batcat

# Look for certain calls in a file
$ rg -e 'P\.\w+\(' snackpack.py --trim -N -o | sort | uniq
# P.b(
# P.c(
# --etc--

$ rg -e '\bsso\b'
$ rg -e 'thing\.other'
$ rg "'thing'"
$ rg '"thing"'

$ rg -e '[^_]function'
# compare to using \b

$ rg -e '[g|G]uest'
```

I had a set of text files where each had in it something like "10 minutes" that I wanted to total up:

```sh
$ rg -e "(\d+) minutes" -oIN -r '$1' --color never | paste -sd+ | bc
```


