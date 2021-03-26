#!/bin/bash
#Script permettant l'installation de:
# X2GO serveur
# L'environnement de bureau XFCE4
# Le navigateur Iceweasel
# Le terminal xfce4-terminal
#
#"HALHOUL Billel" halhoul.billel.pro@gmail.com
#"DOS SANTOS Daniel" daniel.massy91@gmail.com
#Source: https://wiki.x2go.org/doku.php/doc:installation:x2goserver
clear
echo -e "\n Début de l'installation \n"
apt-get install dirmngr -y
clear
while [ : ]
do
echo ''
echo "Quelle est votre version de Debian ?"	
echo '------------------------------------'
echo '[1] Debien stretch'
echo '[2] Debien jessie'
echo ''
read -p " votre choix : " ch

# -z si le champ est vide
if [ -z "$ch" ] || [[ "$ch" != [1-2] ]]
	then
		echo -e "\n Argument non pris en charge !" "seuls arguments autorisés de [1] à [2] ! \n"
  exit 1
fi

case $ch in
1) echo "deb http://packages.x2go.org/debian stretch extras main" > /etc/apt/sources.list.d/x2go.list
echo "deb-src http://packages.x2go.org/debian stretch extras main" >> /etc/apt/sources.list.d/x2go.list
break
;;
2) echo "deb http://packages.x2go.org/debian/ jessie main contrib" > /etc/apt/sources.list.d/x2go.list
echo "deb-src http://packages.x2go.org/debian jessie main contrib" >> /etc/apt/sources.list.d/x2go.list
break
;;
*) error "choix non proposé !"
esac
done
apt-get update
sleep 1
clear
apt-get install x2go-keyring -y
apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E
apt-get update
sleep 1
clear
apt-get install x2goserver -y
apt-get install x2goserver-xsession -y
apt-get install xfce4 -y
apt-get install iceweasel -y
apt install xfce4-terminal -y
sleep 1
clear
echo -e "\n Installation terminée, si le service X2GO n'a pas démarré taper 'service x2goserver start' \n"
service --status-all | grep x2goserver
