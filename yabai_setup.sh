#!/bin/bash

for _ in $(yabai -m query --spaces --display | jq '.[].index | select(. > 5)'); do
  yabai -m space --destroy 6
done

# for _ in $(yabai -m query --spaces --display 2 | jq '.[].index | select(. > 1)'); do
#   yabai -m space --destroy 2
# done

for idx in $(yabai -m query --spaces | jq '.[].index'); do
  last_space=$idx
done

yabai -m rule --add label="Kitty_space" app="^kitty$" space=1
yabai -m rule --add label="Code_space" app="^Code$" space=1
yabai -m rule --add label="Slack_space" app="^Slack$" space=2
yabai -m rule --add label="Logseq_space" app="^Logseq$" space=2
yabai -m rule --add label="Mail_space" app="^Mail$" space=3
yabai -m rule --add label="Calendar_space" app="^Calendar$" space=3
yabai -m rule --add label="Safari_space" app="^Safari$" space=4
yabai -m rule --add label="Firefox_space" app="^Firefox$" space=4
yabai -m rule --add label="Spotify_space" app="^Spotify$" space=$last_space
yabai -m rule --add label="Qobuz_space" app="^Qobuz$" space=$last_space

open -a Visual\ Studio\ Code.app
open -a Slack.app
open -a Logseq.app
open -a Mail.app
open -a Calendar.app
open -a Safari.app
open -a Qobuz.app
open -a Spotify.app
open -a Kitty.app

# set all (tiled) windows to bottom.
yabai_layer_below_daemon.sh &
# yabai_layer_normal.sh

sleep 20
yabai -m rule --remove "Kitty_space"
