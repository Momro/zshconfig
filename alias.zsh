# "ip a" in bunt!
alias ipa='ip -c a'
# easy poweroff
alias poweroff="systemctl poweroff"
# mein tastatur-layout umstellen
alias setdvoraklayout="setxkbmap -layout de -variant dvorak -option ctrl:nocaps"

alias cat=lolcat
alias catcat=/bin/cat
alias please=sudo
alias mv2='f(){mv -i "$@";};f'
alias mv='mv -i'
alias gitlog='git log --format="%n[Commit: %C(green)%h%Creset]  -  [Name: %C(green)%cn %C(reset)(PGP: %C(green)%G?%C(auto))]  -  [Date: %C(green)%ad%C(auto)]%d%n    %s" --date=format:"%Y-%m-%d %H:%M"'
# grep mit color und zeilennummer
alias grepc="grep -n --color"

alias cp-large=rsync -ah --info=progress2
alias generate-password='openssl rand -hex '

alias docker-status='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias docker-restart='echo "restarting docker" && docker compose down && echo "docker down" && docker compose up -d && echo "docker up again" '

