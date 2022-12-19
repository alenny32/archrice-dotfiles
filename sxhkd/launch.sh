#!/bin/sh

# Terminate already running sxhkd
killall -q sxhkd

# Wait until the processes have been shut down
while pgrep -x sxhkd >/dev/null; do sleep 1; done

# Launch sxhkd
sxhkd -c $XDG_CONFIG_HOME/sxhkd/sxhkdrc &
