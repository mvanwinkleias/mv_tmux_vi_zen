#!/bin/bash

# One long, thin pane at the bottom
# A tall pane at the left (for editing)
# 3 panes on the right for agility

# Scratch:
# set pane-border-status top \; \
# select-pane -T 'Editor' \; \

# Allow us to use GPG in it:
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

rp="$(realpath $(pwd) )"

b64_path=$( \
	printf "%s" "$rp" \
	| openssl sha256 -binary \
	| base64 \
	| sed 's/\//_/g' \
) 

b64_path="${b64_path:0:5}"
session_base_name="~$b64_path~${PWD##*/}~"
session_base_name="${session_base_name//./﹒}"
session_base_name="${session_base_name//:/։}"

printf "Session base name: %s\n" "$session_base_name"
found_session=$(\
	tmux list-sessions -F '#S' \
	| grep "$session_base_name" \

)

result="$?"

# exit 1

if [[ "$result" == 0 ]]
then
	printf "Found session: $found_session\n"
	tmux attach-session -t "$found_session:0"
else
	session_name="$session_base_name"$(date '+%Y%m%d%H%M%S')

	printf "Making new session: %s\n" "$session_name"
	tmux new-session \; \
		rename-session "$session_name" \; \
		split-window -v -p 10 \; \
		select-pane -t 0 \; \
		split-window -h -p 50 \; \
		split-window -v -p 66 \; \
		split-window -v -p 50 \; \
		select-pane -t 0 \; 
fi
