function active-contributors
    if test (count $argv) -eq 1
        set path $argv[1]
        if test -e $path
            if test -d $path
                echo "Listing contributors with the most commits to files in the directory (excluding merge commits): $path"
                git shortlog -n -s --no-merges -- $path | fzf | cut -f2- | xargs -I % git log --author=% --no-merges -- $path
            else
                echo "Listing contributors with the most commits to the file (excluding merge commits): $path"
                git shortlog -n -s --no-merges -- $path | fzf | cut -f2- | xargs -I % git log --author=% --no-merges -- $path
            end
        else
            echo "Error: Path not found: $path"
        end
    else
        echo "Usage: git_contributors <path>"
    end
end
