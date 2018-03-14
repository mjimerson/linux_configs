# some more ls aliases
alias ll='ls -lah | ccze -A'
alias la='ls -A'
alias l='ls -CF'
alias vi='vim'
alias clip='xclip -selection c'
alias df='df -Th --total|ccze -A'
alias du='du -ach|sort -h'
alias free='free -mt|ccze -A'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias mkdir='mkdir -pv  '
alias myip='curl http://ipecho.net/plain; echo'
alias ..='cd ..'
alias lolcat='/usr/games/lolcat'

# Functions
mcd() {
    mkdir -p $1
    cd $1
}

