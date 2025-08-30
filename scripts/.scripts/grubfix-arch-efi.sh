#!/usr/bin/env bash

#Fix the grub boot on arch linux.
#Use it after you chrooted into the main system from live iso
cd /

if [[ $# -eq 0 ]]
then
    read -p "Enter your efi-directory: " efipath
else
    efipath=$1
fi

sleep 1

grub-install --target=x86_64-efi --efi-directory=$efipath --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

echo "Done."


