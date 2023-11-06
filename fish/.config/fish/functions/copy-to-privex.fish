function copy-to-privex
    set destination ubuntu@privex:/var/www/tmp_file_server

    for path in $argv
        # Handle trailing slashes for directories from args
        set trimmed_path (string trim -r -c / -- $path)
        set filename (basename -- $trimmed_path)
        set sanitized_filename (string replace -r " " "_" -- $filename)

        if test -f $path
            rsync -avz -- $path $destination/$sanitized_filename
            echo "File copied successfully."
            echo "URL: https://tmp.256k1.dev/$sanitized_filename"
        else if test -d $path
            # Add a slash at the end of the directory path for rsync
            rsync -avz -- $path/ $destination/$sanitized_filename/
            echo "Directory copied successfully."
            echo "URL: https://tmp.256k1.dev/$sanitized_filename/"
        else
            echo "Path '$path' does not exist."
        end
    end
end
