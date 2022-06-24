function ytdlp
    read --prompt-str "Enter video URL: " url
    yt-dlp -F $url
    read --prompt-str "Enter format: " format
    yt-dlp -f $format $url
end
