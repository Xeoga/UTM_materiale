nice -n 10 cpulimit -l 20 bash -c 'while true; do echo "Calculare proces 1"; done' &
bash -c 'while true; do echo "Calculare proces 2"; done' &
