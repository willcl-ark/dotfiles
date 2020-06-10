# Defined in /var/folders/0d/tgscg8cj0rx035gf2lvl15fh0000gn/T//fish.YKkbXL/sshnuc.fish @ line 2
function sshnuc
    switch (echo "$SSID")
        case "6" "6-5GHz"
            ssh nuclocal
        case '*'
            ssh nucremote
        end
end
