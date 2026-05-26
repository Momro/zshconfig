# für bash
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# für zsh

# HOST NAME COLOR PICKER
## allowed colors for the host name:
ALLOWED_COLORS=(6 9 11 12 13 14 27 33 39 45 46 47 48 51 66 67 68 69 72 73 74 75 76 80 81 82 83 98 99 106 107 109 110 111 112 113 118 135 141 166 172 201 208 214)

## now let's check if the color was already set
HOSTNAMECOLOR_PATH="${HOME}/zshconfig/hostnamecolor.zsh"
if [ -f ${HOSTNAMECOLOR_PATH} ] ; then
        colorHostname="%F{$(cat ${HOSTNAMECOLOR_PATH})}"
else
        # choose random color
        RANDOM_HOST_COLOR=${ALLOWED_COLORS[$(( RANDOM % ${#ALLOWED_COLORS[@]} + 1 ))]}
        colorHostname="%F{${RANDOM_HOST_COLOR}}"
        echo $RANDOM_HOST_COLOR > "${HOSTNAMECOLOR_PATH}"
fi

colorNone="%f%b"

# check if root or not
if [ "$UID" -eq 0 ]; then
        # root user
        ACCESS_RIGHTS="#"
        colorUsername="%F{7}" # silver
else
        # normal user
        ACCESS_RIGHTS="$"
        colorUsername="%F{2}" # green
fi

colorTime=$colorHostname

# Set prompt info
ACCESS_RIGHTS="$"
USER="%n"
COMPUTER="%m"
USER_COMPUTER="%f%b["$colorUsername$USER$colorNone"@"$colorHostname$COMPUTER$colorNone"]"
FOLDER="%F{yellow}%B%~"
NEWLINE=$'\n'
TIME='['$colorTime'%T'$colorNone']'
GITPROMPT=' $(git_prompt_info)'

USE_RIGHT_PROMPT="false"
USE_LINE_CONNECTOR="true"
connector_line_one="╭─"
connector_line_two="" # "╰─"

if [ $USE_RIGHT_PROMPT = "true" ] ; then
	if [ $USE_LINE_CONNECTOR = "true" ] ; then
		PS1=$connector_line_one$colorHostname$USER_COMPUTER$FOLDER' %f%b'$NEWLINE$ACCESS_RIGHTS" "
"$connector_line_two%B${user_symbol}%b "
	else
		PS1=$colorHostname$USER_COMPUTER$FOLDER' %f%b'$NEWLINE$ACCESS_RIGHTS" "
			"%B${user_symbol}%b "
	fi
	RPROMPT=$TIME$GITPROMPT
else
	# $USE_RIGHT_PROMPT == false
	if [ $USE_LINE_CONNECTOR = "true" ] ; then
		PS1=$connector_line_one$TIME' '$colorHostname$USER_COMPUTER$GITPROMPT$FOLDER'%f%b'"
$connector_line_two"$ACCESS_RIGHTS" " 
	else
		PS1=$TIME' '$colorHostname$USER_COMPUTER$GITPROMPT$FOLDER'%f%b'"
"$ACCESS_RIGHTS" "${user_symbol}
	fi
	RPROMPT=""

fi
