#!/bin/sh

pgrep -x awww-daemon >/dev/null || awww-daemon &
sleep 1
awww img ~/Pictures/Wallpapers/gentoo.png
