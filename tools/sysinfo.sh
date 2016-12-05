#!/bin/bash
inxi -I -C -c 0 > /tmp/shellview.txt
dialog --backtitle "ShellView" \
	--title "System: Disk usage" \
	--tailbox /tmp/shellview.txt 20 100

rm /tmp/shellview.txt
