# import local .zshrc
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

if [ $SHLVL = 1 ]; then
  tmux
fi

# core
alias ls='ls -FG'
alias ll='ls -alFG'
alias c='clear'
alias ..='cd ../'
alias ...='cd ../..'
alias ....='cd ../../..'
alias md='mkdir'
alias t='touch'
alias rd='rmdir'
alias rr='rm -rf'
alias e='exit'
alias vshell='vim ~/.zshrc'
alias sshell='source ~/.zshrc'
alias dot='cd ~/dotfiles'
alias lg='lazygit'
alias checkport='lsof -i -P | grep'
alias kl='kill -9'

# git
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"
setopt complete_in_word
zstyle ':completion:*:default' menu select=1
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt list_packed
setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "
# alias
alias ga='git add'
alias gc='git commit -m'
alias gP='git push'
alias gp='git pull'
alias gs='git status'
alias gb='git branch'
alias gC='git checkout'
alias gl='git log'
alias gd='git diff'
alias gf='git fetch'

# docker compose
alias dc='docker compose'
alias dcp='docker compose --profile'
alias dcdel='docker compose down --rmi all --volumes --remove-orphans'

# vim
alias vi='vim'

# starship
export STARSHIP_CONFIG=~/.starship/starship.toml
eval "$(starship init zsh)"

# devbox
alias db='devbox'
alias dbs='devbox shell'

# tmux
alias stmux='tmux source ~/.tmux.conf'
function tmuxPopup() {
  width='80%'
  height='80%'
  session=$(tmux display-message -p -F "#{session_name}")
  if [[ $session == *'popup'* ]]; then
    tmux detach-client
  else
    tmux popup -d "#{pane_current_path}" -xC -yC -w $width -h $height -E "tmux attach -t popup || tmux new -s popup"
  fi
}
