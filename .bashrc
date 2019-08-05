#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Auto-generated by system
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Sync googledrive via grive2
#alias driveupdate='~/my_gits/randomscripts/google-drive-sync.sh'

# Installed via dkms, should be working through aur now
# THIS SHOULD ONLY BE USED FOR PC.
# alias installwifi='sudo dkms install -m rtl8814au -v 4.3.21'

# Perform system update with yay
alias sysupdate='yay -Syu'

# Update mirrorlist via reflector
alias mirrorupdate='sudo reflector --country Canada --age 12 \
					--protocol https --sort rate  \
					--save /etc/pacman.d/mirrorlist'

#Update bashrc
alias updatealias='source ~/.bashrc'

# Open bashrc
# A function that checks existance of either programs
# If one of them exists, it opens one of them
# If neither of them exists, it opens nano (yes ik. shut up)
function openbash() {
	package1=geany
	package2=kate
	
	if pacman -Qi $package1 &> /dev/null; 
		then geany ~/.bashrc
	elif pacman -Qi $package2 &> /dev/null; 
		then kate ~/.bashrc
	else 
		nano ~/.bashrc
	fi
}

#############
#Git Stuff  #
#############

# Clones github repo
getrepo() {
	git clone "$1"
}

# Updates the repo
alias repoup='git pull'

############################################

#######################
#THIS PART IS DOTFILES#
#######################

# Alias for git.
# Yay backups
alias config='/usr/bin/git --git-dir=/home/karlo/.cfg/ \
				--work-tree=/home/karlo'

# Pulls from remote
alias pulldot='config pull dotfiles master'

# Pushes to remote
alias pushdot='config push -f dotfiles master'


# Adds file for commiting
adddot() {
	config add "$1"
}

#Commits. Yay
commitdot() {
	config commit -m "$*"
}


###############################
#LAPTOP VERSION               #
#Original alias doesn't work. #
#Will figure it out.          #
###############################
# Pulls from remote
alias pulldotlap='config pull origin master'

# Pushes to remote
alias pushdotlap='config push -f origin master'

###############################################

###########
#VPN STUFF#
###########

# Connects to vpn server
alias vpnon='windscribe connect'

# Discconnects from vpn server
alias vpnoff='windscribe disconnect'

#####################################

####################
#Package management#
####################

# Install stuff
install() {
	sudo pacman -S "$@"
}

# Remove stuff
remove() {
	sudo pacman -R "$@"
}
#####################################

# Launch neofetch for every new terminal
neofetch

# Welcome message lol
echo "Hello $USER."

#####################################

# Checks battery stat
# Only works in laptop

function battstat() {
	tlppack=tlp
	
	if pacman -Qi $tlppack &> /dev/null; 
		then sudo tlp stat | tail -13
	else 
		echo "TLP not installed or not in laptop"
	fi
}
