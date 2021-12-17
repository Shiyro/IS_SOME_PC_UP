#!/bin/bash

#DECLARATION DES COULEURS
RED='\033[0;41m'    
GREEN='\033[0;42m'
DEFAULT='\033[40m'
BLINK='\e[5;40m'
UNBLINK='\e[m'

echo "${BLINK}ACQUISITION DES PCs ALLUMÉES${UNBLINK}"

test_ping_pc()
{
  ping -c 1 $1 > /dev/null
  [ $? -eq 0 ] && echo "Le PC $v de la salle $i est allumé."
}

for i in {14..15}
do
	for v in {1..255} 
	do
	test_ping_pc "172.16.$i.$v" & disown
	done
done
