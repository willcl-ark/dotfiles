# Disable files from being included in completions by default
complete --command bitcoin-util --no-files

# Extract options
set --local options (bitcoin-util -help | sed -e '/^  -/ p' -e d | sed -e 's/=.*/=/' | sed -n '/\?$/!p')

# Extract commands 
set --local commands (bitcoin-util -help | sed -e '1,/Commands:/d' -e 's/=.*/=/' -e 's/(=/=/' -e '/^  [a-z]/ p' -e d)

# Offer options without descriptions
complete \
    --command bitcoin-util \
    --condition "not __fish_seen_subcommand_from $commands" \
    --arguments "$options"

# Offer commands with descriptions
complete \
    --command bitcoin-util \
    --condition "not __fish_seen_subcommand_from $commands" \
    --arguments "(bitcoin-util -help | sed -e '1,/Commands:/d' -e 's/=/=\t/' -e 's/(=/=/' -e 's/N)/(N)/' -e '/^  [a-z]/ p' -e 'd' | sed 's/^ *//')"

