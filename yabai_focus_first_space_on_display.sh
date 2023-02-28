#!/bin/bash
# This script will focus the next space in the current display
# yabai_prev_space_on_display.sh

# What's the current display and space?
curdis=$(yabai -m query --displays --display | jq '.index')
# get all spaces
allspa=$(yabai -m query --spaces --display $curdis | jq ".[].index")
set -- $allspa
yabai -m space --focus $1
