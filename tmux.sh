#!/bin/bash

SESSION="main"

# Don't create a new session if it already exists
tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
  # Window 1 — nvim
  tmux new-session -d -s $SESSION -n "terminal"

  # Window 2 — terminal
  tmux new-window -t $SESSION:2 -n "editor"
  tmux send-keys -t $SESSION:2 "nvim" Enter

  # Window 3 —  terminal
  tmux new-window -t $SESSION -n "terminal"

  # Focus window 1
  tmux select-window -t $SESSION:1
fi

# Attach in Alacritty
alacritty -e tmux attach-session -t $SESSION
