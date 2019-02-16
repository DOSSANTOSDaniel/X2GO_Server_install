#!/bin/bash 
#Auteurs:
#"HALHOUL Billel" halhoul.billel.pro@gmail.com
#"DOS SANTOS Daniel" daniel.massy91@gmail.com

echo  "Installation en cours"
apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E
echo "deb http://packages.x2go.org/debian jessie main" >> /etc/apt/sources.list.d/x2go.list
apt-get update -y
apt-get install x2goserver x2goserver-xsession -y
apt-get install xfce4 iceweasel -y
echo -e "\n Installation terminé, si le service X2GO n'a pas démarré taper service x2goserver start \n "
echo -e " Tests pour vérifier le service X2GO \n"
ps aux | grep x2go

