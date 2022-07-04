# Disable files from being included in completions by default
complete --command bitcoind --no-files

# Extract options
set --local options (bitcoind --help | sed -n '/^  -/p' | sed -e 's/  -/-/;s/=.*/=/' | sed -n '/\?$/!p')

# Add options
complete \
    --command bitcoind \
    --arguments "$options"

