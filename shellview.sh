#!/bin/sh
# ShellView v0.4
_has-a2=$(dpkg-query -W --showformat='${status}\n' apache2|grep "install ok installed")
_has-f2b=$(dpkg-query -W --showformat='${Status}\n' fail2ban|grep "install ok installed")
dialog --backtitle "ShellView" \
	--title "ShellView 0.4" \
	--menu "Please select a view" 20 100 12 \
	failedconn "SSH: Failed connect attempts" \
	bruteforce "SSH: Brute-force attempts" \
	fail2ban "Fail2ban" \
	apache2error "Apache2: Error log" \
	apache2access "Apache2: Access log" \
	apache2enabled "Apache2: Enabled sites" \
	sysload "System: Load" \
	sysdrive "System: Drive space" \
	about "About ShellView" \
	2>temp
if [ "$?" = "0" ]
then
	_return=$(cat temp)
	if [ "$_return" = "failedconn" ]
	then
		~/shellview/check/ssh/fconn.sh
	fi
	if [ "$_return" = "bruteforce" ]
	then
		~/shellview/check/ssh/brute.sh
	fi
	if [ "$_has-f2b" != "" ]
	then
		if [ "$_return" = "fail2ban" ]
		then
			~/shellview/check/fail2ban/fail2ban.sh
		fi
	else
		dialog --backtitle "ShellView" \
			--title "Error" \
			--msgbox "fail2ban isnt installed" 15 150
	fi
	if [ "$_has-a2" != "" ]; then
		if [ "$_return" = "apache2error" ]
		then
			~/shellview/check/apache2/error.sh
		fi
		if [ "$_return" = "apache2access" ]
		then
			~/shellview/check/apache2/access.sh
		fi
		if [ "$_return" = "apache2enabled" ]
		then
			~/shellview/check/apache2/enabled.sh
		fi
	else
		dialog --backtitle "ShellView" \
			--title "Error" \
			--msgbox "Apache2 isnt installed" 15 150
	fi
	if [ "$_return" = "sysload" ]
	then
		~/shellview/tools/sysload.sh
	fi
	if [ "$_return" = "sysdrive" ]
	then
		~/shellview/tools/sysdrive.sh
	fi
	if [ "$_return" = "about" ]
	then
		~/shellview/tools/about.sh
	fi
fi

rm -f temp
clear
