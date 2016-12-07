#!/bin/sh
# ShellView v0.4
_has_dialog=$(dpkg-query -W --showformat='${status}\n' dialog|grep "install ok installed")
_has-a2=$(dpkg-query -W --showformat='${status}\n' apache2|grep "install ok installed")
_has-f2b=$(dpkg-query -W --showformat='${Status}\n' fail2ban|grep "install ok installed")
if [ "$_has_dialog" != "" ]; then
dialog --backtitle "ShellView" \
	--title "ShellView 0.4" \
	--cancel-button exit \
	--menu "Please select a view" 20 100 5 \
	ssh "SSH" \
	fail2ban "Fail2ban" \
	apache2 "Apache2" \
	system "System" \
	about "About ShellView" \
	2>temp
else
	echo "dialog not installed. use 'apt-get install dialog' to install it."
fi
if [ "$?" = "0" ]
then
	_return=$(cat temp)
	if [ "$_return" = "ssh" ]
	then
		~/shellview/check/ssh/ssh.sh
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
		if [ "$_return" = "apache2" ]
		then
			~/shellview/check/apache2/apache2.sh
		fi
	else
		dialog --backtitle "ShellView" \
			--title "Error" \
			--msgbox "Apache2 isnt installed" 15 150
	fi
	if [ "$_return" = "system" ]
	then
		~/shellview/tools/system.sh
	fi
	if [ "$_return" = "about" ]
	then
		~/shellview/tools/about.sh
	fi
fi

rm -f temp
clear
echo "ShellView exited"
