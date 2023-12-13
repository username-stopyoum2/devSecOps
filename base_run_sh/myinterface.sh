interface=`ip addr | egrep -i '[0-9]:.+:.+<broadcast.multicast.up.lower_up.*' | awk '{ printf("%s",$2); }'`

interface=${interface//:/}
printf "${interface}"
