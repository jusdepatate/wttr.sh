#!/usr/bin/env bash
#
# wttr.sh uses wttr.in's+ipinfo.io's api
# Jus de Patate (yaume@ntymail.com) - BSD-2
# Version 1.3

args="$(echo "$*" | tr " " +)"
wa="Q0"
# Arguments for wttr.in
# http://wttr.in/:help

if [ "$(which curl 2>/dev/null)" ]; then
    if [ "$(ping -c 1 ipinfo.io)" ]; then
       CITY=$(curl -s ipinfo.io/city)
       REGION=$(curl -s ipinfo.io/region)
    else
       echo "Cannot connect to ipinfo.io"
       exit 1
    fi
elif [ "$(which wget 2>/dev/null)" ]; then
    if [ "$(ping -c 1 wttr.in)" ]; then
       CITY=$(wget -qO- ipinfo.io/city)
       REGION=$(wget -qO- ipinfo.io/region)
    else
       echo "can't connect to ipinfo.io"
    fi
else
    echo "Install cURL or wget please"
    exit 1
fi

if [ "$CITY" = "" ]; then
# some times ipinfo.io gives no city
   CITY=$REGION
fi

if [ -n "$args" ]; then
    # get city from first argument
    if [ "$(ping -c 1 wttr.in)" ]; then
        if [ "$(which curl 2>/dev/null)" ]; then
            echo "Weather of $*"
			# blank line
			echo " "
            curl -s "wttr.in/$args?$wa"
        elif [ "$(which wget 2>/dev/null)" ]; then
            echo "Weather of $*"
			      # blank line
	      		echo " "
            wget -qO- "wttr.in/$args?$wa"
        fi
        echo
    else
        echo "Can't connect to wttr.in"
        exit 1
        # stop the program (with an error)
    fi
else
    # no city set in first argument
    if [ "$(ping -c 1 wttr.in)" ]; then
        if [ "$(which curl 2>/dev/null)" ]; then
            echo "Weather of $CITY"
			# blank line
			echo " "
            curl -s "wttr.in/$args?wa"
        elif [ "$(which wget 2>/dev/null)" ]; then
            echo "Weather of $CITY"
			# blank line (try without)
			echo " "
            wget -qO- "wttr.in/$args?wa"
        fi
        echo
    else
        echo "Can't connect to wttr.in"
        exit 1
        # stop the program (with an error)
    fi
fi

# vim: ft=sh ts=4 sw=4 sts=4
