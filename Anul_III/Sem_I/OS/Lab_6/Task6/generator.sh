#!/bin/bash

# Procesul Generator citeste liniile de la consolă
while true; do
  read line
  if [[ "$line" == "TERM" ]]; then
    echo "Trimitere semnal SIGTERM către procesul Handler..."
    # Trimite semnal SIGTERM procesului Handler
    pkill -SIGTERM handler.sh
    break
  fi
done
