# This explains the difference between .profile, .bash_profile, and .bashrc--be sure to read the comments:
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

# If on OS X:
if [[ $OSTYPE == darwin* ]]; then
    # Tell compilers we have a 64 bit architecture
    export ARCHFLAGS="-arch x86_64"
    # Ensure Homebrew binaries take precedence
    export PATH=/usr/local/bin:/usr/local/sbin:"$PATH"
fi

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

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
export NODE_OPTIONS=--max_old_space_size=4096

export EDITOR=vim
export GROUPS_ENABLED=true
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
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

alias pbcopy='xsel --clipboard --input'
alias server="python -m http.server"
alias gbc="git rev-parse --abbrev-ref HEAD | pbcopy"

# Sourcing
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
source ~/.bin/bash-powerline.sh
source ~/.bin/git-completion.bash
source /usr/share/autojump/autojump.bash

export PATH=$PATH:$HOME/n/bin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
