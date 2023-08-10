# alt
# PS1='%#%F{white}[%n@%m]%F{yellow}%B%~: %f%b'


# für bash
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# für zsh
colorMyKali="%F{15}" # white
colorNotebook="%F{6}" # teal
colorPentestbox="%B%F{12}" # blue
colorRootserver="%F{11}" # yellow
colorHostname=""
colorNone="%f%b"

if [[ $(hostname) == *"ptbox"* ]] ; then
	colorHostname=$colorPentestbox
elif [[ $(hostname) == "NBSkuta" || $(hostname) == "NBPfister" ]] ; then
	colorHostname=$colorNotebook
elif [[ $(hostname) == "pta1" ]] ; then
	colorHostname=$colorRootserver
else
	colorHostname=$colorMyKali
fi

if [[ $(whoami) == "skuta" ]] ; then
	# 7 ist silber, siehe auch https://jonasjacek.github.io/colors/
	colorUsername="%F{7}" # silver
else
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

if [ $(whoami) = "pfister" ] ; then
	ACCESS_RIGHTS="$"
	colorUsername=""
else
	ACCESS_RIGHTS="#"
	colorUsername=""
fi



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
