#!/bin/sh
dialog --backtitle "ShellView" \
	--title "ShellView - Apache2" \
	--menu "Please select a view" 20 100 3 \
	error "Apache2: Error log" \
	access "Apache2: Access log" \
	enabled "Apache2: Enabled sites" \
	2>temp
if [ "$?" = "0" ]
then
	_return=$(cat temp)
	rm -f temp
	if [ "$_return" = "error" ]
	then
		~/shellview/check/apache2/error.sh
	fi
	if [ "$_return" = "access" ]
	then
		~/shellview/check/apache2/access.sh
	fi
	if [ "$_return" = "enabled" ]
	then
		~/shellview/check/apache2/enabled.sh
	fi
else
	~/shellview/shellview.sh
fi
