#!/bin/bash

# Specificați calea către directorul /proc
proc_dir="/proc"

# Iterăm prin toate directoarele din /proc care reprezintă procese
for pid_dir in $proc_dir/[0-9]*/; do
    pid=$(basename "$pid_dir")

    # Verificăm dacă fișierul status există pentru procesul curent
    status_file="$pid_dir/status"
    if [ -f "$status_file" ]; then
        # Extragem informațiile necesare din fișierul status
        ppid=$(awk '/PPid/ {print $2}' "$status_file")
        sum_exec_runtime=$(awk '/se.sum_exec_runtime/ {print $2}' "$status_file")
        nr_switches=$(awk '/nr_switches/ {print $2}' "$status_file")

        # Calculăm avg_atom
        if [ "$nr_switches" -ne 0 ]; then
            avg_atom=$((sum_exec_runtime / nr_switches))
        else
            avg_atom=0
        fi

        # Adăugăm informațiile într-un fișier
        echo "ProcessID=$pid:Parent_ProcessID=$ppid:Average_Time=$avg_atom" >> output_file.txt
    fi
done

