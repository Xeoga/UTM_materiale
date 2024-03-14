#/bin/bash
man bash | tr -s ' ' '\n' | grep -E '\b\w{4,}\b' | sort | uniq -c | sort -nr | head -n 3

