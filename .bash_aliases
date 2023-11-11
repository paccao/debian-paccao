# Utils
alias ..='cd ..'
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias mv='mv -i' # Prevent overwrite with mv cmd

alias ls='ls --group-directories-first -CF --color=auto'
alias l='ls --group-directories-first -AlhF'
alias ll='ls -ltr'
alias lt='ll -t'                  	# sort by date
alias lz='ll -rS'                   # sort by size
alias ali='vim ~/.bash_aliases'
alias alis='source ~/.bash_aliases'
alias bt='bluetoothctl'
alias pciinfo='lspci -v'
alias sysinfo='inxi -Fxzd'
alias bluezinfo="pactl list | grep -Pzo '.*bluez_card(.*\n)*'"
alias c='code'
alias todo='vim ~/Documents/TODO_LIST.md'
alias docs='vim ~/Documents'
alias sdocs='rg -w ~/Documents -e '									# search ~/Documents and print path to file
alias sodocs='sdocs $1 | awk {grep pwd} | nvim'
alias osdocs='cd ~/Documents && fzf > fzfout && nvim $(cat fzfout)'	# search ~/Documents with fzf and open file in vim
alias less_nowrap='less -S +F'											# disable wordwrap on output
alias startup='source ~/startup.sh'
alias clipboard='xclip -selection c'
alias firmwareupdate='fwupdmgr update'
alias diskusage='ncdu'
alias process='ps -aux | head -n1 && ps -aux'

## Devices
alias keyboard='setxkbmap -layout us,se -option "grp:win_space_toggle" && xmodmap .Xmodmap'
alias list_connected_monitors='xrandr -q | grep " connected" | head -n 1 | cut -d " " -f1'
alias brightness='xrandr --output eDP-1 --brightness'


# search all files in system for pattern
sfiles () {
	if [ $# -eq 0 ]
		then
			printf "Missing arguments.\n
	1st: <search_dir_target_path>
	2nd: <pattern>\n
 "
			return
	fi
	
	#if [[ -z $# ]]
	#	then
	#		printf "Input was empty, try again."
	#		return
	#fi

	grep -rnw '$1' -e '$2'
}

mcd () { 																						# create directory and change working dir to that one
        [ -d $1 ] || mkdir $1
        cd $1 && pwd
}

# Git
alias g='git'
alias gp='git pull'
alias gs='git status'
alias get_default_branch="git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'"
alias gsm='git switch `get_default_branch`'
alias ga='git add .'
alias gf='git fetch'
alias gc='git commit' 
alias gbr='git branch -r'
alias gbl='git branch'
alias gcb='git rev-parse --abbrev-ref HEAD'
# MERGE, RISKY: alias ggsmm='CURRENT=`gcb` && gp && gsm ; MAIN=`gcb` && gp && g switch $CURRENT && g merge $MAIN'
alias ggsmm='git pull origin $(gcb) --rebase'
alias gsmgs='CURRENT=`gcb` && gsm ; gs && g switch $CURRENT'
alias deletelocalbranch='git branch --delete'
alias gpushu='git push -u origin $(gcb)'

# Kube
alias t='terraform'
alias k='kubectl'
alias kc='kubectx'
alias ke='kubens'
alias ku='kustomize'

# trash
#alias rm='echo "use tr (trash-cli) instead!"'
#alias tr='trash'
#alias trl='trash-list'
#alias trr='trash-restore'
#alias tre='trash-empty'
#alias trre='FILE_PATH_REMOVE=$1 && trash FILE_PATH_REMOVE && trash-rm "$FILE_PATH_REMOVE" && unset FILE_PATH_REMOVE'

# IP and network 
alias pubip="curl ifconfig.me"
alias localip="ip route list"
alias localips="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\\.){3}[0-9]*' | grep -Eo '([0-9]*\\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias ips="ifconfig -a | grep -o 'inet6\\? \\(addr:\\)\\?\\s\\?\\(\\(\\([0-9]\\+\\.\\)\\{3\\}[0-9]\\+\\)\\|[a-fA-F0-9:]\\+\\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias dns="nmcli dev show | grep DNS"
alias wifilist="nmcli dev wifi"
alias netconns="nmcli dev status"
alias wifistatus="nmcli radio wifi"
alias wificonnect="sudo nmcli dev wifi connect"
# sudo nmcli dev wifi connect <network-ssid-name> password <password>

# Shortcuts
alias dl="cd ~/Downloads"
alias df='df -h'
alias du='du -c -h'
alias ping='ping -c 3'
alias co='cd ~/c'
alias bat='batcat'

## markdown
alias md='glow'


# Explains a bash command, opens https://explainshell.com/
explain() {
	open "https://explainshell.com/explain?cmd=$1";
}

# Open a web page
net() {
	open "https://www.$1";
}

# Interactively deletes workflow runs from a GitHub repository
# Download this script from https://github.com/qmacro/dotfiles/blob/230c6df494f239e9d1762794943847816e1b7c32/scripts/dwr and store it somewhere on your system
# Usage: `dwr <github-user/repo-name>` Ex: `dwr paccao/debian-paccao` then TAB through which runs you want to delete. You can go to the top and hold TAB to select faster.
alias dwr='. ~/scripts/dwr.sh'
	
#View specified line range of a file:
viewlines () { sed -n ''$1','$2'p' $3; }

#Example:
#viewlines 13 37 file.txt  #Displays lines 13-37 of file.txt

#Uses Google text-to-speech to speak text. I use it all the time. Example: gsay hello world
#gsay() { if [[ "${1}" =~ -[a-z]{2} ]]; then local lang=${1#-}; local text="${*#$1}"; else local lang=${LANG%_*}; local text="$*";fi; mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null ; }
