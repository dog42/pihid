#!/bin/bash

# Test if is Root
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

# Enable dwc2 on the Pi
echo "dtoverlay=dwc2" | sudo tee -a /boot/config.txt

# Enable dwc2 initialisation
echo "dwc2" | sudo tee -a /etc/modules

# Install service
cp hid.service /lib/systemd/system/

# Install startscript
cp hid /usr/bin/
chmod +x /usr/bin/hid

# Enable service
systemctl enable hid.service

# Compile scansend
gcc -Wall -Werror scansend.c -o scansend

# Install script
cp scansend /usr/bin/
chmod +x /usr/bin/scansend

# Reboot
read -p "Reboot necessary. Perform now?" -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]] ; then /sbin/reboot ; fi