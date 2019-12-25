# Someone ought to write another nvim config...
## ...someone did

An nvim config I made for myself.
If it works for you, great!
No guarantees that it will.

## Requirements

Expected to have installed:

* nvim (I did this in v0.4.3 so no clue how it'll work elsewhere)
* pyenv and virtualenv

## Install

This is designed to run from a completely clean setup on a mac.
Having things such as Plug installed or an existing `init.vim` may or may not cause some issues.

```sh
brew install nvim
git clone --depth=1 https://github.com/SamCB/nvim_settings.git ~/.vim_settings
sh ~/.nvim_settings/setup.sh
```

## Wow you're pretty clever.

Actually this is just "inspired" from a bunch of places, most notably the following:

* [amix/vimrc](https://github.com/amix/vimrc)
* [rafi/vim-config](https://github.com/rafi/vim-config)
* [A guide to modern Web Development with (Neo)vim - Caleb Taylor](https://www.freecodecamp.org/news/a-guide-to-modern-web-development-with-neo-vim-333f7efbf8e2/)

## Wait, so if all that exists, why a new one?

The goal of this is to keep nvim simple.
Recently with developement and support of the Language Server Protocol, it doesn't make sense to keep the way you deal with your languages wrapped up in your vim settings.
As such, first priority of this setup is to rely on the LSP as much as possible.

## What's in here?

* Plugins managed by [junegunn/vim-plug](https://github.com/junegunn/vim-plug).
* Intellisense and Language Server Protocol by [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim). Running everything through the Language Server Protocol dramatically decreases the mess of plugins that your vim config tends to become.
