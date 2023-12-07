# To Do File System

Review following scenarios:

* `mv`
    * when the single target exists
    * with file globs
relevant flags:

    -i      --interactive: prompt before overwrite
    -n      --no-clobber, don't overwrite existing
    -u      --update, move only when newer or doesn't exist
                      probably doesn't do any hashes or size
    -f      --force do not prompt before overwriting


       If  you specify more than one of -i, -f, -n, only the final one takes ef‐
       fect.

    also looks like using
    -t      --target-directory allows moving target
                               off end of command

    investigate how to use `--backup`

       mv [OPTION]... [-T] SOURCE DEST
       mv [OPTION]... SOURCE... DIRECTORY
       mv [OPTION]... -t DIRECTORY SOURCE...

        DESCRIPTION
       Rename SOURCE to DEST, or move SOURCE(s) to DIRECTORY.



* `cp`
    * interactive
    * not overwrite options
    * with file globs

    review:

    -a --archive
    -b and --backup


    -p --preserve=mode,ownership,timestamps

    mutually exclusive (uses last):
    -i --interactive prompt before overwrite
    -n --no-clobber  do not overwrite existing
    -u --update     copy only when SOURCE is newer or missing


