#!/bin/bash
ps_pid=$(ps -eo pid,cmd | grep "^ *[0-9] /sbin/")
echo $ps_pid
echo $ps_pid | awk '{print $1}' > pid_proces_sbin
cat pid_proces_sbin
