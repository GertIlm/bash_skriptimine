#!/bin/bash
# ==================================================================
# Skript:     apache_paigaldus.sh
# Autor:      Gert Ilm
# Kuupäev:    27.10.2026
# Aine:       Skriptimisvahendid - BASH haldus, praks2
#             (Teenuste paigaldus - apache)
#
# Kirjeldus:  Skript kontrollib, kas veebiserver apache2 on
#             masinasse paigaldatud.
#               - kui EI OLE paigaldatud, siis paigaldab selle
#               - kui ON paigaldatud, siis annab sellest teada,
#                 käivitab teenuse ja näitab teenuse staatust
#
# Kasutamine: skript tuleb käivitada root kasutajana (või sudo-ga)
#               chmod +x apache_paigaldus.sh
#               ./apache_paigaldus.sh
#             või
#               sh apache_paigaldus.sh
# ==================================================================

# Teenus (pakett), mille olemasolu kontrollime ja vajadusel paigaldame
TEENUS=apache2

# ------------------------------------------------------------------
# 1. Õiguste kontroll
# Paketi paigaldamiseks on vaja root õigusi. Käsk "id -u" annab
# kasutaja ID, root kasutaja ID on alati 0.
# ------------------------------------------------------------------
if [ "$(id -u)" -ne 0 ]; then
    echo "Viga: skripti peab käivitama root kasutaja (või sudo abil)."
    exit 1
fi

# ------------------------------------------------------------------
# 2. Kontrollime, kas teenus on paigaldatud
# dpkg-query -W -f='${Status}' näitab paketi olekut, paigaldatud
# paketi korral on väljund "install ok installed".
# 2>/dev/null peidab veateate "no packages found matching ...",
# kui sellist paketti masinas üldse ei ole.
# grep -c loeb, mitu rida sisaldab teksti "ok installed":
#   1 -> teenus on paigaldatud
#   0 -> teenust ei ole paigaldatud
# Tulemuse salvestame muutujasse APACHE2.
# ------------------------------------------------------------------
APACHE2=$(dpkg-query -W -f='${Status}' $TEENUS 2>/dev/null | grep -c "ok installed")

# Katsetamiseks väljastame muutuja väärtuse (1 = paigaldatud, 0 = ei ole)
echo "Ridu 'ok installed' leitud: $APACHE2"
