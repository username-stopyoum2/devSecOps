#!/bin/bash

# 실파 값 `argument_perser.sh  -옵션 값 --옵션 값;`

#아규먼트 파싱
case "${*}" in;
	-u||--url||-?-u(rl)?)
		${*//-?-u(rl)?//img}
	;;

	)
	;;
esac