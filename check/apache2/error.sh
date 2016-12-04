#!/bin/sh
dialog --backtitle "ShellView" \
       --title "Apache2 Error Log" \
       --tailbox /var/log/apache2/error.log 20 115
