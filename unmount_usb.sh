#!/bin/bash

# Usage: ./unmount_usb.sh

if [ -f mounted ]; then
	while IFS= read -r line
	do
		sudo umount -t auto /dev/$line > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "[$line] USB Unmounted successfully"
			sudo rm -rf /media/usb_$line
		fi
	done < "mounted"
	sudo rm mounted
fi
