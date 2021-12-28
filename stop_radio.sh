#!/bin/bash

# Usage: ./stop_radio.sh

PID=$(cat omxplayer_pid)
sudo kill $PID > /dev/null 2>&1
