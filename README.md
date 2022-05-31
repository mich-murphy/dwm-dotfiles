# Dotfiles
Here are my setup files for my Arch install using dwm. This is currently being used for a laptop, which explains some scripts. 

In the unix world programs are commonly configured with files in your home directory. Any file or directory name that starts with a dot/period is considered hidden, and in a default view will not be displayed - thus the name dotfiles.

## Management
I manage dotfiles with gnu stow. This allows me to keep a versioned directory of all my config files, that are virtually linked into place via a single command. This makes sharing these files among many users and computers super simple. Instructions for installation with gnu stow can be found [here](#installing)

## Ansible Install
Complete Ansible install can be found at [this repo](https://github.com/mich-murphy/ansible). Ansible is a tool created by Redhat, which manages server installations. This can be configured to run on localhost and allows for a fully automated installation.

**Note**: edits will be needed for users other than myself to run the Ansible install:
1. The SSH configuration task will need to be removed, as it requires a decryption password
2. The task cloning this repo will need to be removed. This repo references a submodule to another private repo - due to the use of paid fonts - this causes ansible to fail when authentication to the private repo can't be made.

Following install spotifyd config must be completed:
1. create ~/.config/spotifyd/pass.txt (will look to use ansible vault in future)
2. enable systemd service
```
sudo systemctl --user enable spotifyd.service
sudo systemctl --user start spotifyd.service
```

## Info
- OS: Arch
- WM: [dwm](https://dwm.suckless.org/)
- Terminal: [kitty](https://sw.kovidgoyal.net/kitty/)
- Shell: Zsh
- Browser: [Brave](https://brave.com/linux/)
- Editor: Neovim
- System monitor: [Btop](https://github.com/aristocratos/btop)
- Launcher: [dmenu](https://tools.suckless.org/dmenu/)
- Bar: [slstatus](https://tools.suckless.org/slstatus/)
- Fonts: 
  - [Spleen](https://github.com/fcambus/spleen) for bar
  - [Siji](https://github.com/stark/siji) for bar icons
  - [MonoLisa](https://www.monolisa.dev/) in terminal
- Music: [Spotify-tui & Spotifyd](https://github.com/Rigellute/spotify-tui)
- GTK: [ANT Dracula](https://github.com/dracula/gtk)
- File Manager: [lf](https://github.com/gokcehan/lf)
- Fetch: [pfetch](https://github.com/dylanaraps/pfetch)
- Notifications: [Dunst](https://github.com/dunst-project/dunst)
- Compositor: [picom](https://github.com/yshui/picom)
- Colorscheme: [Monokai Pro - Spectrum](https://gitlab.com/__tpb/monokai-pro.nvim)

## Screenshots
![nvim, spotify-tui and cava screenshot](https://github.com/mrhackendbacker/Hackfiles/blob/master/wallpapers/Pictures/screenshots/2022-03-17-21:38:58-screenshot.png)
![btop, kitty and ranger screenshot](https://github.com/mrhackendbacker/Hackfiles/blob/master/wallpapers/Pictures/screenshots/2022-03-17-21:38:31-screenshot.png)

## Installing
Requirements:
- `git`
- `stow`

Clone repository
```
git clone https://github.com/mrhackendbacker/.dotfiles.git ~
```

Run `stow` to symlink all folders (ignoring README.md etc.)
```
stow */
```
Or `stow` individual folders e.g.
```
stow nvim
```

List of installed packages via pacman can be found [here](https://github.com/mich-murphy/ansible/blob/master/tasks/pacman.yml), a list of packages from aur can be found [here](https://github.com/mich-murphy/ansible/blob/master/tasks/aur.yml) 

## Neovim
Config was initially guided by [this repo](https://github.com/LunarVim/Neovim-from-scratch#get-healthy).

I've since made a number of changes to the config to remove any errors, and made some tweaks to plugins and keybindings.

Open nvim and enter the following:
```
:checkhealth
```

You'll probably notice you don't have support for copy/paste, also that python and node haven't been setup

First we'll fix copy/paste
```
sudo pacman -S xsel
```

Next we need to install python support (node is optional)

- Neovim python support
```
pip install pynvim
```

- Neovim node support
```
npm i -g neovim
```
