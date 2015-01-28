# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#set -v
UNAME=$(uname -s)

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# PS1 setting without git branch name prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[\e[01;33m\]\u\[\033[01;34m\]@\[\033[01;32m\]\H\[\033[00m\]:\[\033[01;35m\]\w\[\033[00m\] \$ '

# Put the git branch name in my shell pormpt
if [ "$UNAME" == "Darwin" ]; then
    PS1_BASE='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[\e[01;33m\]\u\[\033[01;34m\]@\[\033[01;32m\]mbp\[\033[00m\]:\[\033[01;35m\]\w'
else
    PS1_BASE='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[\e[01;33m\]\u\[\033[01;34m\]@\[\033[01;32m\]\H\[\033[00m\]:\[\033[01;35m\]\w'
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/:[\1]/'
}
PS1="$PS1_BASE\[\033[01;33m\]\$(parse_git_branch)\[\033[00m\] \$ "

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    if [ "$UNAME" == "Darwin" ]; then
        alias ls='ls -G'
    else
        eval "`dircolors -b`"
        alias ls='ls --color=auto'
    fi
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'

    alias grep='LC_ALL=POXIS grep --color=auto'
    alias fgrep='LC_ALL=POXIS fgrep --color=auto'
    alias egrep='LC_ALL=POXIS egrep --color=auto'
fi
# GREP color settings
export GREP_COLORS="fn=01;37"

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

###########################################################
#	Colorful man page
###########################################################

export PAGER="`which less` -s"
#export BROWSER="$PAGER"
export LESS_TERMCAP_mb=$'\E[0;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[1;31m' # begin bold
export LESS_TERMCAP_me=$'\E[0m'    # end mode
export LESS_TERMCAP_se=$'\E[0m'    # end standout-mode
export LESS_TERMCAP_so=$'\E[0;43;30m' # begin standout-mode - search box
export LESS_TERMCAP_ue=$'\E[0m'    # end underline 
export LESS_TERMCAP_us=$'\E[1;33m' # begin underline

###########################################################
#       Avoiding duplicated path in $PATH
###########################################################

# Use this macro to add a path to $PATH for avoiding duplication of path 
_add_to_PATH ()
{
    if [ -d "${1}" ] && [[ ! "$PATH" =~ (^|:)"${1}"(:|$) ]]; then
        if [ "${2}" == "HEAD" ]; then
            export PATH=${1}:$PATH
        else
            export PATH=$PATH:${1}
        fi
    fi
}

###########################################################
#       Other settings
###########################################################

# autojump (https://github.com/joelthelion/autojump/wiki)
# installed by "brew install autojump"
[[ -s /usr/local/etc/autojump.bash ]] && . /usr/local/etc/autojump.bash 
# installed from the source package (GitHub)
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh
# installed by "sudo apt-get install autojump"
[[ -s /usr/share/autojump/autojump.bash ]] && . /usr/share/autojump/autojump.bash

###########################################################
#	Custom settings for projects
###########################################################

_load_custom_settings ()
{
    if [ -f ~/$1 ]; then
        . ~/$1
    else
        echo "Configuration file doesn't exist: ~/$1"
    fi
}

# Create a ".bash_custom" under your $HOME dir. In that file, list all the custom 
# configuration files that need to be loaded
# p.s. using the above macro (_load_custom_settings) to load the configuration file
if [ -f ~/.bash_custom ]; then
    . ~/.bash_custom
fi 

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
