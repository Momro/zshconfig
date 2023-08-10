export LESS="-iXr"

# config folder
XDG_CONFIG_HOME=~/.config/

if [ -f "$HOME/.local/bin/gitup" ] ; then
	PATH="$HOME/.local/bin/:$PATH"                                                       
fi  

# mal schauen, ob das funktioniert
export SUDO_EDITOR="vim"
export env_editor="vim"

# autojump
#[[ -s /home/pfister/.autojump/etc/profile.d/autojump.sh ]] && source /home/pfister/.autojump/etc/profile.d/autojump.sh
#autoload -U compinit && compinit -u
