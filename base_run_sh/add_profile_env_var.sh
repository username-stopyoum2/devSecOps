
function add_profile_env_var {
	echo -e "/etc/profile에 을 환경변수로 등록하시겠습니까? ( y | n ) : "
	read line
	[ y == 'y' -o y == 'yes' ] && {
		if [ ! -z "" ];then
			echo -e 'PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin:/mnt/hgfs/VMwareSharedFolder-2/shellScripts/base_run_sh:'"
 export PATH
" >> /etc/profile
		else
			echo -e 'PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin:/mnt/hgfs/VMwareSharedFolder-2/shellScripts/base_run_sh:'"/mnt/hgfs/VMwareSharedFolder-2/shellScripts/base_run_sh 
 export PATH
" >> /etc/profile
		fi
	}



}
add_profile_env_var "/mnt/hgfs/VMwareSharedFolder-2/shellScripts/base_run_sh/./base.sh"

