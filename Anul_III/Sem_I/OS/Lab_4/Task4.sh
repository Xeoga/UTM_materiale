#/bin/bash
find /bin/ -type f -exec file {} \;|grep "script"|awk -F ':' '{print $1}'|awk -F '/' '{print $3}'
