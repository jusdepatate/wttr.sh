#!/usr/bin/env bash
#
# wttr.sh uses wttr.in's api
# Jus de Patate (yaume@ntymail.com) - CC-BY-NC
# Version 1.2

if [ -n "$1" ]; then
    # get city from first argument
    if [ "$(ping -c 1 wttr.in)" ]; then
        if [ "$(which curl 2>/dev/null)" ]; then
            CITY="$(curl -s ipinfo.io/city)"
            echo "Weather of $1"
            curl -s "wttr.in/$1?Q0"
        elif [ "$(which wget 2>/dev/null)" ]; then
            CITY="$(wget -qO- ipinfo.io/city)"
            echo "Weather of $1"
            wget -qO- "wttr.in/$1?Q0"
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
            CITY="$(curl -s ipinfo.io/city)"
            echo "Weather of $CITY"
            curl -s "wttr.in/$CITY?Q0"
        elif [ "$(which wget 2>/dev/null)" ]; then
            CITY="$(wget -qO- ipinfo.io/city)"
            echo "Weather of $CITY"
            wget -qO- "wttr.in/$CITY?Q0"
        fi
        echo
    else
        echo "Can't connect to wttr.in"
        exit 1
        # stop the program (with an error)
    fi
fi

# vim: ft=sh ts=4 sw=4 sts=4
