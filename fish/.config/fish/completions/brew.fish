# In theory these should not be needed for brew-installed fish
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-fish
# but they seem to be
if test -d (brew --prefix)"/share/fish/completions"
    set -p fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end
