export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export NODE_OPTIONS="--max_old_space_size=2048"

unset use_color safe_term match_lhs sh

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
shopt -s expand_aliases

# Enable history appending instead of overwriting.  #139609
shopt -s histappend
shopt -s checkwinsize
shopt -s expand_aliases

# Typo fixer for cd..
shopt -s cdspell
# Case insensitive cd.
bind 'set completion-ignore-case on'

# CTRL-z bring back fg task
stty susp undef
# bind '"\C-z": "fg\015"'
bind -x '"\C-z"':"fg"

export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
# export FZF_DEFAULT_COMMAND='ag --ignore-dir node_modules --ignore-case -g ""'

export EDITOR=vim
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias more=less

alias vi='vim'
alias ll='ls -lah'
alias l='ls -lh'
alias calc='bc -l'
alias mkdir='mkdir -pv'

alias gd="git diff"
alias gl="git lg"
alias gll="git ll"
alias gld="git ld"
alias gs="git status"
alias gb="git branch"
alias gpo="git po"
alias gpr="git pr"
alias gc="git c"
alias ga="git add ."

#alias pbcopy='xsel --clipboard --input'
alias server="python -m http.server"
alias gbc="git rev-parse --abbrev-ref HEAD | pbcopy"

# Sourcing
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source ~/.config/bash/bash-powerline.sh
source ~/.config/bash/git-completion.bash
