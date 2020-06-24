#!/bin/bash

# An attempt to get the tmux pane title to have
#  cwd
#  user
#  host
# 
# instead of in the prompt.
# No, it doesn't work (yet)
# One long, thin pane at the bottom (for builds)
# A tall pane at the left (for editing)
# 3 panes on the right for agility

# Scratch:
# set pane-border-status top \; \
# select-pane -T 'Editor' \; \

tmux new-session \; \
	set pane-border-status top \; \
	set status-interval 5 \; \
	set automatic-rename on \; \
	set automatic-rename-format '#{b:pane_current_path}' \; \
	split-window -v -p 10 \; \
	select-pane -t 0 \; \
	split-window -h -p 50 \; \
	split-window -v -p 66 \; \
	split-window -v -p 50 \; \
	select-pane -t 0 \; \
