#!/bin/bash

# Usage: set_volume.sh VOLUME

sudo amixer set PCM -- "$1%" > /dev/null 2>&1
