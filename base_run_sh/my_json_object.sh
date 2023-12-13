#!/bin/bash



RESULT_JSON="{"

args_arr=(${*})





for (( i=0;i<${#args_arr[*]};i++ )); do
    # 키값="-a 키1 값1"
    # 키값+=" -a 키2 값2"
    # 결과=$(./my_json_object.sh -a ${키값})
    # echo -e $결과 # {"키1": "값1", "키2": "값2"}

    if [ ${args_arr[$i]} == '-a' ] || [ ${args_arr[$i]} == '--append' ];then
#       RESULT_JSON+='"IP": '"\"${MYIP}\""', '
        RESULT_JSON+="\"${args_arr[`expr $i + 1`]}\": \"${args_arr[`expr $i + 2`]}\", "
    fi
done

#if [[ ${*} == .*'-d'.*||.*'--delete'.*  ]];then

#fi






RESULT_JSON+="}"

echo $RESULT_JSON | sed -r 's/, ?\}/}/'