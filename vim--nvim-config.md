# Neovim Config

## Installation and Setup

```sh
$ apt-get install neovim
$ nvim --version
```

And the config folder is of the form:

```sh
~/.config/nvim/
    init.vim
    pack/
        # Place plugins here, typically on a subpath that could follow a github path,
        # so for https://github.com/mhinz/vim-signify:
        mhinz/start/
            vim-signify/ # where this is the checkout
```

## Interlude: A note on vi/vim/nvim/NeoVim

It can be a bit confusing to differentiate `vi`, `vim`, and `nvim`.
But if you do something like the following its clear:

```sh
# Basically vi and vim are both /usr/bin/vim.basic
$ ls -al /usr/bin/vi
#> --snip-- /usr/bin/vi -> /etc/alternatives/vi
$ ls -al /usr/bin/vim
#> --snip-- /usr/bin/vim -> /etc/alternatives/vim
$ ls -al /etc/alternatives/vi
#> --snip-- /etc/alternatives/vi -> /usr/bin/vim.basic
$ ls -al /etc/alternatives/vim
#> --snip-- /etc/alternatives/vim -> /usr/bin/vim.basic
$ ls -al /etc/alternatives/vi
#> --snip-- /etc/alternatives/vi -> /usr/bin/vim.basic

# Nvim is Neovim
$ ls -al /usr/bin/nvim
#> --snip--/usr/bin/nvim
```

## My Rough `init.vim`

I don't always use this full setup (esp. if I'm using `vi/vim`), but the core I use most of the time:

```
"-- Visual ---------------------------------------------------------------------------"

" Show line numbers
set number
:highlight LineNr ctermfg=236 "grey19

" Force Syntax Highlighting
:syntax on

" Keep cursor a block in insert mode
:set guicursor=i:block

" Show trailing whitespace as dark red
:highlight ExtraWhitespace ctermbg=52 " DarkRed
:match ExtraWhitespace /\s\+$/

"-- Interaction ---------------------------------------------------------------------------"

" Use the global clipboard
set clipboard+=unnamedplus

" Set tabs as 4 spaces
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

"-- Plugins ------------------------------------------------------------------------------"

" vim-signify
set updatetime=100
:highlight clear SignColumn
:highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
:highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
:highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE

```

Plugins I use in some setups:

* Shows git status per file line: <https://github.com/mhinz/vim-signify>
* Toml syntax highlighting: <https://github.com/cespare/vim-toml>
* Block comment/uncomment: <https://github.com/tpope/vim-commentary>

