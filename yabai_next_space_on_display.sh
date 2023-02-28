#!/bin/bash
# This script will focus the next space in the current display
# yabai_prev_space_on_display.sh

# What's the current display and space?
curdis=$(yabai -m query --displays --display | jq '.index')
curspa=$(yabai -m query --spaces --space | jq '.index')
# get all spaces
allspa=$(yabai -m query --spaces --display $curdis | jq ".[].index")
# get all spaces of index higher than current one
higspa=$(yabai -m query --spaces --display $curdis | jq ".[].index | select(. > $curspa)")


if [ ! -z "$higspa" ]
then
  # there is at least one space with higher index on this display, switch to it 
  set -- $higspa
else
  # there is no space with higher index on this display, 
  # circle around to lowest index space.
  # Comment if you don't want to wrap around
  set -- $allspa
fi

# echo " " >> /tmp/yabai_spaces
# echo $(date) >> /tmp/yabai_spaces
# echo "On display" $curdis "Space" $curspa "->" $1 >> /tmp/yabai_spaces
# echo "All spaces on display:" $allspa >> /tmp/yabai_spaces
# echo "Spaces higher than current ("$curspa") on display: "$higspa >> /tmp/yabai_spaces

yabai -m space --focus $1
# skhd -k "ctrl - $1"
