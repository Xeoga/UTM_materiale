#/bin/bash
SEARCHPATH=/var/log/Xorg.0.log
grep -E "\(II\)" $SEARCHPATH|sed 's/\(II\)/Information:/' > full.log
grep -E "\(WW\)" $SEARCHPATH|sed 's/\(WW\)/Warning:/' >> full.log
head full.log

