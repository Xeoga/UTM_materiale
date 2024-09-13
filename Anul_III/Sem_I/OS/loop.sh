#!/bin/bash
usr1(){
	echo "Am esit din loop=)"
}
echo $$>.pid
trap 'usr1' USR1
while :; do
	sleep 1
done
