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


