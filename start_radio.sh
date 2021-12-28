#!/bin/bash

# Usage: ./start_radio.sh

./omxplayer.sh --no-keys -o alsa $(cat flux) > /dev/null 2>&1 &
./set_volume.sh 60
sleep 5
echo $(ps -aux | awk '/[o]mxplayer.bin/{print $2}') > omxplayer_pid
