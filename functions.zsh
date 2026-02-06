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
