#!/bin/fish
grep -r 'ACPI' /var/log/ 2>/dev/null|awk -F ':' '{print $3,$4}' > errors.log
grep -r 'ACPI' /var/log/ 2>/dev/null|awk -F ':' '{print $1}'
