export LANG=C
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export NODE_OPTIONS="--max_old_space_size=2048"
export GPG_TTY=$(tty)
export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH=~/.npm-global/bin:$PATH

unset use_color safe_term match_lhs sh

# complete -cf sudo

# Typo fixer for cd..
# shopt -s cdspell
# Case insensitive cd.
# bind 'set completion-ignore-case on'

# CTRL-z bring back fg task
# stty susp undef
# bind '"\C-z": "fg\015"'
# bind -x '"\C-z"':"fg"

export FZF_DEFAULT_COMMAND='rg --files --follow --hidden -g "!.git"'
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
alias tmux="TERM=screen-256color-bce tmux -u"

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
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
source ~/.config/bash/bash-powerline.bash
source ~/.config/bash/git-completion.bash
