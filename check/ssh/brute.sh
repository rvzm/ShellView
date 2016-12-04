#!/bin/sh
grep sshd.\*Failed /var/log/auth.log >> /tmp/shellview.txt
dialog --backtitle "ShellView" \
       --title "SSH Brute-force log" \
       --tailbox /tmp/shellview.txt 20 115

rm /tmp/shellview.txt
