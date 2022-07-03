function ytdlp
    read --prompt-str "Enter video URL: " url
    yt-dlp -F $url
    read --prompt-str "Enter format: " format
    read --prompt-str "Embed Thumbnail? (y/n)" thumb
    if test "$thumb" = "y" -o "Y"
        yt-dlp -f $format $url --embed-thumbnail
    else
        yt-dlp -f $format $url
    end
end
