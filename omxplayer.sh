#!/bin/bash

# Usage: ./omxplayer.sh

OMXPLAYER_BIN="/usr/bin/omxplayer.bin"
OMXPLAYER_LIBS="/opt/vc/lib:/usr/lib/omxplayer"

FBSET="/bin/fbset"

if [ -e $FBSET ]; then
    DEPTH2=`fbset | head -3 | tail -1 | cut -d " " -f 10`
    if [ "$DEPTH2" == "8" ]; then
        DEPTH1=16
    elif [ "$DEPTH2" == "16" ]; then
        DEPTH1=8
    elif [ "$DEPTH2" == "32" ]; then
        DEPTH1=8
    else
        DEPTH1=8
        DEPTH2=16
    fi
fi

LD_LIBRARY_PATH=$OMXPLAYER_LIBS:$LD_LIBRARY_PATH $OMXPLAYER_BIN "$@" &

stopped() {
	./get_pid_status.sh
}

trap stopped 0

wait

if [ -e $FBSET ]; then
    fbset -depth $DEPTH1 && fbset -depth $DEPTH2
fi
