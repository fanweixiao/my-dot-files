tmux kill-session -t cctmux
tmux new-session -d -s cctmux
tmux selectp -t 0
tmux splitw -h
tmux attach-session -t cctmux
