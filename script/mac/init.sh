#!/bin/zsh

######################
######## init ########
######################
cd $HOME

echo "[user]
  name = kyof
  email = $1
" > $HOME/.gitconfig

mkdir -p "$HOME/.config"

xcode-select --install

git clone git@github.com:kyoF/dotfiles.git
cd $HOME/dotfiles
./script/mac/ln.sh

##########################
######## homebrew ########
##########################
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

packages=(
  git
  lazygit
  neovim
  tmux
  cmake
  mas
)
for package in "${packages[@]}"; do
  brew install "$package"
done

casks=(
  clipy
  microsoft-edge
  google-chrome
  visual-studio-code
  slack
  docker
  appcleaner
  arc
  karabiner-elements
  zoom
)
for cask in "${casks[@]}"; do
  brew install --cask "$cask"
done
mas install 539883307 # line

##############################
######## install rust ########
##############################
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

###################################
######## exec shell script ########
###################################
cd $HOME/dotfiles
./script/mac/macos.sh
./script/rust.sh

############################
######## reboot mac ########
############################
sudo reboot
