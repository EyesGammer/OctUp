#!/bin/bash

# Usage: ./get_pid_status.sh

connected() {
	# Return: 0 = connected, 1 = not connected
	val=0
	echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1
	if [ ! $? -eq 0 ]; then
		val=1
		echo "no_connection" > internet_state
		./stop_radio.sh > /dev/null 2>&1
	else
		echo "connected" > internet_state
	fi
	echo $val
}

PID=$(cat omxplayer_pid)
if [ -f "/proc/$PID/stat" ]; then
	returnVal=$(connected)
	if [ $returnVal -eq 1 ]; then
		echo "Not connected, starting USB music"
	fi
else
	returnVal=$(connected)
	if [ $returnVal -eq 0 ]; then
		./start_radio.sh $(cat flux)
	else
		echo "Not connected, starting USB music"
		aplay test.mp3
	fi
fi
