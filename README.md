# Don't use this, this still in beta


## fzf

### Only run this if fzf history is not working | ctrl + r

brew install fzf
$(brew --prefix)/opt/fzf/install

<!-- ## Alacrity Setup -->
<!---->
<!-- brew install --cask alacritty -->
<!-- -> Go to privacy and security and Accept Alacritty -->
<!---->
<!-- ## Install Nerd Fonts -->
<!---->
<!-- brew install font-meslo-lg-nerd-font -->
<!---->
<!-- ~/.config/alacritty -->
<!---->
<!-- ## Install Theme for Alacrity -->
<!---->
<!-- brew install powerlevel10k -->
<!---->
<!-- source ~/.zshrc -->
<!---->
<!-- ### If you want to reconfigure the theme -->
<!---->
<!-- p10k configure -->

# Install Kitty rather than Alacrity

brew install --cask kitty

## Install Auto suggestion for zhs

brew install zsh-autosuggestions

## Install Syntax Highligh

brew install zsh-syntax-highlighting

## Better version of ls

brew install eza

## Beter version of cd

brew install zoxide

## Tmux

brew install tmux

### Also install tpm (tmux plugin manager):

- Can skip this part, already added a symlink
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux

- End

Then install the plugins I use with it by pressing CTRL-S (my prefix) followed by Shift-I.

### If it's still not working

tmux source ~/.tmux.conf

### For the tmux theme that I’m using to work properly, you’ll probably need to install a newer version of bash:

brew install bash

Then reload the tmux configuration by doing CTRL-S (my prefix) followed by r.

---

## Neovim setup

https://www.josean.com/posts/how-to-setup-neovim-2024

brew install neovim

brew install ripgrep

### If not yet installed

brew install node

Type:
nvim
:Lazy
I

## Setup lazygit integration

brew install jesseduffield/lazygit/lazygit

---

# yabai

# Configure MacOs Specific Settings

# Open Several Desktops (~7) on Your Machine

# Go To Keyboard Settings > Shortcuts > Mission Control

# Expand Mission Control and Turn On Shortcuts for Switching Spaces 1-7 with “Ctrl + # Of Space”

# Go to System Settings > Accessibility > Display

# Turn On Reduce Motion

# Go To System Settings > Desktop & Dock > Mission Control

# Turn off “Automatically Rearrange Spaces Based On Most Recent Use”

# Personally, I only keep “Displays Have Separate Spaces” turned on here, and that’s what I’d recommend

# window manager

brew install koekeishiya/formulae/yabai

## Disabling System Integrity Protection

https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)
https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection

- sudo yabai --load-sa
- yabai --restart-service

# install border

brew install felixkratz/formulae/borders

# keyboard shortcuts

brew install koekeishiya/formulae/skhd

# to start yabai on startup

yabai --start-service
yabai --restart-service

# to start skhd on startup

skhd --start-service
skhd --restart-service

# Learning More

man yabai

# Sketchybar

brew tap FelixKratz/formulae
brew install sketchybar

# install font for sketchybar

## cd ~/Downloads && curl -O https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg

## Avante

https://github.com/deepseek-ai/awesome-deepseek-integration/blob/main/docs/avante.nvim/README.md

## Yazi

brew install yazi ffmpegthumbnailer ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide imagemagick font-symbols-only-nerd-font
ya pack -a yazi-rs/flavors:catppuccin-mocha

## install visidata for csv preview in yazi

brew install visidata

## visidata shortcuts

Table Action Shortcut
Copy single cell (of current row and current column) z Shift+Y
Copy selected cell(s) (of current column) g z Shift+Y
Copy single row Shift+Y
Copy selected row(s) g Shift+Y

## Install Intelephense License

mkdir -p ~/.config/intelephense
echo '{"licenseKey": "License Key - Check Email or Drive"}' > ~/.config/intelephense/license.json

> If the above method did not work, you can try this method.

- mkdir $HOME/intelephense/license.txt

# Install the fuck - if not yet installed, already added this in dependencies

brew install thefuck


# Need to configure mysql-client/sqlite3 for dadbod nvim
