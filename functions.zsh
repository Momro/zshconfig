function base64decode { 
	echo "$1" | base64 -d 
}

function docker-health() {
  docker inspect --format='{{json .State.Health}}' "$@" | jq
}
