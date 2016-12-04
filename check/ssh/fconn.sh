#!/bin/sh
grep sshd.\*Did /var/log/auth.log >> /tmp/shellview.txt
dialog --backtitle "ShellView" \
       --title "SSH Failed Connection log" \
       --tailbox /tmp/shellview.txt 20 115
