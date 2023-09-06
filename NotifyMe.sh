#!/bin/bash


# Get the current battery level
battery_level=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | grep -o "[0-9]*")

# If the battery level is less than or equal to 40%,
if [ $battery_level -le 40 ]; then

  # Create a notification
  notify-send -t 10000 -u critical "Battery level low" "Your battery level is low. Please plug in your charger. $USER"; speaker-test -t sine -f 1000 -l 1 & sleep .9 && kill -9 $!
fi

# Sleep for 1 minute
sleep 60

# Repeat
while true; do
    battery_level=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | grep -o "[0-9]*")
  if [ $battery_level -le 40 ]; then
    notify-send -t 10000 -u critical "Battery level low" "Your battery level is low. Please plug in your charger. $USER"; speaker-test -t sine -f 1000 -l 1 & sleep .9 && kill -9 $!
  fi

  sleep 60
done
