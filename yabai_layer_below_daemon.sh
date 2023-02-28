#!/bin/bash

pkill -f yabai_layer_below_daemon

# tiled_windows=$(yabai -m query --windows | jq '.[].id' | sort -nr); 

# select non floating windows:
tiled_windows=$(yabai -m query --windows | jq '.[] | select(."is-floating"==false)' | jq '.id')

while [ true ]
do
  for idx in $tiled_windows; 
    do yabai -m window $idx --layer below; 
  done
  sleep 10;
done
