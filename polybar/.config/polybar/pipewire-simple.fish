#!/usr/bin/env fish

function parse_default
    if string match -rq 'UR22' $argv[1]
        echo "UR22"
    else if string match -rq 'RODE' $argv[1]
        echo "Rode NT"
    else
        echo $argv[1]
    end
end

set --local VOLUME (pactl get-sink-volume @DEFAULT_SINK@ | awk '$1=="Volume:" {print $5}')
set --local SINK (parse_default (pactl get-default-sink))
set --local SOURCE (parse_default (pactl get-default-source))

switch argv[1]
    case --up
        pactl set-sink-volume @DEFAULT_SINK +10%
    case --down
        pactl set-sink-volume @DEFAULT_SINK -10%
    case --mute
        pactl set-sink-mute @DEFAULT_SINK@ toggle
    case '*'
        echo "%{F#cba6f7}Source%{F-}: $SOURCE | %{F#eba0ac}Sink%{F-} : $VOLUME $SINK"
end
