#!/bin/bash

# One long, thin pane at the bottom (for builds)
# A tall pane at the left (for editing)
# 3 panes on the right for agility

tmux new-session \; \
	split-window -v -p 10 \; \
	select-pane -t 0 \; \
	split-window -h -p 50 \; \
	split-window -v -p 66 \; \
	split-window -v -p 50 \; \

