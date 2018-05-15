# Color Definitions
COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

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
alias sl='/usr/games/sl'
alias agi="apt-get install -y"
alias passgen="date +%s | sha256sum | base64 | head -c 32; echo"

# Functions
mcd() {
    mkdir -p $1
    cd $1
}

