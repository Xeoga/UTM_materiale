#/bin/bash
find /var/log -type f -name "*.log" -exec cat {} \; 2>/dev/null |wc -l
echo "Numarul de linie este:"
