function update-ytdl
    set cur_version (youtube-dl --version)
    if test (curl --include --silent https://yt-dl.org/downloads/latest/youtbe-dl | grep $cur_version | wc -l) = 1
        set_color green
        echo "Already on latest version"
        set_color normal
    else
        sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
        sudo chmod a+rx /usr/local/bin/youtube-dl
        set_color green
        echo "Updated youtube-dl"
        set_color normal
    end
end
