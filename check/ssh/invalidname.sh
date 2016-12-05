#!/bin/sh
grep sshd.\*Invalid /var/log/auth.log >> /tmp/shellview.txt
dialog --backtitle "ShellView" \
       --title "SSH Invalid login attempt log" \
       --tailbox /tmp/shellview.txt 20 115

rm /tmp/shellview.txt
