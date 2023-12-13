#!/bin/bash
# my_network_manager.sh -gi -gp -gnb -gif -g3o| jq '.키'
# {"IP": "172.27.88.126", "PREFIX": "20", "NETWORK_BAND": "172.27.88.0", "OCTET_3": "172.27.88.", "INTERFACE": "ens32"} 출력




ip_prefix_broadcast_interface=$(ip addr | grep -E "inet .*global") 
# inet 172.27.88.126/20 brd 172.27.95.255 scope global dynamic ens32 inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0


MYIP=$(myip.sh) 
		
MYIP_SPLIT_ARR=($(echo $MYIP | tr '.' ' '))
MY_NETWORK=""
for (( i = 0; i < ${#MYIP_SPLIT_ARR[*]} -1; i++ ));do
	MY_NETWORK+=${MYIP_SPLIT_ARR[$i]}"."
done


RESULT=""
MY_JSON_OBJECT_PARAMS=""

for arg in ${*};do

	case $arg in 

		--get-ip|-gip)
			MY_JSON_OBJECT_PARAMS+="-a IP ${MYIP}"
		;;

		--get-prefix|-gp)
			prefix=$(echo -e ${ip_prefix_broadcast_interface} | sed -r 's/inet //g' | sed -r 's/ .+//g' | sed -r 's/.+\///g')
			MY_JSON_OBJECT_PARAMS+=" -a PREFIX ${prefix}"
		;;


		--get-interface|-gif)
			interface=$(myinterface.sh)
			MY_JSON_OBJECT_PARAMS+=" -a INTERFACE ${interface}"
		;;

		--get-network-band|-gnb) # 넽대역.0 반환
			MY_JSON_OBJECT_PARAMS+=" -a NETWORK_BAND ${MY_NETWORK}0"
		;;

		--get-3octet|-g3o)
			MY_JSON_OBJECT_PARAMS+=" -a OCTET_3 ${MY_NETWORK}"

		;;


		*)
			echo "해당옵션 없음"
		;;

	esac
done
echo $(my_json_object.sh ${MY_JSON_OBJECT_PARAMS})
