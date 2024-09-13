#!/bin/bash
# Iterăm prin toate procesoarele înregistrate în sistem
for pid in $(ps -eo pid --no-header); do
    # Obținem PPID
    ppid=$(grep -E '^PPid:' /proc/$pid/status | awk '{print $2}')
    # Obținem nr_switches și se.sum_exec_runtime
    nr_switches=$(grep -E '^nr_switches:' /proc/$pid/sched | awk '{print $3}')
    se_sum_exec_runtime=$(grep -E '^se.sum_exec_runtime:' /proc/$pid/sched | awk '{print $3}')
    # Calculăm avg_atom
    avg_atom=$(awk "BEGIN {printf \"%.2f\", $se_sum_exec_runtime / $nr_switches}")
    # Salvăm rezultatele în fișier
    echo "ProcessID=$pid:Parent_ProcessID=$ppid:Average_Time=$avg_atom" >> process_info.txt
done

