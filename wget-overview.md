# Wget

Below are some patterns on using `wget`.

```sh
## Download all files recursively
wget -r --no-parent 192.168.1.167:8000/
#=> ends up in directory called `192.168.1.167\:8000/`

## to ignore the index.html
$ wget -r --no-parent --reject "index.html*" 192.168.1.167:8000/

## To place in directory called `new-notes` (note the director created above is just in there )
$ wget -r --no-parent -P new-notes --reject "index.html*" 192.168.1.167:8000/

## To place in directory called `new-notes`
## -nH signals to not create the host directory
$ wget -r --no-parent -P new-notes2 -nH --reject "index.html*" 192.168.1.167:8000/
```

Also look at flags associated with:

`wget -rkpN -e robots=off http://www.example.com/`

from <https://superuser.com/questions/655554/download-all-folders-subfolders-and-files-using-wget>

