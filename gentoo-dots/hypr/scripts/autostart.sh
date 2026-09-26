#!/bin/sh

# Waybar
pkill waybar 2>/dev/null
waybar >/tmp/waybar.log 2>&1 &

# SwayNC
pgrep -x swaync >/dev/null || swaync >/tmp/swaync.log 2>&1 &
