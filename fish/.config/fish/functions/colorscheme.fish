function colorscheme
    set --local alacritty $HOME/dotfiles/alacritty/.config/alacritty
    set --local nvim $HOME/dotfiles/nvim/.config/nvim

    # Set alacritty color
    switch (uname -s)
        case Linux:
            cat $alacritty/base.yml > $alacritty/alacritty.yml
        case Darwin
            cat ~/dotfiles/alacritty/.config/alacritty/base.yml | sed 's/style: Regular/style: Text/' > alacritty.yml
        case *
            echo "uname returned unknown value"
    end
    cat $alacritty/$argv[1].yml >> $alacritty/alacritty.yml

    # Set neovim color
    echo "require \"user.$argv[1]\"" > $nvim/lua/user/colorscheme.lua

end
