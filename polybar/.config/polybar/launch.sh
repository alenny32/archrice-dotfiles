#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar 2>/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar top 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Polybar launched..."
