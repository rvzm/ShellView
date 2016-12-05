#!/bin/sh
grep sshd.\*session /var/log/auth.log >> /tmp/shellview.txt
dialog --backtitle "ShellView" \
       --title "SSH Session log" \
       --tailbox /tmp/shellview.txt 20 115

rm /tmp/shellview.txt
