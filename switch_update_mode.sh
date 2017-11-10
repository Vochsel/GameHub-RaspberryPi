#!/bin/bash

# DHCPD

sudo cp ./default_conf/dhcpcd.conf /etc/dhcpcd.conf

# Network Interfaces
sudo cp ./default_conf/interfaces /etc/network/interfaces

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
