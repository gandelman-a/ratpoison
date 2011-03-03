#!/bin/bash
[[ $1 == "horiz" ]] && DIR="hsplit"
[[ $1 == "vert" ]] && DIR="vsplit"
CUR_FRAMES=$($HOME/.ratpoison/bin/list_frames.sh) 
ratpoison -c "$DIR"
NEW_FRAMES=$($HOME/.ratpoison/bin/list_frames.sh) 
NEW_FRAME=$($HOME/.ratpoison/bin/frame_diff.sh "$CUR_FRAMES" "$NEW_FRAMES") 
ratpoison -c "fselect $NEW_FRAME"
ratpoison -c "exec $2" 
