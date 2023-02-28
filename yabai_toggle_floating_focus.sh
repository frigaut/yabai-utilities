#!/bin/bash

# Toggle focus from floating to tiled layers

cur_focus_float=$(yabai -m query --windows --window | jq '."is-floating"')

echo $cur_focus_float

if [ $cur_focus_float = true ]
then
  # select tiled windows:
  idx=$(yabai -m query --windows --space | jq '.[] | select(."is-floating"==false)' | jq '.id')
  echo "tiled windows:" $idx
else
  # select floating windows:
  idx=$(yabai -m query --windows --space | jq '.[] | select(."is-floating"==true)' | jq '.id')
  echo "floating windows:" $idx
fi


set -- $idx
if [ ! -z "$1" ]
then
  yabai -m window $1 --focus
  if [ $cur_focus_float = false ]
  then
    yabai -m window --layer above
  fi
fi


