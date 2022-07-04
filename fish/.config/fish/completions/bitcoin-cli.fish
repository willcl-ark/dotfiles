# Disable files from being included in completions by default
complete --command bitcoin-cli --no-files

# Extract options
set --local options (bitcoin-cli -help 2>&1 | sed -n '/^  -/p' | sed -e 's/  -/-/;s/=.*/=/' | sed -n '/\?$/!p')

# Extract commands
set --local commands (bitcoin-cli help 2>&1 | sed '/^$/d;/^=/d' | sed 's/\s.*$//')

# Add options
complete \
    --command bitcoin-cli \
    --condition "not __fish_seen_subcommand_from $commands" \
    --arguments "$options"

# Add commands with descriptions
complete \
    --command bitcoin-cli \
    --condition "not __fish_seen_subcommand_from $commands" \
    --arguments "(bitcoin-cli help 2>&1 | sed '/^\$/d;/^=/d' | sed 's/ /\t/')"
