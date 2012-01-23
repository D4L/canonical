echo "Greetings Austin, today is `date`"

echo "Assigning aliases ..."

alias la='ls -aF --color'
alias ls='ls -F --color'
alias ll='ls -lF --color'
alias vim='gvim'
alias cd='cdls'

echo "Adding PATHs ..."

PATH=$PATH:$HOME/bin

echo "Changing PS1 ..."

PS1="$(tput bold)$(tput setaf 7)AT: $(tput setaf 6) \w$(tput sgr0)\r\n$(tput setaf 3)\u >$(tput sgr0) "

echo "Creating functions (cdls, cdl, reterm)"

BASHFUNCTIONS=~/.bashfunctions
function cdls () { source $BASHFUNCTIONS/cdls.sh; }
function cdl () { source $BASHFUNCTIONS/cdl.sh; }
function reterm () { source $BASHFUNCTIONS/reterm.sh; }

echo "Finished setup, have a good day!"
cd ~
