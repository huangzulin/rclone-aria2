#!/bin/bash
#=================================================
#   Description: Get trackers and add to aria2.conf
#   Lisence: MIT
#   Version: 1.0
#   Author: P3TERX
#   Blog: https://p3terx.com
#=================================================
INFO="[\033[32mINFO\033[0m]"
ERROR="[\033[31mERROR\033[0m]"
echo && echo -e "$INFO Get trackers ..."
aria2_conf=${1:-aria2.conf}
tracker=$(curl -fLs https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt | awk NF | sed ":a;N;s/\n/,/g;ta")
[ -z $tracker ] && echo -e "
$ERROR Unable to get trackers, network failure or invalid links." && exit 1
echo -e "
--------------------[TRACKERS]--------------------
${tracker}
--------------------[TRACKERS]--------------------
"
[ ${aria2_conf} == "cat" ] && exit 0
echo -e "$INFO Adding trackers to '${aria2_conf}' ..." && echo
if [ ! -f ${aria2_conf} ]; then
	echo -e "$ERROR '${aria2_conf}' does not exist."
	exit 1
else
	[ -z $(grep "bt-tracker=" ${aria2_conf}) ] && echo "bt-tracker=" >>${aria2_conf}
	sed -i "s@^\(bt-tracker=\).*@\1${tracker}@" ${aria2_conf} && echo -e "$INFO Trackers added successfully!"
fi
