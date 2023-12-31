# Path to your oh-my-zsh installation.
HOMEFOLDER="/home/pfister"
# Path to all ZSH config files
ZSHCONFIGFILES="/usr/etc/zsh/sourcefiles.zsh"

# ########################
# Quick setup of oh-my-zsh 
export ZSH=$HOMEFOLDER/.oh-my-zsh

if [[ ! -d $HOMEFOLDER/.oh-my-zsh ]] ; then
        echo "oh-my-zsh ist nicht installiert. jetzt herunterladen?" 
        read install
        if [[ $install = "y" || $install = "j" ]] ; then
                sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        else
                echo "oh-my-zsh nicht installiert. Ende"
                exit
        fi
fi

source $ZSH/oh-my-zsh.sh

# Load all other configs
source $ZSHCONFIGFILES

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
