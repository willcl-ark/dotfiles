function extract-log-lines
    set log_file $argv[1]
    set start_time $argv[2]
    set end_time $argv[3]

    sed -n '/'"$start_time"'/,/'"$end_time"'/p' $log_file
end
