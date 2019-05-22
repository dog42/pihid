#!/bin/bash

# Test if is Root
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

# Install tools
apt-get install dnsmasq adb

# Enable dwc2 on the Pi
echo "dtoverlay=dwc2" >> /boot/config.txt

# Enable dwc2 initialisation
echo "dwc2" >> /etc/modules

# Install service
cp hid.service /lib/systemd/system/
cp eth.service /lib/systemd/system/

# Install startscript
cp hid /usr/bin/
chmod +x /usr/bin/hid
cp eth /usr/bin/
chmod +x /usr/bin/eth

# Enable/Disable service
systemctl enable hid.service
systemctl disable eth.service

# Compile scansend
gcc -Wall -Werror scansend.c -o scansend

# Install script
cp scansend /usr/bin/
chmod +x /usr/bin/scansend

# Config ETH
p1="/etc/dhcpcd.conf"
p2="/etc/dnsmasq.conf"
[ -f $p1 ] && cp $p1 $p1.old
[ -f $p2 ] && cp $p2 $p2.old
echo "interface usb0" >> $p1
echo "static ip_address=192.168.66.1/24" >> $p1
echo "interface=usb0" >> $p2
echo "dhcp-range=192.168.66.66,192.168.66.66,255.255.255.0,12h" >> $p2

# Reboot
read -p "Reboot necessary. Perform now?" -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]] ; then /sbin/reboot ; fi