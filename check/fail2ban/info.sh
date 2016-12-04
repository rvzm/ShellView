\#!/bin/sh
grep INFO /var/log/fail2ban.log >> /tmp/shellview.txt
dialog --backtitle "ShellView" \
       --title "fail2ban log viewer: INFO level" \
       --tailbox /tmp/shellview.txt 20 115
