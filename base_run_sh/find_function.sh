#!/bin/bash

find_all_type () {
	
	find / "${1}" 2>/dev/null | while read line;do

		if [ "${2}" "${line}" ];then
			ls -l "${line}"
		fi
	done
}


find_all_read () {
	find_all_type "" "-r"
}

find_all_write () {
	find_all_type "" '-w'	
}

find_all_run () {
	find_all_type "" '-x'
}

find_file_read () {
	find_all_type '-type f' "-r"
}

find_file_write () {
	find_all_type '-type f' '-w'
}

find_file_run () {
	find_all_type '-type f' '-x'
}





