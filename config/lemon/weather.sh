#!/bin/sh

KEY="240d7acddde359a1bed59fa4d00a05ad"
CITY="6548737"
UNITS="metric"
SYMBOL="°"

API="https://api.openweathermap.org/data/2.5"

while true; do
if [ -n "$CITY" ]; then
    if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
        CITY_PARAM="id=$CITY"
    else
        CITY_PARAM="q=$CITY"
    fi

    weather=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS")
else
    location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        weather=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
    fi
fi

if [ -n "$weather" ]; then
    weather_temp=$(echo " $weather" | jq ".main.temp " | cut -d "." -f 1)
    weather_desc=$(echo " $weather" | jq ".weather[0].main ") 
    weather_desc_exact=$(echo " $weather" | jq ".weather[0].description ")
    
    if [ "$weather_desc" == '"Clear"' ]; then
	    weather_icon=""
    elif [ "$weather_desc" == '"Clouds"' ]; then
        weather_icon=""
    elif [ "$weather_desc" == '"Thunderstorm"' ]; then
        weather_icon=""
    elif [ "$weather_desc" == '"Drizzle"' ]; then
        weather_icon=""
    elif [ "$weather_desc" == '"Rain"' ]; then
        weather_icon=""
    elif [ "$weather_desc" == '"Snow"' ]; then
        weather_icon=""
    elif [ "$weather_desc" == '"Atmosphere "' ]; then
        weather_icon=""
    fi

    echo "W $weather_icon $weather_temp$SYMBOL  |"
fi
sleep 60
done
