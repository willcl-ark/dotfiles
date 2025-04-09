function note
    set date (date +%Y-%m-%d)
    set diary_dir ~/diary
    set file_path $diary_dir/$date.md

    if not test -d $diary_dir
        mkdir -p $diary_dir
    end

    # Check if we're in tmux
    if set -q TMUX
        # Try to switch to existing session or create new one named "diary"
        tmux has-session -t diary 2>/dev/null
        if test $status -ne 0
            # Session doesn't exist, create it with a shell first
            tmux new-session -d -s diary
        end
        # Switch to the diary session
        tmux switch-client -t diary
        tmux send-keys -t diary "nvim $file_path" Enter
        return 0
    end
    nvim $file_path
end
