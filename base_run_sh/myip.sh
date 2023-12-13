#!/bin/bash

myip=$(ip addr | grep -E "inet .*global")
myip=$(echo ${myip//inet /})
myip=$(echo ${myip///*/}) # /프픽 부터 모두 지움

echo $myip




