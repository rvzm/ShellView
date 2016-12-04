\#!/bin/sh
grep fail2ban.* /var/log/fail2ban.log >> /tmp/shellview.txt
dialog --backtitle "ShellView" \
       --title "fail2ban log viewer" \
       --tailbox /tmp/shellview.txt 20 115
