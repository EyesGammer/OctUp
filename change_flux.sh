#!/bin/bash

# Usage: change_flux.sh NEW_FLUX

rm flux
echo $1 > flux
./stop_radio.sh
./start_radio.sh
