#!/usr/bin/env bash
#########################################
# URL ENCODE! ("+" instead of space!!!) #
#########################################

SERVICE="http://192.168.99.100:32380"
TEXT="hack+your+career"
if [ -n "$1" ]; then
    TEXT="$1"
fi

#curl "http://192.168.99.100:32254/maze?text=hack%20your%20career" | jq '.tokenUrl' | xargs curl | jq '.imageUrl'
curl "${SERVICE}/maze?text=${TEXT}" | jq '.tokenUrl' | xargs curl | jq '.imageUrl' | sed 's/"//g'
