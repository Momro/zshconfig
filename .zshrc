# Path to your oh-my-zsh installation.
HOMEFOLDER="$HOME"
# Path to all ZSH config files
ZSHCONFIGFILES="$HOME/zshconfig"

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

# auto-load github ssh key
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/github 2>/dev/null
fi

source $ZSH/oh-my-zsh.sh

# Load all other configs
source $ZSHCONFIGFILES/sourcefiles.zsh

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
