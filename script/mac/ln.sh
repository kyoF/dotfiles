#!/bin/bash

cd $HOME/dotfiles

for f in .??*; do
  [[ $f == ".git" ]] && continue
  [[ $f == ".gitignore" ]] && continue
  if [[ $f == ".config" ]]; then
    ln -snfv ${PWD}/"$f"/nvim ~/.config/
    ln -snfv ${PWD}/"$f"/starship ~/.config/
    ln -snfv ${PWD}/"$f"/alacritty ~/.config/
    ln -snfv ${PWD}/"$f"/tmux ~/.config/
    ln -snfv ${PWD}/"$f"/wezterm ~/.config/
    ln -snfv ${PWD}/"$f"/zellij ~/.config/
    ln -snfv ${PWD}/"$f"/karabiner ~/.config/
    continue
  fi
  ln -snfv ${PWD}/"$f" ~/
done

source ~/.zshrc
