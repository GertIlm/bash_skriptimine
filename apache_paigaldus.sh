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

echo "Kontrollime, kas $TEENUS on paigaldatud..."
