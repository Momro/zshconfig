# download zsh
sudo apt update ; sudo apt upgrade -y ; sudo apt install zsh -y

# download this repo
git clone https://github.com/Momro/zshconfig.git

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Remove old .zshrc and replace with symlink to new .zshrc
cd $HOME ; rm .zshrc .zshrc.pre-oh-my-zsh ; ln -s $HOME/zshconfig/.zshrc $HOME/.zshrc

# Requires lolcat ;) and autojump:
sudo apt install lolcat autojump

# zsh autosuggestions:
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh syntax highlighting:
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
