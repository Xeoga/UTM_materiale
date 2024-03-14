#!/bin/bash
ultimul_proces=$(ps -eo pid,lstart --sort=start_time | tail -n 1)
echo "PID-ul ultimului proces: $(echo $ultimul_proces | awk '{print $1}')"
echo "Timpul de lansare: $(echo $ultimul_proces | awk '{$1=""; print $0}')"
