#!/bin/sh

icon_color="#98c379"
get_icon() {
    case $1 in
        # # Icons for nerd fonts (nf-fae) (I manually added this)
        # 01d) icon="";; # clear sky
        # 01n) icon="";;
        # 02d) icon="";; # few clouds
        # 02n) icon="";;
        # 03*) icon="";; # scattered clouds
        # 04*) icon="";; # broken clouds
        # # 09*) icon="";; # shower rain
        # 09d) icon="";;
        # 09n) icon="";;
        # # 10*) icon="";; # rain
        # 10d) icon="";;
        # 10n) icon="";;
        # # 11*) icon="";; # thunderstorm
        # 11d) icon="";;
        # 11n) icon="";;
        # # 13n) icon="";; # snow 
        # 13d) icon="";;
        # 13n) icon="";;
        # # 50*) icon="";; # mist / fog
        # 50d) icon="";;
        # 50n) icon="";;
        # *) icon="";

        # Icons for emojis
        01d) icon="☀️";; # clear sky
        01n) icon="🌙";;
        02d) icon="⛅";; # few clouds
        02n) icon="☁️";;
        03*) icon="☁️";; # scattered clouds
        04*) icon="☁️";; # broken clouds
        09*) icon="🌧️";; # shower rain
        10*) icon="🌧️";; # rain
        11*) icon="⛈️";; # thunderstorm
        13n) icon="🌨️";; # snow ❄️
        50*) icon="🌫️";; # mist / fog
        *) icon="";

    esac
    # echo $icon
    echo "%{F$icon_color}$icon%{F-}"
}

# Import $KEY and $CITY
. "polyweather-var.sh"
UNITS="metric"
SYMBOL="°C"

API="https://api.openweathermap.org/data/2.5"

if [ -n "$CITY" ]; then
    if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
        CITY_PARAM="id=$CITY"
    else
        CITY_PARAM="q=$CITY"
    fi

    weather=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS")
else
    location=$(curl -sf "https://location.services.mozilla.com/v1/geolocate?key=geoclue")

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        weather=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
    fi
fi

if [ -n "$weather" ]; then
    weather_desc=$(echo "$weather" | jq -r ".weather[0].description")
    weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    weather_icon=$(echo "$weather" | jq -r ".weather[0].icon")

    echo "$(get_icon "$weather_icon")" "$weather_desc", "$weather_temp$SYMBOL"
fi
