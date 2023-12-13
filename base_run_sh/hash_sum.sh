#!/bin/bash

sum_arr=("cksum" "md5sum" "sha1sum" "sha224sum" "sha256sum" "sha384sum" "sha512sum" "shasum" "sum")

index=0

for sum in ${sum_arr[*]};do
	which=`which ${sum}`;

	[ ! -z "${which}" ] && {
		printf "${sum}:"
		result=`echo -e "${1}" |"${sum}"`
		result=${result//-/}
		result=${result// /}
		echo -e "${result}"
		
	}

done
