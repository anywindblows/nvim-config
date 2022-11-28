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

Put [init.lua](init.lua) and [lua](lua)  to `~/.config/nvim/.` folder.
Install plugins using `:PackerInstall` and reboot nvim.
