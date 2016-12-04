\#!/bin/sh
grep WARNING /var/log/fail2ban.log >> /tmp/shellview.txt
dialog --backtitle "ShellView" \
       --title "fail2ban log viewer: WARN level" \
       --tailbox /tmp/shellview.txt 20 115
