#!/bin/bash

. ./config.sh

cd "$(dirname "$0")"

echo "Using $DEVICE"

scan () {
	while read DATA; do
		DATE=$(date +"%Y-%m-%d")
		TIME=$(date +"%H:%M:%S")
		echo -e "$DATE $TIME $DATA"
		
		if [ ! -z "$DATA" ]; then
			aplay res/snd.wav 2>/dev/null
			echo "$TIME:$DATA" >> "db"/"$DATE".txt
		else
			echo "Empty result."
		fi
	done
}

zbarcam -Senable -Supce.disable -Supca.disable -Sean13.disable "$DEVICE" | scan

