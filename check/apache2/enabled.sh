#!/bin/bash
apache2ctl -S | grep "enabled" > /tmp/shellview.txt
dialog --backtitle "ShellView" \
	--title "Apache2: Sites enabled" \
	--tailbox /tmp/shellview.txt 20 100

rm /tmp/shellview.txt
