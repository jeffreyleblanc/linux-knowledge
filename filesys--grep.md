# Grep

Here are some basic patterns with "vanilla" grep.

Searching in a single file:

```sh
# Search for a term in a file
$ grep <term> <file_path>
$ grep needle HAYSTACK.txt

# Search using a basic regex
$ grep "\bneedle\b" HAYSTACK.txt

# Use some flags
# --color  color in the search pattern
# -n       print line number
# -H       print filename
$ grep --color -n -H <term> <file_path>

# Never use color
$ grep --color=never <term> <file_path>

# Case insensitive search
$ grep -i <term> <file_path>
```

Searching recursively:

```sh
# Search recursively in the current working directory (showing lines)
$ grep -r -n <term>
# or
$ grep -r -n <term> .

# Search on some directory path
$ grep -r -n <term> <directory_path>
```

Showing additional lines for each match

```sh
-A N        Show N lines after each match
-B N        Show N lines before each match
-C N        Show N lines before and after each match
```

Other patterns:

```sh
# Note that we escape the '$'
grep -r "\$G" .

# To search for just files of a certain type:
grep -r --include "*.vue" "\$G" .
```

To review:

* case insenstive
* regex, particullarly word boundaries
* match multiple file types
* multiple matches on a line (likely by chaining grep)
* show line numbers
* just show lines
* just show files (without duplicates)
* Using `git grep`

