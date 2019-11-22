#!/bin/bash
#=================================================
#	Description: Delete .aria2 file after Aria2 download is complete
#	Lisence: MIT
#	Version: 1.8
#	Author: P3TERX
#	Blog: https://p3terx.com
#=================================================

downloadpath='/root/Download' #Aria2下载目录

filepath=$3
rdp=${filepath#${downloadpath}/}
path=${downloadpath}/${rdp%%/*}

if [ $2 -eq 0 ]
	then
		exit 0
elif [ "$path" = "$filepath" ] && [ $2 -eq 1 ]
	then
	[ -e "$filepath".aria2 ] && rm -vf "$filepath".aria2
	exit 0
elif [ "$path" != "$filepath" ] && [ $2 -gt 1 ]
	then
	[ -e "$path".aria2 ] && rm -vf "$path".aria2
	exit 0
elif [ "$path" != "$filepath" ] && [ $2 -eq 1 ]
	then
	[ -e "$filepath".aria2 ] && rm -vf "$filepath".aria2
	exit 0
fi