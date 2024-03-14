#/bin/bash
grep -rEo '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b' /etc 2>/dev/null|awk -F ':' '{print $2}'|sed ':a;N;$!ba;s/\n/, /g' > emails.lst

