#!/bin/sh

#Fix the grub boot on arch linux.
#Use it after you chrooted into the main system from live iso
cd /
echo -n "Enter your efi-directory:"
read efipath
sleep 1

grub-install --target=x86_64-efi --efi-directory=$efipath --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

echo "Done."
