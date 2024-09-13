#!/bin/fish

set proc_dir "/proc"

# Iterăm prin toate directoarele din /proc care reprezintă procese
for pid_dir in $proc_dir/[0-9]*
    set pid (basename "$pid_dir")

    # Verificăm dacă fișierul status există pentru procesul curent
    set status_file "$pid_dir/status"
    if test -f "$status_file"
        # Extragem informațiile necesare din fișierul status
        set ppid (awk '/PPid/ {print $2}' "$status_file")
        set sum_exec_runtime (awk '/se.sum_exec_runtime/ {print $2}' "$status_file")
        set nr_switches (awk '/nr_switches/ {print $2}' "$status_file")

        # Calculăm avg_atom
        if test "$nr_switches" -ne 0
            set avg_atom (math "$sum_exec_runtime" / "$nr_switches")
        else
            set avg_atom 0
        end

        # Adăugăm informațiile într-un fișier
        echo "ProcessID=$pid:Parent_ProcessID=$ppid:Average_Time=$avg_atom" >> output_file.txt
    end
end

