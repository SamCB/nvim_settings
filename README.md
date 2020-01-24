# Problem: too many nvim configs on github
## Solution: write another one

An nvim config I made for myself.
If it works for you, great!
No guarantees that it will.

> **Note:** Alpha. I'm just beginning to use this for _"real programming"_, as such, I'm likely to change things as it goes.
> This message will be removed at some stage when I'd consider it _"stable"_.

### Wait, so if all that exists, why a new one?

The goal of this is to keep nvim simple.
Recently with developement and support of the Language Server Protocol, it doesn't make sense to keep the way you deal with your languages wrapped up in your vim settings.
As such, first priority of this setup is to rely on the LSP as much as possible.

### What's in here?

* Plugins managed by [junegunn/vim-plug](https://github.com/junegunn/vim-plug).
* Intellisense and Language Server Protocol by [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim). Running everything through the Language Server Protocol dramatically decreases the mess of plugins that your vim config tends to become.
* Search by [Shougo/denite.nvim](https://github.com/Shougo/denite.nvim). Recommend installing ripgrep to use with this.
* File navigation by [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree).
* Snippet handling by [neoclide/coc-snippets](https://github.com/neoclide/coc-snippets). See docs for adding your own snippets.
* Theme [lifepillar/vim-solarized8](https://github.com/lifepillar/vim-solarized8).
* "Powerline" by [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline).

### Wow you're pretty clever.

Actually this is just "inspired" from a bunch of places.
The following are configs I've used or taken an extended look at in the past and so some of how this works will probably look somewhat familiar.

* [amix/vimrc](https://github.com/amix/vimrc)
* [rafi/vim-config](https://github.com/rafi/vim-config)
* [A guide to modern Web Development with (Neo)vim - Caleb Taylor](https://www.freecodecamp.org/news/a-guide-to-modern-web-development-with-neo-vim-333f7efbf8e2/) and [ctaylo21/jarvis](https://github.com/ctaylo21/jarvis)

## Setup:

### Requirements

Expected to have installed:

* nvim (I did this in v0.4.3 so no clue how it'll work elsewhere)
* pyenv and virtualenv

### Recommended

Recommend having the following installed

* [ripgrep](https://github.com/BurntSushi/ripgrep) to replace grep when searching with denite
* [powerline fonts](https://powerline.readthedocs.io/en/master/installation.html#patched-fonts) to pretty up the airline plugin

### Install

This is designed to run from a completely clean setup on a mac.
Having things such as Plug installed or an existing `init.vim` may or may not cause some issues.

```sh
brew install nvim
git clone --depth=1 https://github.com/SamCB/nvim_settings.git ~/.nvim_settings
sh ~/.nvim_settings/setup.sh
nvim +PlugInstall
```

### Customising

After running the setup script, there will be a file `~/.config/nvim/my_config.vim`.
Add any settings you want into that.
This is also where you'll put config for installing your coc scripts.
For example:

```vim
let g:coc_global_extensions = [
  \ 'coc-tsserver', 'coc-html', 'coc-css', 'coc-python', 'coc-vimlsp'
\ ]
```

A list of coc extensions can be found [here](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions).
Restarting vim *should* make the extensions install.
(Recently it has become possible to use vim-plug to install coc extensions.
If you'd rather do that see [here](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#use-vims-plugin-manager-for-coc-extension) and my comments on vim-plug below for details.)

If you have and like to use powerline fonts for airline, then you can also set that there.

```vim
let g:airline_powerline_fonts = 1
```

There is also a file: `~/.config/nvim/my_installs.vim` which you can use to add your own plugins using the usual [vim-plug](https://github.com/junegunn/vim-plug) methods.
For example:

```vim
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
```

Note, do _not_ add the `plug#begin` or `plug#end` statements to this file.
This file is called after all other Plug commands, but before `plug#end`.

[Coc](https://github.com/neoclide/coc.nvim) has its own config JSON file.
Configuration of that is left as an exercise for the user.
Details can be found [here](https://github.com/neoclide/coc.nvim/wiki/Using-the-configuration-file).
Use the command `:CocConfig` to open the file.

## Some commands:

| Key | Command |
| --- | ------- |
| `,` | Leader |
| `,nf` | Open NERDTree |
| `<C-p>` | Search for file in project |
| `<C-o>b` | Search for file in open buffer |
| `<C-o>g` | Grep across project |
| `<C-o>G` | Grep for word under cursor |
| `K` | Open documentation |
| `g[` | goto previous problem |
| `g]` | goto next problem |
| `gd` | goto definition |
| `gy` | goto type definition |
| `gi` | goto implementation |
| `gr` | goto references |
| `cr` | rename |
| `cf` | fix |
| `ca` | code action |
| `,l` | open locationlist |
| `,q` | open quickfix |
| `,L` | close locationlist |
| `,Q` | close quickfix |
| `BD` | Buffer delete without window close |
