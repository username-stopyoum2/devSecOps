#!/bin/bash


#그냥 find /디렉 ㄲ 

#1에 디렉토리 경로 입력 시 절대경로로 반환됨.




path=""
file=""
pathfile=""
ls_R=`ls -R ${1}`
ls /dev/ | while read line;do
	echo -e "${ls_R}" | while read line2;do
		echo -e "${line2}" | egrep -o '^/.+:$' 1>/dev/null && {
			path=`echo -e "${line2}" | egrep -o '^/.+:$'`
			path=${path//:/}
		}
#echo -e "${path}"
		echo -e "${line2}" | egrep -v '^/.+:$' 1>/dev/null && {
			file=`echo -e "${line2}" | egrep -v '^/.+:$'`
#echo -e "파일 => ${file}"
		}
		pathfile="${path}/${file}"
		echo -e "${pathfile}"
	done
#		else
#			if [ -d "${net}/${line}/${line2}" ]; then
#				ls ${net}/${line}/${line2}/ | while read line3;do
					
#					if [ -f "${net}/${line}/${line2}/${line3}" ];then
#						cat "${net}/${line}/${line2}/${line3}" | egrep -o ".*${line}.*"
#					fi
#				done
#			fi
#		fi

done

