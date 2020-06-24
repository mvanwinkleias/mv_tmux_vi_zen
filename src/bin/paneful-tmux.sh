#!/bin/bash

tmux new-session \; \
	split-window -v -p 10 \; \
	select-pane -t 0 \; \
	split-window -h -p 50 \; \
	split-window -v -p 66 \; \
	split-window -v -p 50 \; \

