smart_script(){
    # if there's no SCRIPT_LOG_FILE exported yet
    if [ -z "$SCRIPT_LOG_FILE" ]; then
        # make folder paths
        logdirparent=$1
		#echo $logdirparent
        logdirraw=$(date +%F)
        logdir=$logdirparent/$logdirraw
        logfile=$logdir/$(date +%F_%T).$$.rawlog

        # if no folder exist - make one
        if [ ! -d $logdir ]; then
            mkdir -p $logdir
        fi

        export SCRIPT_LOG_FILE=$logfile
        export SCRIPT_LOG_PARENT_FOLDER=$logdirparent

        # quiet output if no args are passed
        if [ ! -z "$1" ]; then
            script -f $logfile
        else
            script -f -q $logfile
        fi

        exit
    fi
}

# Start logging into new file
alias startnewlog='unset SCRIPT_LOG_FILE && smart_script -v'

# Manually saves current log file: $ savelog logname
savelog(){
    # make folder path
    manualdir=$SCRIPT_LOG_PARENT_FOLDER/manual
    # if no folder exists - make one
    if [ ! -d $manualdir ]; then
        mkdir -p $manualdir
    fi
    # make log name
    logname=${SCRIPT_LOG_FILE##*/}
    logname=${logname%.*}
    # add user logname if passed as argument
    if [ ! -z $1 ]; then
        logname=$logname'_'$1
    fi
    # make filepaths
    txtfile=$manualdir/$logname'.txt'
    rawfile=$manualdir/$logname'.rawlog'
    # make .rawlog readable and save it to .txt file
    cat $SCRIPT_LOG_FILE | perl -pe 's/\e([^\[\]]|\[.*?[a-zA-Z]|\].*?\a)//g' | col -b > $txtfile
    # copy corresponding .rawfile
    cp $SCRIPT_LOG_FILE $rawfile
    printf 'Saved logs:\n    '$txtfile'\n    '$rawfile'\n'
}


# config einlesen
. ~/.config/scriptOutput/scriptOutput.cfg
if [[ $saveoutput == true ]] ; then
	# das überprüft, ob das Script Log file schon gespeichert wurde
	if [ -z "$SCRIPT_LOG_FILE" ]; then
		read "?Willst du speichern? (y/j/N) " speichern 
		#export $hallo
		if [[ $speichern == "y" || $speichern == "j" ]] ; then
			. ~/.config/scriptOutput/scriptOutput.cfg
			#echo $ordner
			#echo "Ok, go!"
			#script -q -f $ordner/terminal-$DATE.output
			smart_script $ordner
		else
			echo "[-] Logging nicht aktiviert"
		fi
	fi
fi
