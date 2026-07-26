function base64decode { 
	echo "$1" | base64 -d 
}

function docker-health() {
  docker inspect --format='{{json .State.Health}}' "$@" | jq
}

function generate-password() {
        if [[ $@ < 10 ]] ; then
                pass=$(openssl rand -hex 10)
        else
                pass=$(openssl rand -hex $@)
        fi

        echo $pass | head -c $@ ; echo
}

function docker-logs() {
	echo "[!] custom function"
	if [[ $@ == '' ]] ; then
		docker compose logs -f
	else
		docker logs --tail 50 $@
	fi
}

function biggestfiles {
	if [[ "${1}" = "" ]] ; then
		1="."
	fi
	if [[ "${2}" = "" ]] ; then
		2="10"
	fi
			
	du -ah "${1}" | sort -rh | head -n "${2}"
}
function cread {
  read "value?${1}: "
  echo -n "${value}"
}

function ripcd {
  artist=$(cread "Artist")
  album=$(cread "Album")
  ordner="${HOME}/Musik/${artist}/${album}"
  cdnummer=$(cread "CD-Nummer")
  if [[  "${cdnummer}" != "" ]] ; then
    ordner="${HOME}/Musik/${artist}/${album}/CD${cdnummer}"
  fi

  cdlaufwerknummer=$(cread "CD-Laufwerk_(Nummer)")

  device="/dev/sr${cdlaufwerknummer}"
  echo "Device is '${device}'."
  mkdir -p "${ordner}"
  echo "[+] Folder '${ordner}' created."
  cd "${ordner}"

  if [[ ! $(findmnt "${device}") = ""  ]] ; then
    echo "[\!] CD mounted; unmounting" ;
    sudo umount "${device}" ; 
  fi ;

  icedax -D "${device}" -B && eject "${device}" && conv2mp3.sh . . wav 2 && rm *.inf && echo "[+] Ripped CD '${cdnummer}', '${album}' by '${artist}'"
}
