function colorscheme
    # Alacritty
    # Delete current colors
    sed -i '/colors/,$d' $HOME/.config/alacritty/alacritty.yml
    #switch (uname -s)
    #    case Linux:
    #        cat $alacritty/base.yml > $alacritty/alacritty.yml
    #    case Darwin
    #        cat ~/dotfiles/alacritty/.config/alacritty/base.yml | sed 's/style: Regular/style: Text/' | sed 's/size: 11.0/size: 16.0/'> $alacritty/alacritty.yml
    #    case *
    #        echo "uname returned unknown value"
    #end
    cat $HOME/.config/alacritty/$argv[1].yml >> $HOME/.config/alacritty/alacritty.yml

    # Set neovim color
    set --local nvim $HOME/dotfiles/nvim/.config/nvim
    echo "require \"user.$argv[1]\"" > $nvim/lua/user/colorscheme.lua

end
