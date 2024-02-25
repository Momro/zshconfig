Meine ZSH-Config

Kleine Besonderheit:
Mit "script-logging.zsh" kann man das Logging des Konsolenfensters einschalten.
Dafür sind folgende Anpassungen notwendig:
- `source /usr/etc/zsh/script-logging.zsh`
- Datei 'scriptOutput.cfgẁ wird im Ordner `~/.config/scriptOutput/` gesucht
- In der Datei kann man konfigurieren, ob man überhaupt gefragt werden will (z.B. in Kali an, im Office-Linux nicht), und wo das Verzeichnis sein soll (z.B. `~/projekte/logging/`)

Requires lolcat ;)
sudo apt install lolcat
