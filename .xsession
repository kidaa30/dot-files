#!/bin/sh

# FIXME
/usr/bin/xhost +localhost

/usr/bin/xsri --color=\#1b1b1b

# start xscreensaver
xscreensaver -no-splash &

# start synergy client
#/usr/bin/sudo /usr/bin/killall synergys
#/usr/bin/sleep 1
#/usr/bin/synergys 

# start pulseaudio
/usr/bin/pulseaudio --start --log-target=syslog

# start gc-remind
/usr/bin/nohup ~/bin/gc/gc-remind &>>/dev/null & 

/usr/bin/xmonad

# stop mpd
/usr/bin/mpd --kill

# stop pulseaudio
/usr/bin/pulseaudio --kill

# stop xscreensaver
/usr/bin/xscreensaver-command -exit

# stop gc-remind
/usr/bin/pkill gc-remind
