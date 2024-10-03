#!/usr/bin/env bash

# Filename: ~/.scripts/colorscheme/set_tmux_colors.sh
# ~/.scripts/colorscheme/set_tmux_colors.sh

# Source the colorscheme file
source "$HOME/.scripts/colorscheme/active/active-colorscheme.sh"

# Output tmux set commands
# I use this for my custom tmux banner on the right side
tmux set -g @catppuccin_directory_color "$ckolor03"

# Color of the ACTIVE window, windows are opened with ctrl+b c
tmux set -g @catppuccin_window_current_color "$ckolor03"
tmux set -g @catppuccin_window_current_background "$ckolor13"

# Color of the rest of the windows that are not active
tmux set -g @catppuccin_window_default_color "$ckolor15"
tmux set -g @catppuccin_window_default_background "$ckolor10"

# The following 2 colors are for the lines that separate tmux splits
tmux set -g @catppuccin_pane_active_border_style "fg=$ckolor03"
tmux set -g @catppuccin_pane_border_style "fg=$ckolor09"

# This is the classic colored tmux bar that goes across the entire screen
# set -g @catppuccin_status_background "theme"
tmux set -g @catppuccin_status_background "$ckolor10"

# default for catppuccin_session_color is #{?client_prefix,$thm_red,$thm_green}
# https://github.com/catppuccin/tmux/issues/140#issuecomment-1956204278
tmux set -g @catppuccin_session_color "#{?client_prefix,$ckolor04,$ckolor02}"

# This sets the color of the window text, #W shows the application name
tmux set -g @catppuccin_window_default_fill "number"
tmux set -g @catppuccin_window_default_text "#[fg=$ckolor14]#W"
tmux set -g @catppuccin_window_current_fill "number"
tmux set -g @catppuccin_window_current_text "#[fg=$ckolor14]#W"

# Put this option below the '@catppuccin_window_current_text' option for it to
# override it, otherwise it won't work
# I got the 'window_zoomed_flag' tip from 'DevOps Toolbox' youtuber
# https://youtu.be/GH3kpsbbERo?si=4ZoV090qVbble7np
#
# Second option shows a message when panes are syncronized
tmux set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,#[fg=$ckolor04] (   ),}#{?pane_synchronized,#[fg=$ckolor04] SYNCHRONIZED-PANES,}"

tmux set -g @floax-border-color "$ckolor5"
tmux set -g @floax-text-color "$ckolor2"
tmux set -g pane-active-border-style "fg=$ckolor5,bg=default"
tmux set -g pane-border-style "fg=$ckolor10,bg=default"
