#!/bin/bash

read -p "This will reboot the Pi, are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # do dangerous stuff


    # DHCPD

    sudo cp ./host_conf/dhcpcd.conf /etc/dhcpcd.conf

    # Network Interfaces
    sudo cp ./host_conf/interfaces /etc/network/interfaces

    # restart dhcpd service
    sudo service dhcpcd restart

    # reload wlan0 configuration
    sudo ifdown wlan0; sudo ifup wlan0

    # HOSTAPD

    sudo cp ./host_conf/hostapd.conf /etc/hostapd/hostapd.conf

    sudo cp ./host_conf/hostapd /etc/default/hostapd

    # stop hostapd
    #sleep 3s
    #sudo service hostapd stop
    #sleep 3s
    #sudo service hostapd start

    # DNSMASQ

    sudo cp ./host_conf/dnsmasq.conf /etc/dnsmasq.conf

    sudo cp ./host_conf/sysctl.conf /etc/sysctl.conf

    # enable portfwd now
    sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"

    sudo service dnsmasq start

    # Share internet if available

    sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
    sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT

    sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT

    sudo iptables -t nat -A PREROUTING -i wlan0 -p tcp --dport 80 -j REDIRECT --to-port 3000

    sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"


    sudo service hostapd stop
    #sleep 3s
    sudo service hostapd start

    sudo reboot
fi