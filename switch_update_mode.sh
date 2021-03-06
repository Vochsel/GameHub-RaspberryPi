#!/bin/bash

read -p "This will reboot the Pi, are you sure? [y]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

    # Startup
    sudo cp ./default_conf/profile /etc/profile

    # DHCPD

    sudo cp ./default_conf/dhcpcd.conf /etc/dhcpcd.conf

    # Network Interfaces
    sudo cp ./default_conf/interfaces /etc/network/interfaces
    # restart dhcpd service
    #sudo service dhcpcd restart

    # restart dhcpd service
    sudo service dhcpcd restart

    # reload wlan0 configuration
    sudo ifdown wlan0; sudo ifup wlan0

    # HOSTAPD

    sudo rm -r /etc/hostapd/hostapd.conf

    sudo cp ./default_conf/hostapd /etc/default/hostapd

    # stop hostapd
    sudo service hostapd stop

    # DNSMASQ

    sudo cp ./default_conf/dnsmasq.conf /etc/dnsmasq.conf

    sudo cp ./default_conf/sysctl.conf /etc/sysctl.conf

    sudo service dnsmasq stop

    sudo service dhcpcd stop
    sudo service dhcpcd start

    sudo reboot

fi
