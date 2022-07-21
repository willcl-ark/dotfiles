function colorscheme
    set --local alacritty $HOME/dotfiles/alacritty/.config/alacritty
    set --local nvim $HOME/dotfiles/nvim/.config/nvim

    # Set alacritty color
    cat $alacritty/base.yml $alacritty/$argv[1].yml > $alacritty/alacritty.yml

    # Set neovim color
    echo "require \"user.$argv[1]\"" > $nvim/lua/user/colorscheme.lua

end
