#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar
if [[ $(xrandr -q | grep 'HDMI-2 connected') ]];
then
polybar --config=~/.config/polybar/config.ini barLeft 2>&1 | tee -a /tmp/polybar1.log & disown &
polybar --config=~/.config/polybar/config.ini barRight 2>&1 | tee -a /tmp/polybar2.log & disown &
else
polybar --config=~/.config/polybar/config.ini barLeft 2>&1 | tee -a /tmp/polybar1.log & disown &
fi

echo "Bar launched..."
