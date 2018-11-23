#!/usr/bin/env bash
# wttr.sh uses wttr.in's api
# Jus de Patate (yaume@ntymail.com) - CC-BY-NC
# Version 1.0

if [ "$(ping -c 1 wttr.in)" ]; then
  if [ "$(which curl 2>/dev/null)" ]; then
    CITY="$(curl -s ipinfo.io/city)"
		echo "Weather of $CITY"
		curl -s "wttr.in/$CITY?Q0"
	elif [ "$(which wget 2>/dev/null)" ]; then
		CITY="$(wget -qO- ipinfo.io)"
		echo "Weather of $CITY"
		wget -qO- "wttr.in/$CITY?Q0"
	fi
echo
else
	echo "Can't connect to wttr.in"
fi
