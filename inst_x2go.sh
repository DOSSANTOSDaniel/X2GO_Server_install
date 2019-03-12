#!/bin/bash
#Script permettant l'installation de X2GO serveur et de l'environnement de bureau XFCE ainsi que le navigateur Iceweasel.
#"HALHOUL Billel" halhoul.billel.pro@gmail.com
#"DOS SANTOS Daniel" daniel.massy91@gmail.com
#Source: https://wiki.x2go.org/doku.php/doc:installation:x2goserver
clear
echo -e "\n Début de l'installation \n"
apt-get install dirmngr -y
apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E
clear
echo ''
echo "Quelle est votre version de Debian ?"	
echo '------------------------------------'
echo '[1] Debien stretch 9'
echo '[2] Debien jessie 8'
echo ''
read -p " votre choix : " ch

# -z si le champ est vide
if [ -z "$ch" ] || [[ "$ch" != [1-2] ]]
	then
		error "Argument non pris en charge !" "seules arguments autorisés de [1] à [2] !"
  exit 1
fi

case $ch in
1) echo "deb http://packages.x2go.org/debian stretch extras main" > /etc/apt/sources.list.d/x2go.list
;;
2) echo "deb http://packages.x2go.org/debian/ jessie main contrib" > /etc/apt/sources.list.d/x2go.list
;;
*) error "choix non proposé !"
esac

apt-get update
sleep 1
clear
apt-get install x2go-keyring -y
apt-get update
sleep 1
clear
apt-get install aptitude -y
aptitude install x2goserver x2goserver-xsession -y
apt-get install xfce4 iceweasel -y
sleep 1
clear
service x2goserver status
echo -e "\n Installation terminé, si le service X2GO n'a pas démarré taper 'service x2goserver start' \n"
service --status-all | grep x2goserver
