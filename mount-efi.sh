#!/bin/bash

diskutil list | grep -n1 "EFI"

while true; do
    read -p "Choose a number between 0 and 4? " nr
    echo "Will mount disk: disk${nr}s1..."
    read -p "Press Q to quit, Y to continue or N to select a different drive: " yn
    case $yn in
        [yY]* ) 
		echo  "mounting disk${nr}s1..."
		sudo mkdir /Volumes/efi
		sudo mount -t msdos /dev/disk${nr}s1 /Volumes/efi
		break;;
        [qQ]* ) 
		echo "Quiting, bye..."
		break;;
        * ) echo "Try again...";;
    esac
done
