#!/bin/bash
#Script permettant l'installation de X2GO serveur et de l'environnement de bureau XFCE ainsi que le navigateur Iceweasel.
#"HALHOUL Billel" halhoul.billel.pro@gmail.com
#"DOS SANTOS Daniel" daniel.massy91@gmail.com
#Source: https://wiki.x2go.org/doku.php/doc:installation:x2goserver

echo -e "\n Début de l'installation \n"
apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E
echo "deb http://packages.x2go.org/debian jessie main" > /etc/apt/sources.list.d/x2go.list
echo "deb http://archives.packages.x2go.org/debian jessie extras main" >> /etc/apt/sources.list.d/x2go.list
echo "deb-src http://archives.packages.x2go.org/debian jessie extras main" >> /etc/apt/sources.list.d/x2go.list
apt-get update -y
apt-get install x2go-keyring && apt-get update -y
apt-get install x2goserver x2goserver-xsession -y
apt-get install xfce4 iceweasel -y
service x2goserver status
echo -e "\n Installation terminé, si le service X2GO n'a pas démarré taper 'service x2goserver start' \n"
echo -e " Service X2GO server démarré! \n"
service --status-all | grep x2go
