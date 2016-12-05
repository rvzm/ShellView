#!/bin/sh
grep sshd.\*PAM /var/log/auth.log >> /tmp/shellview.txt
dialog --backtitle "ShellView" \
       --title "SSH PAM log" \
       --tailbox /tmp/shellview.txt 20 115

rm /tmp/shellview.txt
