#!/bin/bash

while true; do
  read line

  case "$line" in
    "+")
      echo "Trimitere semnal USR1 către procesul Handler..."
      pkill -USR1 handler.sh
      ;;
    "*")
      echo "Trimitere semnal USR2 către procesul Handler..."
      pkill -USR2 handler.sh
      ;;
    "TERM")
      echo "Trimitere semnal SIGTERM către procesul Handler..."
      pkill -SIGTERM handler.sh
      ;;
    *)
      # Ignoră alte valori
      ;;
  esac

done
