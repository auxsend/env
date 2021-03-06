#!/bin/sh


outer=all

tmux new-session -d -s $outer 

tmux send-keys -t $outer 'set TMUX' C-m
tmux send-keys -t $outer 'tmux new -s l' C-m

tmux split-window -t $outer -h 
tmux send-keys -t $outer 'set TMUX' C-m
tmux send-keys -t $outer 'tmux new -s ru' C-m

tmux split-window -t $outer -v 
tmux send-keys -t $outer 'set TMUX' C-m
tmux send-keys -t $outer 'tmux new -s rd' C-m



tmux attach -t $outer
