function tm
    if tmux list-sessions -F "#S" 2>/dev/null | grep -q '^admin$'
        tmux attach-session -t admin
    else if tmux list-sessions -F "#S" 2>/dev/null | grep -q '^core$'
        tmux attach-session -t core
    else
        tmux new-session -s admin
    end

end
