#DECLARATION DES COULEURS
RED='\033[0;41m'    
GREEN='\033[0;42m'
DEFAULT='\033[40m'
BLINK='\e[5;40m'
UNBLINK='\e[m'

#CHAINE CONTENANT LES PCs ALLUMÉES
#PC="${GREEN}"

#CAS D'USAGE
[ $# -eq 0 ] && { echo "IS SOME PC UP ?" ; echo "Usage: ispcup numero de la salle"; exit 1; }

echo "${BLINK}ACQUISITION DES PCs ALLUMÉES${UNBLINK}"
#BOUCLE 1 à 15
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
do
#PING SUR L'ADRESSE DE LA SALLE SUR LE POSTE i
  ping -qc 1 172.16.$1.$i > /dev/null
#ES-CE-QUE LA COMMANDE MARCHE
  if [ $? -eq 0 ]; then
     #PC+=" $i"
     echo ${GREEN}Le PC $i de la salle $1 est allumé${DEFAULT}
  #else
     #echo -e ${RED}Le PC $i de la salle $1 est éteint${DEFAULT}
  fi
done
#PC+=" ${DEFAULT}"
#echo -e "${GREEN}LES PC ALLUMÉES DE LA SALLE $1 SONT LES PC NUMERO${DEFAULT}$PC"

