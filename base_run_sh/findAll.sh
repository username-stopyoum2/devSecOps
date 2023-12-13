#!/bin/bash


find / 2>/dev/null | while read line;do
	if [ -r "${line}" -a -w "${line}" -a -x "${line}" ];then
		ls -l "${line}"
	fi

done
