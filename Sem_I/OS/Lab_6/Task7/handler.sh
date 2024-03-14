#!/bin/bash

# Inițializarea valorii curente
current_value=1

# Funcția care rulează la primirea semnalului USR1
handle_usr1() {
  echo "Semnal USR1 primit. Adunare cu 2."
  current_value=$((current_value + 2))
}

# Funcția care rulează la primirea semnalului USR2
handle_usr2() {
  echo "Semnal USR2 primit. Înmulțire cu 2."
  current_value=$((current_value * 2))
}

# Funcția care rulează la primirea semnalului SIGTERM
handle_sigterm() {
  echo "Primit semnal SIGTERM. Finalizare activitate."
  exit 0
}

# Setarea funcțiilor pentru gestionarea semnalelor
trap 'handle_usr1' USR1
trap 'handle_usr2' USR2
trap 'handle_sigterm' SIGTERM

# Buclă infinită pentru afișarea valorii curente la fiecare secundă
while true; do
  echo "Valoarea curentă: $current_value"
  sleep 1
done
