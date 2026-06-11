# download zsh
echo "[+] Download ZSH"
which sudo ; if [[ $? == 0 ]] ; then 
  sudo apt update ; sudo apt install zsh git -y
else
  apt update ; apt install zsh git -y
fi

echo "[+] ZSH as default shell"

which sudo ; if [[ $? == 0 ]] ; then 
  sudo chsh -s $(which zsh) $(whoami)
else
  chsh -s $(which zsh) $(whoami)
fi

# download this repo
echo "[+] Clone Momro repo"
git clone https://github.com/Momro/zshconfig.git ~/zshconfig

# install oh-my-zsh
echo "[+] Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Remove old .zshrc and replace with symlink to new .zshrc
cd $HOME ; rm .zshrc .zshrc.pre-oh-my-zsh ; ln -s $HOME/zshconfig/.zshrc $HOME/.zshrc

# Requires autojump:
echo "[+] Install autojump"
which sudo ; if [[ $? == 0 ]] ; then 
  sudo apt install autojump -y
else
  apt install -y autojump
fi

# zsh autosuggestions:
echo "[+] Install zsh autosuggestion"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh syntax highlighting:
echo "[+] Install syntax highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
