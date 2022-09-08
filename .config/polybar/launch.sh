#!/usr/bin/env bash
intern=eDP-1-1
extern=HDMI-0

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar
if xrandr | grep "$extern connected"; then
  echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
  polybar -r --config=~/.config/polybar/config.ini barLeft 2>&1 | tee -a /tmp/polybar1.log & disown &
  polybar -r --config=~/.config/polybar/config.ini barRight 2>&1 | tee -a /tmp/polybar2.log & disown &
  echo "Bar launched..."
else
  echo "---" | tee -a /tmp/polybar1.log
  polybar -r --config=~/.config/polybar/config.ini barSingle 2>&1 | tee -a /tmp/polybar1.log & disown &
  echo "Bar launched..."
fi
