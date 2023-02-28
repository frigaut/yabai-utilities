#!/bin/bash

for idx in $(yabai -m query --windows | jq '.[].id' | sort -nr); 
  do yabai -m window $idx --layer normal; 
done
