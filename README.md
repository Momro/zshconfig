# Meine ZSH-Config

Kleine Besonderheit:
Mit "script-logging.zsh" kann man das Logging des Konsolenfensters einschalten.
Dafür sind folgende Anpassungen notwendig:
- `source /usr/etc/zsh/script-logging.zsh`
- Datei 'scriptOutput.cfgẁ wird im Ordner `~/.config/scriptOutput/` gesucht
- In der Datei kann man konfigurieren, ob man überhaupt gefragt werden will (z.B. in Kali an, im Office-Linux nicht), und wo das Verzeichnis sein soll (z.B. `~/projekte/logging/`)

```
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
```
