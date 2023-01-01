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
KEY=""
CITY=""
UNITS="metric"
SYMBOL="°C"

API="https://api.openweathermap.org/data/2.5"

if [ -n "$CITY" ]; then
    if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
        CITY_PARAM="id=$CITY"
    else
        CITY_PARAM="q=$CITY"
    fi

    current=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS")
    forecast=$(curl -sf "$API/forecast?appid=$KEY&$CITY_PARAM&units=$UNITS&cnt=1")
else
    location=$(curl -sf "https://location.services.mozilla.com/v1/geolocate?key=geoclue")

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        current=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
        forecast=$(curl -sf "$API/forecast?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS&cnt=1")
    fi
fi

if [ -n "$current" ] && [ -n "$forecast" ]; then
    current_temp=$(echo "$current" | jq ".main.temp" | cut -d "." -f 1)
    current_icon=$(echo "$current" | jq -r ".weather[0].icon")

    forecast_temp=$(echo "$forecast" | jq ".list[].main.temp" | cut -d "." -f 1)
    forecast_icon=$(echo "$forecast" | jq -r ".list[].weather[0].icon")

    if [ "$current_temp" -gt "$forecast_temp" ]; then
        trend="%{F$icon_color}ﰬ%{F-}"
    elif [ "$current_temp" -lt "$forecast_temp" ]; then
        trend="%{F$icon_color}ﰵ%{F-}"
    else
        trend=""
    fi

    echo "$(get_icon "$current_icon") $current_temp$SYMBOL $trend $(get_icon "$forecast_icon") $forecast_temp$SYMBOL"
fi
