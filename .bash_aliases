# Color Definitions
COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

# some more ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias vi='vim'
alias clip='xclip -selection c'
alias df='df -Th --total'
alias du='du -ach|sort -h'
alias free='free -mt'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias mkdir='mkdir -pv  '
alias myip='curl http://ipecho.net/plain; echo'
alias ..='cd ..'
alias agi="apt-get install -y"
alias passgen="date +%s | sha256sum | base64 | head -c 32; echo"
alias python=python3
alias pip=pip3

# Functions
mcd() {
    mkdir -p $1
    cd $1
}

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "[$RETVAL]: "
}
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[30;41m\]\`nonzero_return\`\[\e[m\]\[\e[32m\]\d\[\e[m\]\[\e[32m\] \[\e[m\]\[\e[32m\]\A\[\e[m\] \[\e[35m\]\u\[\e[m\]\[\e[35m\]@\[\e[m\]\[\e[35m\]\H\[\e[m\]\n\[\e[36m\][\[\e[m\]\[\e[36m\]\w\[\e[m\]\[\e[36m\]]\[\e[m\] \[\e[35m\]\`parse_git_branch\`\[\e[m\]\[\e[37m\]\\$\[\e[m\] "
