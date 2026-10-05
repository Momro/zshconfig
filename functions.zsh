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

function nextcloud-stop {
        echo "${1}"
        CONTINUE="${1}"
        if [[ "${1}" != "y" && "${1}" != "j" ]] ; then
                echo "[?] This will stop Nextcloud containers. Continue?"
                CONTINUE=$(cread "Sure? (y/j/N) ")
        fi

        if [[ "${CONTINUE}" = "y" || "${CONTINUE}" = "j" ]] ; then 
                echo "[!] Stopping Nextcloud containers"
                docker exec -it --env STOP_CONTAINERS=1 nextcloud-aio-mastercontainer /daily-backup.sh 
                echo "[+] Nextcloud containers stopped."

                echo "[!] Stopping master container."
                docker stop nextcloud-aio-mastercontainer 
                echo "[+] Nextcloud master container stopped."
        fi
}

function nextcloud-start { 
        echo "[?] This will start Nextcloud containers. Continue?"
        CONTINUE=$(cread "Sure? (y/j/N) ")

        if [[ "${CONTINUE}" = "y" || "${CONTINUE}" = "j" ]] ; then 
                echo "[!] Starting master container."
                docker start nextcloud-aio-mastercontainer
                echo "[+] Nextcloud master container started."

                echo "[!] Starting Nextcloud containers"
                docker exec -it --env START_CONTAINERS=1 nextcloud-aio-mastercontainer /daily-backup.sh
                echo "[+] Nextcloud containers started."
        fi
}

function nextcloud-update {
        # Run container update once
        echo "[?] This will update Nextcloud containers. Continue?"
        CONTINUE=$(cread "Sure? (y/j/N) ")

        if [[ "${CONTINUE}" = "y" || "${CONTINUE}" = "j" ]] ; then 
                echo "[*] Starting update.\nBe patient. This can take 5-7 minutes."
                if ! docker exec --env AUTOMATIC_UPDATES=1 nextcloud-aio-mastercontainer /daily-backup.sh; then
                    while docker ps --format "{{.Names}}" | grep -q "^nextcloud-aio-watchtower$"; do
                        echo "Waiting for watchtower to stop"
                        sleep 30
                    done

                    while ! docker ps --format "{{.Names}}" | grep -q "^nextcloud-aio-mastercontainer$"; do
                        echo "Waiting for Mastercontainer to start"
                        docker start nextcloud-aio-mastercontainer
                        echo " Mastercontainer started"
                    done

                    # Run container update another time to make sure that all containers are updated correctly.
                    docker exec --env AUTOMATIC_UPDATES=1 nextcloud-aio-mastercontainer /daily-backup.sh
                        echo "[+] Update finished"
                        echo "[*] Run 'nextcloud start' to restart Nextcloud."
                fi
        fi
}
