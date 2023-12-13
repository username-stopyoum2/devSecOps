#!/bin/bash

function check_home_sym {
	if [ -L ~/base_run_sh ] && [ -L ~/shellScripts ];then
		echo -e "true"	
	else
		echo -e "false"
	fi
}

check_home_sym


