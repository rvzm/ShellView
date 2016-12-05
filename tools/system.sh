#!/bin/sh
dialog --backtitle "ShellView" \
	--title "ShellView - System" \
	--menu "Please select a view" 20 100 4 \
	info "Sysinfo" \
	load "Load" \
	disk "Disk Usage" \
	user "Current logged in users" \
	2>temp
if [ "$?" = "0" ]
then
	_return=$(cat temp)
	rm -f temp
	if [ "$_return" = "info" ]
	then
		~/shellview/tools/sysinfo.sh
	fi
	if [ "$_return" = "load" ]
	then
		~/shellview/tools/sysload.sh
	fi
	if [ "$_return" = "disk" ]
	then
		~/shellview/tools/sysdrive.sh
	fi
	if [ "$_return" = "user" ]
	then
		~/shellview/tools/sysuser.sh
	fi
else
	~/shellview/shellview.sh
fi

