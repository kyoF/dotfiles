# import linux .zshrc
[ -f ~/.zshrc.linux ] && source ~/.zshrc.linux
# import mac .zshrc
[ -f ~/.zshrc.mac ] && source ~/.zshrc.mac
# import local .zshrc
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

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
alias vshell='nvim ~/.zshrc'
alias sshell='source ~/.zshrc'
alias cddot='cd ~/dotfiles'
alias lg='lazygit'
alias checkport='lsof -i -P | grep'
alias kl='kill -9'

# homebrew
alias hb='brew'
alias hbi='brew install'

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

# neovim
alias vi='nvim'
alias vneovim='nvim ~/.config/nvim'

# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
alias vstarship='nvim ~/.config/starship/starship.toml'

# zellij
alias vzellij='nvim ~/.config/zellij/config.kdl'
alias zellij='bash <(curl -L zellij.dev/launch)'

# devbox
alias db='devbox'
alias dbs='devbox shell'
