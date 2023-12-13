#!/bin/bash


rpm -qc $( rpm -qa | egrep -oxi .*${1}.*) | egrep -oxi .*"${1}"'\.*c(onf|nf|fg)$'

