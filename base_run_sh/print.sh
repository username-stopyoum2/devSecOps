#!/bin/bash
{
	pwd=""

	hostname=$(echo -e "$HOSTNAME" | cut -d '.' -f 1)
	
	if [ "${PWD}" != '/' ] && [ "${PWD}" != '/'"$USER" ]
		then
			pwd=(${PWD//'/'/' '}) 
			pwd_len=${#pwd[*]}
			pwd="${pwd[pwd_len-1]}"


	elif [ "${PWD}" == '/'"$USER" ]
		then
			pwd='~'
			
	else
		[ "${pwd}" == "" ] && pwd=$PWD
	fi

	#pwd_len=${#pwd[*]}
	#pwd="${pwd[$pwd_len-1]}" 
	
	if [[ "${1}" != *'cancel;'* ]]
		then
			echo -e '['"$USER"'@'"${hostname} ""${pwd}"']# '"${1}"
	elif [[ "${1}" == *'cancel;'* ]]
		then
			tmp=${1}
			tmp=${tmp/'cancel;'/''}
			echo -e '['"$USER"'@'"${hostname} ""${pwd}"']# '"${tmp}"
	fi
	
	read readline
	[ "$readline" != 'n' ] && [ "$readline" != 'no' ] && [ "$readline" != 'c' -a "$readline" !=  'cancel' ] && {
		[[ "${1}" != *'vi'* ]] && [[ "${1}" != *'echo'* ]] && [[ "${1}" != *'cancel;'* ]] && ${1}
	}

} 2>/dev/null
