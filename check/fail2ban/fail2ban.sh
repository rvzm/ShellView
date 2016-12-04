#!/bin/bash
dialog --backtitle "ShellView" \
	--title "Fail2ban Viewer" \
	--menu "Select view" 20 100 5 \
	warn "Log: Warnings" \
	info "Log: Info" \
	all "Log: Full" \
	ban "Log: Bans" \
	unban "Log: Unbans" \
	2>temp

if [ "$?" = "0" ]
then
	_return=$(cat temp)
	if [ "$_return" = "warn" ]
	then
		~/shellview/check/fail2ban/warn.sh
	fi
	if [ "$_return" = "info" ]
	then
		~/shellview/check/fail2ban/info.sh
	fi
	if [ "$_return" = "all" ]
	then
		~/shellview/check/fail2ban/all.sh
	fi
	if [ "$_return" = "ban" ]
	then
		~/shellview/check/fail2ban/ban.sh
	fi
	if [ "$_return" = "unban" ]
	then
		~/shellview/check/fail2ban/unban.sh
	fi
fi
