#!/usr/bin/fish

set input_file "output_file.txt"
set output_file "output_file_modified.txt"

# Sortarea fișierului după PPID
sort -t= -k4,4n -k8,8n $input_file > $output_file

# Iterarea prin fișier și adăugarea liniei Sum_switches_of_ParentID
set current_parent_id ""
set sum_switches 0

while read -r line
    set ppid (string match -r 'Parent_ProcessID=(\d+)' << "$line" | string match -o '(\d+)')
    set switches (string match -r 'voluntary_ctxt_switches:\s+(\d+)' $line | string match -o '(\d+)')

    if test "$ppid" = "$current_parent_id"
        set sum_switches (math "$sum_switches" + "$switches")
    else
        echo "Sum_switches_of_ParentID=$current_parent_id is $sum_switches" >> $output_file
        set current_parent_id "$ppid"
        set sum_switches "$switches"
    end
end < $output_file

# Adăugarea ultimei linii pentru ultimul grup
echo "Sum_switches_of_ParentID=$current_parent_id is $sum_switches" >> $output_file

# Afișarea conținutului fișierului modificat
cat $output_file

