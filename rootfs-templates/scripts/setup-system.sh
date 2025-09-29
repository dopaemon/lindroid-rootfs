#!/bin/sh
# Setup hostname
echo $1 > /etc/hostname
echo "127.0.0.1 $1" >> /etc/hosts

# Generate locales (only en_US.UTF-8 for now)
sed -i -e '/en_US\.UTF-8/s/^# //g' /etc/locale.gen
locale-gen
update-locale LANG=en_US.UTF8

# Fix resolv conf
rm /etc/resolv.conf
echo "nameserver 1.1.1.1" > /etc/resolv.conf

# Sddm needs to be in input group
adduser sddm input
adduser sddm android_input
adduser sddm video

# Add root and _apt to inet
adduser root inet
usermod -g inet _apt

# Make lindroid dir for audio socket bund-mount
mkdir /lindroid
