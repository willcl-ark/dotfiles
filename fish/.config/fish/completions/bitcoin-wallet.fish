# Disable files from being included in completions by default
complete --command bitcoin-wallet --no-files

# Extract options
set --local options (bitcoin-wallet -help | sed -e '/^  -/ p' -e d | sed -e 's/=.*/=/' | sed -n '/\?$/!p')

# Extract commands 
set --local commands (bitcoin-wallet -help | sed -e '1,/Commands:/d' -e 's/=.*/=/' -e 's/(=/=/' -e '/^  [a-z]/ p' -e d)

# Offer options without descriptions
complete --command bitcoin-wallet --condition "not __fish_seen_subcommand_from $commands" --arguments "$options"
# Offer commands with descriptions
complete --command bitcoin-wallet --condition "not __fish_seen_subcommand_from $commands" --arguments "(bitcoin-wallet -help | sed -e '1,/Commands:/d' -e 's/=/=\t/' -e 's/(=/=/' -e 's/N)/(N)/' -e '/^  [a-z]/ p' -e 'd' | sed 's/^ *//')"


