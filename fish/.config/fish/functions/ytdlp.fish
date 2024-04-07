function ytdlp
    # Trap to catch Ctrl+C
    function handle_interrupt
        echo "Operation interrupted by user."
        exit 1
    end
    trap handle_interrupt INT

    read --prompt-str "Enter video URL: " url || return
    yt-dlp -F $url
    read --prompt-str "Enter format: " format || return
    read --prompt-str "Embed Thumbnail? (y/n)" thumb || return
    if test "$thumb" = "y" -o "$thumb" = "Y"
        yt-dlp -f $format $url \
            --embed-thumbnail \
            --restrict-filenames
            # --cookies-from-browser firefox:/home/will/snap/firefox/common/.mozilla/firefox/b2pboypq.default-release
    else
        yt-dlp -f $format $url \
            --restrict-filenames
            # --cookies-from-browser firefox:/home/will/snap/firefox/common/.mozilla/firefox/b2pboypq.default-release
    end

    # Remove the trap
    trap - INT
end
