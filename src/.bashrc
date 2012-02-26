echo "Greetings Austin, today is `date`"

echo "Assigning aliases ..."

alias la='ls -aF --color'
alias ls='ls -F --color'
alias ll='ls -lF --color'
alias vim='gvim'
alias vii='/usr/bin/vim'
alias cd='cdls'
alias chrome='chromium-browser'

echo "Adding PATHs ..."

PATH=$PATH:$HOME/bin

echo "Creating functions (cdls, cdl, reterm, git-branch-g, git-dirty)"

BASHFUNCTIONS=~/.bashfunctions
function cdls () { source $BASHFUNCTIONS/cdls.sh; }
function cdl () { source $BASHFUNCTIONS/cdl.sh; }
function reterm () { source $BASHFUNCTIONS/reterm.sh; }
function git-branch-g () { source $BASHFUNCTIONS/gitbranchg.sh; }
function git-dirty () { source $BASHFUNCTIONS/gitdirty.sh; }
function lock () { gnome-screensaver-command -l; }

echo "Changing PS1 ..."

function _git_ps1 () {
    status=$(git status 2>/dev/null | tail -n 1)
    if [[ $status == "" ]]; then
        echo ""
    else
        echo "($(git-branch-g)$(git-dirty))"
    fi
}
PS1="\[$(tput bold)$(tput setaf 7)\]AT: \[$(tput setaf 6)\] \w \$(_git_ps1)\$(tput sgr0)\r\n\[$(tput setaf 3)\]\h >\[$(tput sgr0)\] "

echo "adding git auto completion ..."

source /etc/bash_completion.d/git

echo "Finished setup, have a good day!"
cd ~
