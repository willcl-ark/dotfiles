#!/bin/bash

# Example locker script -- demonstrates how to use the --transfer-sleep-lock
# option with i3lock's forking mode to delay sleep until the screen is locked.


## CONFIGURATION ##############################################################

# Options to pass to i3lock
i3lock_options="-d -i /tmp/screen_locked.png"

# Run before starting the locker
pre_lock() {
    # Take a screenshot
    scrot /tmp/screen_locked.png

    # Pixellate it 10x
    mogrify -scale 10% -scale 1000% /tmp/screen_locked.png
    return
}

# Run after the locker exits
post_lock() {
    rm /tmp/screen_locked.png
    return
}

###############################################################################

pre_lock

# We set a trap to kill the locker if we get killed, then start the locker and
# wait for it to exit. The waiting is not that straightforward when the locker
# forks, so we use this polling only if we have a sleep lock to deal with.
if [[ -e /dev/fd/${XSS_SLEEP_LOCK_FD:--1} ]]; then
    kill_i3lock() {
        pkill -xu $EUID "$@" i3lock
    }

    trap kill_i3lock TERM INT

    # we have to make sure the locker does not inherit a copy of the lock fd
    i3lock $i3lock_options {XSS_SLEEP_LOCK_FD}<&-
    sleep 10; xset dpms force off

    # now close our fd (only remaining copy) to indicate we're ready to sleep
    exec {XSS_SLEEP_LOCK_FD}<&-

    while kill_i3lock -0; do
        sleep 0.5
    done
else
    trap 'kill %%' TERM INT
    i3lock -n $i3lock_options &
    sleep 10; xset dpms force off
    wait
fi

post_lock
