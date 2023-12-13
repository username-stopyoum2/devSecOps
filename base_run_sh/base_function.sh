#!/bin/bash

echo -e "
function add_profile_env_var {
	echo -e \"/etc/profile에 ${1}을 환경변수로 등록하시겠습니까? ( y | n ) : \"
	read line
	[ $line == 'y' -o $line == 'yes' ] && {
		if [ ! -z \"${1}\" ];then
			echo -e 'PATH=$PATH:'$1\"\n export PATH\n\" >> /etc/profile
		else
			echo -e 'PATH=$PATH:'\"$PWD \n export PATH\n\" >> /etc/profile
		fi
	}

}
add_profile_env_var \"${PWD}/${0}\"
" > add_profile_env_var.sh 




function check_home_dir {
	if [ -h ~/base_run_sh -a -h ~/shellScripts ];then
		return 0
	else
		return -1
	fi
}


log_create_dir () {
#1. '-d 디렉' ,  '--directory-create 디렉 '
	[ ! -z "${1}" ] && {
		if [[ "${1}" == *'-d'* ]] && [[ ${1} == *"--directory-create"* ]];then
			dir=${1//'-d |--directory-create '/''};
			dir=`echo ${dir} | cut -d ' ' -f 1`
			mkdir -p $HOME/.mylog/${dir} -m 0640;
		fi
	}
}



function remove_install {
	rpm --rebuilddb
	installed=`rpm -qa ${1}`
	echo -e 'network checking..'
	ping -c 2 8.8.8.8 1>/dev/null && {
		[ "${installed}" != "" ] && {
			echo -e "${1}""가 이미 설치되어 있습니다. 지우시겠습니까? ( y | n) : "
			read line
			[ "${line}" == 'y' ] || [ "${line}" == "yes" ] && {
				echo -e "removing.. "
				rpm -e "${1}" --nodeps;
				rpm --rebuilddb
				
					
					
				installed=`rpm -qa ${1}`
			}
		}

		yum info "${1}" && [ "${installed}" == "" ] && {
			echo -e "${1}""을 설치하시겠습니까? ( y | n )"
			read line;
			[ "${line}" == 'y' ] || [ "${line}" == "yes" ] && {
				echo -e "installing.. "
				yum -y install "${1}"
				rpm --rebuilddb
			}

		}
	}
}

systemctl_base () {

	systemctl start ${*}
	systemctl enable ${*}
	systemctl is-enabled ${*} 1>/dev/null || systemctl enable ${*} && systemctl status ${*}
}

my_backup () {
	select line in "백업" "복원";do
		case $line in
			1)
				echo -e "백업할 디렉터리 경로를 입력해주세요 : "
				read line
				if [ ! -z "${line}" ];then
					find "${line}" | cpio -ocv > backup.cpio
				fi
			;;
			2)
				echo -e "복원할 cpio 파일을 입력해주세요 : "
				read line
				if [ ! -z "${line}" ];then
					cpio -icdv < "${line}"
				fi
				
			;;
			*)
				echo -e "잘못입력하였습니다. 프로그램을 종료합니다."
				exit -1;
			;;
		esac
	done
}




