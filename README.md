# Neovim config for Python and Django

## Install and setup
For Linux Manjaro:

```sh
sudo pacman -S nvim
sudo pacman -S pyright
```
For macOS:

```sh
brew install nvim
npm install -g pyright
```

1) Put [init.lua](init.lua) and [lua](lua)  to `~/.config/nvim/.` folder.

2) Install plugins using `:PackerInstall` and reboot nvim.

## Features

+ Plugin management via [packer.nvim](https://github.com/wbthomason/packer.nvim).
+ Colorshemes via [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim).
+ File auto-save via [auto-save.nvim](https://github.com/Pocco81/auto-save.nvim).
+ File tree explorer via [nvim-tree.nvim](https://github.com/nvim-tree/nvim-tree.lua).
+ Custom statusline via [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim).
+ File tabs via [bufferline.nvim](https://github.com/akinsho/bufferline.nvim).
+ Fuzzy finder over lists via [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
+ Code, snippet, word auto-completion via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
+ Language server protocol (LSP) support via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
+ Auto close html tags [vim-closetag](https://github.com/alvan/vim-closetag).
+ Preview colours in source code [vim-css-color](https://github.com/ap/vim-css-color).
+ Auto close parentheses [lexima.vim](https://github.com/cohama/lexima.vim).
