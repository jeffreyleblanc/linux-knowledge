# Pass Basic Commands

`pass` is also known as password store ([website](https://www.passwordstore.org/)).

It uses gpg to encrypt files in a git controlled tree, providing an easy to use cli frontend.

## Installation

```sh
$ apt-get install pass
```

## Setting Up

```sh
# Set up gpg key
$ gpg --full-generate-key
$ gpg --list-secret-key --with-fingerprint

# Intialize pass
# Note <fingerprint> is last 8 char from above
$ pass init <fingerprint>
$ pass git init
```

Note that below `<ppath>` is something like `sites/amazon/pw`

Listing and viewing:

```sh
# To list all stored
$ pass

# To view an entry (may ask for gpg passphrase)
$ pass <ppath>

# To copy entry to clipboard
$ pass -c <ppath>

# To search
$ pass find KEYWORD
```

Entering and editing:

```sh
# Insert a password (will need to enter twice)
$ pass insert <ppath>

# Insert a multiline password (ctrl+D or EOF to stop)
$ pass insert -m <ppath>

# Launch an editor to make an entry
$ pass edit <ppath>
```

Moving, copying, deletion:

```sh
# To move a path (Note pass will make intermediary folders)
$ pass mv <ppath-curr> <ppath-new>

# To copy a path
$ pass cp  <ppath-curr> <ppath-new>

# To remove a path
$ pass rm <ppath>
```


## Customizations

We can set the envar `PASSWORD_STORE_DIR` to point to a custom password-store directory. By default `~/.password-store`. For example:

```sh
# In ~/.bashrc or ~/.bashrc.d
export PASSWORD_STORE_DIR=/home/myuser/Documents/_pass
```


## Questions:

* Basic commands
    * How does moving a directory work?
    * How does deleting a directory work?
    * what does `-c` do with multiline?
* Larger scope
    * Direct pass to use another store path
    * Use multiple stores together
    * Use different gpg keys for different stores
    * using pass with tomb

## How pass works

Note this needs to be reviewed.

My belief is that `pass` basically wraps:

```sh
# Encrypt with self as the target
$ gpg --sign --encrypt -r $GPG_FINGERPRINT pw

# Decrypt
$ gpg --quiet --decrypt ~/.password-store/pw.gpg

# Specifically to set all the paths directly
$ gpg --homedir /path/to/.gnupg/ --quiet --decrypt /path/to/pass/folder/subfolder/password.gpg
    #> You will be prompted for the relevant passcode
```

And adds structure and tracking to the mix.


Also noteworthy from the man page:

```sh
FILES
   ~/.password-store
          The default password storage directory.

   ~/.password-store/.gpg-id
          Contains the default gpg key identification used for encryption and decryption.  Multiple gpg  keys  may
          be  specified  in  this file, one per line. If this file exists in any sub directories, passwords inside
          those sub directories are encrypted using those keys. This should be set using the init command.

   ~/.password-store/.extensions
          The directory containing extension files.
```

## Links

* Main pass pages
    * <https://www.passwordstore.org>
    * <https://github.com/zx2c4/password-store>
* Pass tomb
    * <https://github.com/roddhjav/pass-tomb>
* Misc guides and tutorials that were useful
    * <https://www.thegeekstuff.com/2012/10/gnupg-basics/>
    * <https://medium.com/@chasinglogic/the-definitive-guide-to-password-store-c337a8f023a1>
    * <https://itsfoss.com/password-managers-linux/>

