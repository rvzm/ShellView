\#!/bin/sh
grep "\[ssh\] Ban" /var/log/fail2ban.log >> /tmp/shellview.txt
dialog --backtitle "ShellView" \
       --title "fail2ban log viewer: Bans" \
       --tailbox /tmp/shellview.txt 20 115

rm /tmp/shellview.txt
