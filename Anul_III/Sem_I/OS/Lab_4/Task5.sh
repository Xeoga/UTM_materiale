#/bin/bash
awk -F ':' '{print $1, $3}' /etc/passwd | sort -t ' ' -k2n