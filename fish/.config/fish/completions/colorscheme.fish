# Disable files from being included in completions by default
complete --command colorscheme --no-files

# Set available themes
set --local themes onedark darkplus solarized_light

# Offer themes
complete \
    --command colorscheme \
    --condition "not __fish_seen_subcommand_from $themes" \
    --arguments "$themes"
