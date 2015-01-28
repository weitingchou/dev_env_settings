# some more ls aliases
alias la='ls -A'
alias l='ls -CF'
alias lm='ls -al'
alias ll='ls -l'
alias l='ls -l'
alias la='ls -la'
alias sl='ls'
alias LS='ls'
alias SL='ls'

# some more cd aliases
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'

# Add an "alert" alias for long running commands. Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1| sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

