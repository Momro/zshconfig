source $ZSHCONFIGFILES/theme.d/theme.zsh
source $ZSHCONFIGFILES/environmentVariables.zsh
source $ZSHCONFIGFILES/extract.zsh
source $ZSHCONFIGFILES/alias.zsh
source $ZSHCONFIGFILES/functions.zsh
source $ZSHCONFIGFILES/prompt.zsh

# source plugins
source $ZSHCONFIGFILES/plugins.d/plugins.zsh
source $ZSHCONFIGFILES/plugins.d/plugin-config.zsh

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# check and install autojump
if [ -f $HOME/.oh-my-zsh/plugins/autojump/autojump.plugin.zsh ]; then
        source $HOME/.oh-my-zsh/plugins/autojump/autojump.plugin.zsh
else
    echo 'Autojump not installed.'
    echo 'sudo apt install autojump'
fi

source $HOME/.oh-my-zsh/plugins/dircycle/dircycle.plugin.zsh
source $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
