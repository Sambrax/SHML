#!/bin/bash
clear
echo ''
echo 'Which web server do you want to configure SHML for?'
echo ''
echo '1 - Apache2'
echo '2 - Nginx'
echo ''
read -p 'Enter the number 1 or 2: ' op
echo ''
conf() {
    echo ''
    sleep 3
    clear
    if [ -d "/etc/$server/sites-available/" ]
    then
        cd /tmp
        wget https://github.com/Renexo-git/SHML/archive/refs/heads/master.zip
        unzip master.zip
        mkdir /usr/share/shml
        cp /tmp/SHML-master/usr/share/shml/library.sh /usr/share/shml/
        cp /tmp/SHML-master/usr/share/shml/parser.awk /usr/share/shml/
        cp /tmp/SHML-master/usr/share/shml/render.sh /usr/share/shml/
        chmod +x /usr/share/shml/library.sh
        chmod +x /usr/share/shml/render.sh
        cp /tmp/SHML-master/etc/$server/sites-available/shml.conf /etc/$server/sites-available/
        ln -s /etc/$server/sites-available/shml.conf /etc/$server/sites-enabled/
        rm -rf /tmp/SHML-master
        rm /tmp/master.zip
        read -p 'Enter the server port number - [ Default => 8080 ]: ' port
        echo ''
        if [ $port -ne 8080 ]
        then
            sed "s/8080/$port/" /etc/$server/sites-available/shml.conf > /etc/$server/sites-available/_shml.conf
            mv /etc/$server/sites-available/_shml.conf /etc/$server/sites-available/shml.conf
        fi
        read -p 'Enter the path of the public folder of the server - [ Default => /var/www/public ]: ' root
        echo ''
        if [ $root != '/var/www/public' ]
        then
            sed -i "/root/c \   \ root ${root};" /etc/$server/sites-available/shml.conf
        fi
        /etc/init.d/$server restart
    else
        echo "The $server configuration directory was not found!"
    fi
}
if [ $op -eq 1 ]
then
    server='apache2'
    echo '1 - Apache2'
    conf
else
    if [ $op -eq 2 ]
    then
        server='nginx'
        echo '2 - Nginx'
        conf
    fi
fi