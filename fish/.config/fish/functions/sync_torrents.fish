function sync_torrents

    set local_dir "$HOME/Downloads"
    set ssh_alias seedbox-user
    set remote_dir /home/davidblaine/rwatch
    set trash_dir "$HOME/.local/share/Trash/files"

    if rsync -avz --include='*.torrent' --exclude='*' --chmod=ugo=rwX --chown=$USER:$USER --progress -e 'ssh -F /home/will/.ssh/config' $local_dir/ $ssh_alias:$remote_dir
        echo "Sync successful. Moving *.torrent files to trash..."
        mv $local_dir/*.torrent $trash_dir/
    else
        echo "Sync failed. No files moved to trash."
    end

end
