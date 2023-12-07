# Bash Expansions

Using `{` brackets:

```sh
$ ls -1 a{1,2,3,foo}.txt
#> a1.txt
#> a2.txt
#> a3.txt
#> afoo.txt

$ ls -1 a{10..12}.txt
#> a10.txt
#> a11.txt
#> a12.txt
```

