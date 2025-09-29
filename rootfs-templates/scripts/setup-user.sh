#!/bin/sh

USERNAME=$1
[ "$USERNAME" ] || exit 1
PASSWORD=$2
[ "$PASSWORD" ] || exit 1

addgroup --gid 3003 inet
groupadd --gid 1004 android_input

adduser --gecos $USERNAME --disabled-password --shell /bin/bash $USERNAME
adduser $USERNAME sudo

# Needed for hardware access rights
adduser $USERNAME video
adduser $USERNAME render
adduser $USERNAME audio
adduser $USERNAME bluetooth
adduser $USERNAME plugdev
adduser $USERNAME input
adduser $USERNAME dialout
adduser $USERNAME inet
adduser $USERNAME android_input

echo "$USERNAME:$PASSWORD" | chpasswd

# Make sure to create user directories
#DEBIAN_FRONTEND=noninteractive apt-get install xdg-user-dirs

#sudo -u lindroid xdg-user-dirs-update
