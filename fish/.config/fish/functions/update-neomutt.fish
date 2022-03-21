function update-neomutt
    ./configure --notmuch --with-notmuch=/usr/lib/x86_64-linux-gnu/libnotmuch --ssl --lmdb --pcre2 --sqlite --zlib --disable-doc --gpgme && \\
    make -j16 && \
    sudo make install
end
