function copy-to-privex
    set local_file $argv[1]
    set destination ubuntu@privex:/var/www/tmp_file_server

    if test -f $local_file
        rsync -avz $local_file $destination
        echo "File copied successfully."
    else
        echo "File does not exist."
    end

end
