#!/bin/bash

# Usage: ./mount_usb.sh

SDA=$(dmesg | grep -B1 "\[sda\] Attached" | tail -2 | grep "sda:" | cut -d':' -f2-)
for element in $SDA
do
	sudo mkdir /media/usb_$element > /dev/null 2>&1
	sudo mount -t auto /dev/$element /media/usb_$element > /dev/null 2>&1 
	if [ $? -eq 0 ]; then
		echo $element >> mounted
		echo "[$element] USB Mounted"
	else
		sudo rm -rf /media/usb_$element > /dev/null 2>&1
	fi
done
