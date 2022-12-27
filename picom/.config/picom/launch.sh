#!/bin/sh

# Terminate already running compton
killall -q picom

# Wait until the processes have been shut down
while pgrep -x picom >/dev/null; do sleep 1; done

# Launch compton
picom --daemon --fading --backend glx --config $XDG_CONFIG_HOME/picom/picom.conf &
