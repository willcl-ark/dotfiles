# Defined in /var/folders/lv/mzq3bl914tn_g7dg9qcx7chc0000gn/T//fish.iWV8xg/return_SSID.fish @ line 2
function return_SSID
	set -gx SSID (/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}')
end
