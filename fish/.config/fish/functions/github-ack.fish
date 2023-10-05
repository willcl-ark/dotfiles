function github-ack
    set git_tip (git rev-parse HEAD)
    set cc_version ($CC --version | head -n 1 | sed 's/ (\(.*\))//')
    set cxx_version ($CXX --version | head -n 1 | sed 's/ (\(.*\))//')

    # Extract relevant details from config.log
    set configure_command (grep '^  \$ ' config.log | sed 's/^  \$ //')
    set hostname_info (grep '^hostname = ' config.log | sed 's/^hostname = //')
    set uname_m (grep '^uname -m = ' config.log | sed 's/^uname -m = //')
    set uname_r (grep '^uname -r = ' config.log | sed 's/^uname -r = //')
    set uname_s (grep '^uname -s = ' config.log | sed 's/^uname -s = //')

    echo "ACK $git_tip"
    echo ""
    echo "<details>"
    echo "  <summary>system info</summary>"
    echo "  "
    echo "| Key         | Value |"
    echo "|-------------|-------|"
    echo "| Hostname    | $hostname_info |"
    echo "| Arch        | $uname_m |"
    echo "| Kernel      | $uname_r |"
    echo "| System      | $uname_s |"
    echo "| CC          | $cc_version |"
    echo "| CXX         | $cxx_version |"
    echo "| Configure   | $configure_command |"
    echo "  "
    echo "</details>"
end
