export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# commands
alias c='clear'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'

# dirs
alias home='cd /mnt/c/Users/asema'

# tmux
alias t='tmux'
alias tn='tmux new -s'
alias ta='tmux attach-session -t'
alias tk='tmux kill-session -t'
alias tka='tmux kill-server' # kill all
alias tls='tmux ls'

# git
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWCOLORHINTS=true

alias gs='git status'
alias gc='git commit -m'
alias gpo='git push origin'
alias gaa='git add .' # git add all

# prompt
export PS1='\[\e[0;36m\]\W\[\033[0;35m\]$(__git_ps1 " (%s)")\[\e[0m\]: '

# weather
alias weather='curl -4 http://wttr.in/Mississauga'

# editing and reloading config files
# bash
alias bashrc='vim ~/.bashrc'
alias loadbash='source ~/.bashrc'
# tmux
alias tmuxrc='vim ~/.tmux.conf'
alias loadtmux='tmux source-file ~/.tmux.conf'
# qutebrowser
alias quterc=''

alias vim='/usr/bin/vim'

# -- HISTORY
# append to the history file, don't overwrite it
shopt -s histappend
# long history
HISTSIZE=5000
HISTFILESIZE=1000
# avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"
# useful timestamp format
HISTTIMEFORMAT='%F %T '
# update lines/columns according to window size
shopt -s checkwinsize

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
