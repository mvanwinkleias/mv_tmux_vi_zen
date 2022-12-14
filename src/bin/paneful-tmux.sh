#!/bin/bash

# One long, thin pane at the bottom (for builds)
# A tall pane at the left (for editing)
# 3 panes on the right for agility

# Scratch:
# set pane-border-status top \; \
# select-pane -T 'Editor' \; \

# Allow us to use GPG in it:
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

session_name=${PWD##*/}
session_name="${session_name}-"$(date '+%Y_%m_%d_%H_%M_%S')
tmux new-session \; \
	rename-session "$session_name" \; \
	split-window -v -p 10 \; \
	select-pane -t 0 \; \
	split-window -h -p 50 \; \
	split-window -v -p 66 \; \
	split-window -v -p 50 \; \
	select-pane -t 0 \; \
#	send-keys "vim -c 'Texplore'" C-m
