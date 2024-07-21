#!/bin/zsh

echo "[user]
  name = $1
  email = $2
" > $HOME/.gitconfig

# xcode
xcode-select --install

# dotfiles
git clone git@github.com:kyoF/dotfiles.git

# symbolic link 
mkdir -p "$HOME/.config"
cd $HOME/dotfiles
./script/mac/ln.sh

# homebrew
/bin/bash -c "$(sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap Homebrew/bundle
brew bundle --file "./script/mac/Brewfile"

# line
mas install 539883307

# macos
cd $HOME/dotfiles
./script/mac/macos.sh

# rust
./script/rust.sh