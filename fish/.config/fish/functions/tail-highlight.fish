function tail-highlight --description 'Tail a file and highlight regex matches, showing all lines'
    set filename $argv[1]
    set regex $argv[2]
    tail -f $filename | awk -v pat="$regex" '
        {
            if ($0 ~ pat) 
                gsub(pat, "\033[1;31m&\033[0m", $0);
            print $0;
        }'
end
