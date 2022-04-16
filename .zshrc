# export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# プロンプトカスタマイズ
PROMPT='
[%B%F{red}%n@%m%f%b:%F{green}%~%f]%F{cyan}$vcs_info_msg_0_%f
%F{yellow}$%f '

# コマンドのエイリアス
alias ls='ls -FG'
alias ll='ls -alFG'
alias c='clear'

# gitコマンドのエイリアス
alias gitacp='(){git add -A && git commit -m "$1" && git push}'
alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gl='git log'

export PATH="$PATH:/Users/kyosukefujiki/Applications/flutter/bin"
