#!/bin/bash

# Procesul Handler afișează un număr natural în fiecare secundă
trap 'echo "Primit semnal SIGTERM. Finalizare activitate."; exit 0' SIGTERM

counter=1
echo "$$"
while true; do
  echo "Număr natural: $counter"
  sleep 1
  ((counter++))
done
