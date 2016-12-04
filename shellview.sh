#!/bin/sh
# ShellView v0.2
has-a2=$(dpkg-query -W --showformat='${status}\n' apache2|grep "install ok installed")
has-f2b=$(dpkg-query -W --showformat='${Status}\n' fail2ban|grep "install ok installed")
dialog --backtitle "ShellView" \
	--title "ShellView 0.2" \
	--menu "Select which log you'd like to view" 20 100 7 \
	bruteforce "SSH: Brute-force attempts" \
	fconn "SSH: Failed connections" \
	fail2ban-warn "Fail2ban: Log WARN" \
        fail2ban-info "Fail2ban: Log INFO" \
        fail2ban-all "Fail2ban: Log ALL" \
	apache2error "Apache2: Error log" \
	apache2access "Apache2: Access log" \
	apache2enabled "Apache2: Enabled sites" \
	sysload "System load" \
	2>temp
if [ "$?" = "0" ]
then
        _return=$(cat temp)
	if [ "$_return" = "fconn" ]
	then
		~/shellview/check/ssh/fconn.sh
	fi
	if [ "$_return" = "bruteforce" ]
	then
		~/shellview/check/ssh/brute.sh
	fi
	if [ "$has-f2b" != "" ]
	then
		if [ "$_return" = "fail2ban-warn" ]
		then
			~/shellview/check/fail2ban/warn.sh
		fi
		if [ "$_return" = "fail2ban-info" ]
		then
			~/shellview/check/fail2ban/info.sh
		fi
		if [ "$_return" = "fail2ban-all" ]
		then
			~/shellview/check/fail2ban/all.sh
		fi
	else
		dialog --backtitle "ShellView" \
			--title "Error" \
			--msgbox "fail2ban isnt installed" 15 150
	fi
	if [ "$has-a2" != "" ]; then
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
else
	echo "Error: canceled."
fi

rm -f temp
clear
