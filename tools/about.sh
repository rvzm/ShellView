#!/bin/bash
dialog --backtitle "ShellView" \
	--title "ShellView - About" \
	--msgbox "Welcome to ShellView, a sysadmin utility for Debian\nShellView is currently only maintained and scripted by rvzm\nShellView can be seen on GitHub @ https://github.com/rvzm/ShellView" 20 100

~/shellview/shellview.sh
