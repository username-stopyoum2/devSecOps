#!/bin/bash
printf "encode:"
encode=`echo -e "${1}" | base64`
echo -e "${encode}"


printf "\n\n\ndecode:"
echo -e "${encode}" | base64 -d
