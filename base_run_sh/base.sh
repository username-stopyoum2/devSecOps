#!/bin/bash
echo -e "$HOME 디렉토리에 $PWD 를 소프트 링크로 설정하시겠습니까 ? ( y | n ) : "
read line

mkdir -p $HOME/.mylog/ -m 0640  

#ln -s 옵션 풀로 수정할 것.
[ ${line} == 'y' ] || [ ${line} == 'yes' ] && ln -s $PWD $HOME/base_run_sh #  && echo -e "하드링크가 정상처리됨. : "`ls $HOME | egrep -o 'base_run_sh'`

echo -e "$PWD 에 위치한 파일 리스트 :\n\n\t"`ls`
echo -e "파일리스트를 환경 변수에 추가 설정 하시겠습니까 ? ( y | n ) : "
read line
[ ${line} == 'y' ] || [ ${line} == 'yes' ] && {
	echo -e "\nexport PATH=$PATH:$PWD\n" >> /etc/profile
	source /etc/profile
}
if [ "${1}" == '-a' ] || [ "${1}" == '--append-install' ]; then
	list=(${2})
	for package in ${list[*]};do
		echo -e $package
		remove_install.sh "${package}"
	done
fi

list=("epel-release" "yum-utils" "jq" "curl" "wget" "net-tools" "bash-completion" "git")

echo -e "기본 패키지 리스트 : \n\n\t""${list[*]}"
echo -e "기본 패키지들을 설치 하시겠습니까?( y | n ) : "
read line
[ ${line} == 'y' ] || [ ${line} == 'yes' ] && {

	for package in ${list[*]};do
		remove_install.sh "${package}"	
	done

cat base_function.sh >> /etc/profile
cat find_function.sh >> /etc/profile
source /etc/profile

echo -e '!!!! finished !!!!'

echo "reboot을 해야 시스템에 설정한 값들이 정상적용됩니다. 안할 시 비정상 동작이 발생할 수 있습니다. reboot을 하시겠습니까? ( y | n ) : "
read line 
[ ${line} == 'y' || ${line} == 'yes' ] && reboot

#
#{
#	yum -y install wget 
#	yum -y install net-tools
#	yum -y install bash-completion
#	yum -y install update
#	yum -y install epel-release
#}

	
#echo -e '#!/bin/bash'"\n cd $PATH; main.sh;" > /etc/rc.d/rc.locale
#chmod +x /etc/rc.d/rc.local

#print.sh 'reboot'



}

