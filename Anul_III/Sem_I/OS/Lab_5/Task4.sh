#!/bin/bash
#Sarcina nu are rost deoarece avem - la res
ps_output=$(ps -eo pid,size,resident --no-header|awk '$2>0'|sort -k2 -n -r)
printf "%s" "$ps_output" > mem_proce
cat mem_proce

