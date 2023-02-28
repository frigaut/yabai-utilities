# yabai-utilities

A set of utilities to interact with [yabai](https://github.com/koekeishiya/yabai) and provide a smoother yabai experience.

These are distributed in the hope that they will be useful to someone. The author accepts no responsibility if these somehow breaks your machine/session.

All these utilities are bash script. They use bash functions and call to yabai (through the yabai command) to manipulate and manage windows, spaces, displays. The name are fairly self explanatory and I have tried to comment the code.

- **Move through spaces within the current display**: Something that yabai misses out of the box is the ability to move spaces only from the current display. These four scripts provide this functionality: `yabai_focus_first_space_on_display.sh`, `yabai_focus_last_space_on_display.sh`, `yabai_next_space_on_display.sh`, `yabai_prev_space_on_display.sh` 
- **Toggle focus between floating and non-floating windows**: AFAIK, there is nothing of the like in yabai. `yabai_toggle_floating_focus.sh` provides this.

