#!/bin/sh
dialog --backtitle "ShellView" \
       --title "Apache2 Access Log" \
       --tailbox /var/log/apache2/access.log 20 115
