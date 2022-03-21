# Disable files from being included in completions by default
complete --command bitcoin-cli --no-files

# Add fixed -chain=* arguments
set --local chains "main" "test" "signet" "regtest"
complete --command bitcoin-cli --argument (string join " "-chain=$chains)

# List options which take path/dir arguments
set --local path_opts "-conf=" "-rpcwallet=" "-rpccookiefile="
set --local dir_opts "-datadir=" 

# Extract options
set --local options (bitcoin-cli -help 2>&1 | sed -n '/^  -/p' | sed -e 's/  -/-/;s/=.*/=/' | sed -n '/\?$/!p')

# Extract commands
set --local commands (bitcoin-cli help 2>&1 | sed '/^$/d;/^=/d' | sed 's/\s.*$//')

# Add options
for opt in $options
    # Add a completion for this option if we have not already seen a command
    complete \
        --command bitcoin-cli \
        --condition "not __fish_seen_subcommand_from $commands" \
        --arguments "$opt"
    # If the option is specified in $path_opts then add a path completion
    if string match --quiet --regex -- $opt $path_opts
        complete \
            --command bitcoin-cli \
            --condition "not __fish_seen_subcommand_from $commands" \
            --arguments "$opt(__fish_complete_path (commandline -ct | string replace -- $opt ''))"
    # If the option is specified in $dir_opts then add a directory completion
    else if string match --quiet --regex -- $opt $dir_opts
        complete \
            --command bitcoin-cli \
            --condition "not __fish_seen_subcommand_from $commands" \
            --arguments "$opt(__fish_complete_directories (commandline -ct | string replace -- $opt ''))"
    end
end


# Add commands with descriptions
complete \
    --command bitcoin-cli \
    --condition "not __fish_seen_subcommand_from $commands" \
    --arguments "(bitcoin-cli help 2>&1 | sed '/^\$/d;/^=/d' | sed 's/ /\t/')"
