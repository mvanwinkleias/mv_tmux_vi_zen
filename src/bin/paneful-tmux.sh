#!/bin/bash

# paneful-tmux.sh
# 	For any given path, create a unique tmux session named thus:
# 		<part of the b64 hash of realpath>~<dirname of path>
# 	i.e.
# 		X4hf7~some_project
#
# If a session already matches that name then it will attach to that session.
#
# Created sessions start off with panes that I typically use when programming.
#
# Valid session names can not contain dots "." or colons ":", so if they exist
# in the current directory name then they are replaced by some unicode
# equivalent.
#
# ## Rationale
# 
# The full path to a project can be quite long.  So, it's hashed into a sha256,
# and then base64'd.  The chances of a collision are 64^5 (5 characters are
# currently used).  It uses openssl to generate the hash.


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
session_base_name="$b64_path~${PWD##*/}"
session_base_name="${session_base_name//./﹒}"
session_base_name="${session_base_name//:/։}"

printf "Session base name: %s\n" "$session_base_name"
found_sessions=$(\
	tmux list-sessions -F '#S' \
	| grep "$session_base_name" \

)

result="$?"

# exit 1


# found_sessions="session 1
# session 2"

# printf "Found sessions: %s\n" "$found_sessions"

session_count=$( printf "%s\n" "$found_sessions" | wc -l)
if [[ "$session_count" -gt 1 ]]
then
	>&2 printf "More than one session found matching base session name.\n"
	>&2 printf "Please use tmux directly.\n"
	>&2 printf "%s\n" "$found_sessions"
	exit 1
fi

if [[ "$result" == 0 ]]
then
	printf "Found session: $found_sessions\n"
	tmux attach-session -t "$found_sessions:0"
else
	session_name="$session_base_name"

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
