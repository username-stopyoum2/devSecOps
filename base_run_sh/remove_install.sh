#!/bin/bash

# 실파 값 `argument_perser.sh  -옵션 값 --옵션 값;`
rpm --rebuilddb
installed=`rpm -qa ${1}`
echo -e 'network checking..'
ping -c 2 8.8.8.8 1>/dev/null && {
	[ "${installed}" != "" ] && {
		printf "${1}""가 이미 설치되어 있습니다. 지우시겠습니까? ( y | n) : "
		read line
		[ "${line}" == 'y' ] || [ "${line}" == "yes" ] && {
			echo -e "removing.. "
			rpm -e "${1}" --nodeps;
			rpm --rebuilddb
			rpm -q "${1}" --changelog 1>$HOME/.mylog/rpm_q_changelog.log 2>/dev/null
			rpm -V "${1}" 1>$HOME/.mylog/rpm_V.log 2>/dev/null 




			installed=`rpm -qa ${1}`
		}
	}



	yum list "${1}" 1>/dev/null && [ "${installed}" == "" ] && {
		printf "${1}""을 설치하시겠습니까? ( y | n ) : "
		read line;
		[ "${line}" == 'y' ] || [ "${line}" == "yes" ] && {
			echo -e "installing.. "
			yum -y update
			yum -y install "${1}"
			rpm --rebuilddb
			cat /var/log/yum.log* 1>$HOME/.mylog/var_log_yum_log 2>/dev/null
			yum history 1>$HOME/.mylog/yum_history

		}
	}
}
