# download zsh
echo "[+] Download ZSH"
sudo apt update ; sudo apt install zsh git -y
echo "[+] ZSH as default shell"
sudo chsh -s $(which zsh) $(whoami)

# download this repo
echo "[+] Clone Momro repo"
git clone https://github.com/Momro/zshconfig.git

# install oh-my-zsh
echo "[+] Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Remove old .zshrc and replace with symlink to new .zshrc
cd $HOME ; rm .zshrc .zshrc.pre-oh-my-zsh ; ln -s $HOME/zshconfig/.zshrc $HOME/.zshrc

# Requires lolcat ;) and autojump:
echo "[+] Install lolcat and autojump"
sudo apt install lolcat autojump -y

# zsh autosuggestions:
echo "[+] Install zsh autosuggestion"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh syntax highlighting:
echo "[+] Install syntax highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
