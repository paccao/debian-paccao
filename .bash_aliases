# Utils
alias ..='cd ..'
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ls='ls -CF --color=auto'
alias l='ls -AlhF'
alias ll='ls -ltr'
alias lt='ll -t'                  	# sort by date
alias lz='ll -rS'                   # sort by size

mcd () {
        [ -d $1 ] || mkdir $1
        cd $1 && pwd
}

# Git
alias g='git'
alias gp='git pull'
alias gs='git status'
alias gsm='git switch master; git switch main; git switch develop'
alias ga='git add .'
alias gf='git fetch'
alias gc='git commit' 
alias gbr='git branch -r'
alias gbl='git branch'
alias rebase='echo "git switch main
git pull
git checkout local_branch_name
git rebase main
git push --force # force required if youve already pushed"'

# Kube
alias t='terraform'
alias k='kubectl'
alias kc='kubectx'
alias ke='kubens'
alias ku='kustomize'

# trash
alias rm='echo "use trash-cli instead!" ; tldr trash'
alias tr='trash'
alias trl='trash-list'
alias trr='trash-restore'

# IP addresses
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\\.){3}[0-9]*' | grep -Eo '([0-9]*\\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias ips="sudo ifconfig -a | grep -o 'inet6\\? \\(addr:\\)\\?\\s\\?\\(\\(\\([0-9]\\+\\.\\)\\{3\\}[0-9]\\+\\)\\|[a-fA-F0-9:]\\+\\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias dns="nmcli dev show | grep DNS"

# Shortcuts
alias dl="cd ~/Downloads"
alias df='df -h'
alias du='du -c -h'
alias ping='ping -c 3'

#View specified line range of a file:
viewlines () { sed -n ''$1','$2'p' $3; }

#Example:
#viewlines 13 37 file.txt  #Displays lines 13-37 of file.txt

#Uses Google text-to-speech to speak text. I use it all the time. Example: gsay hello world
#gsay() { if [[ "${1}" =~ -[a-z]{2} ]]; then local lang=${1#-}; local text="${*#$1}"; else local lang=${LANG%_*}; local text="$*";fi; mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null ; }
