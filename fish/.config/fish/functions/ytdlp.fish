function ytdlp

    # Trap to catch Ctrl+C
    function handle_interrupt
        exit 1
    end
    trap handle_interrupt INT

    read --prompt-str "Enter video URL: " url || return
    if not string match -q "http*" $url
        echo "Invalid URL format"
        return 1
    end

    yt-dlp -F $url || return

    read --prompt-str "Enter format (e.g. 137+251 for 1080p video + best audio): " format || return
    if test -z "$format"
        echo "Format cannot be empty"
        return 1
    end

    read --prompt-str "Embed Thumbnail? (y/n) " thumb || return
    if test "$thumb" = "y" -o "$thumb" = "Y"
        yt-dlp -f $format $url \
            --embed-thumbnail \
            --restrict-filenames \
            --cookies-from-browser firefox
    else
        yt-dlp -f $format $url \
            --restrict-filenames \
            --cookies-from-browser firefox
    end

    # Remove the trap
    trap - INT
end
