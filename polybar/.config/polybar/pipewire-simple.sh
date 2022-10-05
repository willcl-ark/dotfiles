#!/usr/bin/env sh

getDefaultSink() {
    sink=$(pactl get-default-sink)
    case $sink in 
        *UR22*)
            echo "UR22"
            break
            ;;
        *RODE*)
            echo "Rode NT"
            break
            ;;
        *)
            echo $sink
            ;;
    esac
}

getDefaultSource() {
    sink=$(pactl get-default-source)
    case $sink in 
        *UR22*)
            echo "UR22"
            break
            ;;
        *RODE*)
            echo "Rode NT"
            break
            ;;
        *)
            echo $sink
            ;;
    esac
}


VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '$1=="Volume:" {print $5}')
SINK=$(getDefaultSink)
SOURCE=$(getDefaultSource)

case $1 in
    "--up")
        pamixer --increase 10
        ;;
    "--down")
        pamixer --decrease 10
        ;;
    "--mute")
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
    *)
        echo "Source: ${SOURCE} | Sink: ${VOLUME} ${SINK}"
esac
