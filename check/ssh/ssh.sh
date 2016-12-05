#!/bin/sh
dialog --backtitle "ShellView" \
	--title "ShellView - SSH" \
	--menu "Select view" 20 100 5 \
	failedconn "Failed connection log" \
	bruteforce "Brute-force (failed) login attempt log" \
	invalidname "Invalid login attemp log" \
	session "Session log" \
	pam "PAM log" \
	2>temp2

if [ "$?" = "0" ]
then
	_return=$(cat temp2)
	rm -f temp2
	if [ "$_return" = "failedconn" ]
	then
		~/shellview/check/ssh/fconn.sh
	fi
	if [ "$_return" = "bruteforce" ]
	then
		~/shellview/check/ssh/brute.sh
	fi
	if [ "$_return" = "invalidname" ]
	then
		~/shellview/check/ssh/invalidname.sh
	fi
	if [ "$_return" = "session" ]
	then
		~/shellview/check/ssh/session.sh
	fi
	if [ "$_return" = "pam" ]
	then
		~/shellview/check/ssh/pam.sh
	fi
else
	~/shellview/shellview.sh
fi

