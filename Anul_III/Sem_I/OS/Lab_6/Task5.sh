#!/bin/bash
mode="adunare"
calculate=1
if [ ! -e .generator_file ]; then
    echo "Fișierul ascuns .generator_file nu există. Porniți Generatorul."
    exit 1
fi
while read -r line || [[ -n "$line" ]]; do
    case $line in
        "+")
            mode="adunare"
            ;;
        "*")
            mode="inmultire"
            ;;
        [0-9]*)
            if [ "$mode" == "adunare" ]; then
		var=$calculate
                calculate=$((calculate + line))
		echo "$var + $line = $calculate"
            elif [ "$mode" == "inmultire" ]; then
		var=$calculate
                calculate=$((calculate * line))
		echo "$var * $line = $calculate"
            fi
            ;;
        "QUIT")
            echo "Finalizare..."
            exit 0
            ;;
        *)
            echo "Eroare: Date de intrare eronate - \"$line\""
            exit 1
            ;;
    esac
done < .generator_file
echo "Rezultatul calculat este $calculate"
