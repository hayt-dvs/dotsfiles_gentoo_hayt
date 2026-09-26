#!/bin/sh

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin:$HOME/.local/bin"

echo "===== HYPR STARTUP $(/usr/bin/date) =====" >> /tmp/hypr-startup.log
/usr/bin/touch /tmp/HYPR_AUTOSTART_OK

if ! /usr/bin/pgrep -x pipewire >/dev/null 2>&1; then
    /usr/bin/pipewire >>/tmp/pipewire.log 2>&1 &
fi

/usr/bin/sleep 1

if ! /usr/bin/pgrep -x pipewire-pulse >/dev/null 2>&1; then
    /usr/bin/pipewire-pulse >>/tmp/pipewire-pulse.log 2>&1 &
fi

/usr/bin/sleep 1

if ! /usr/bin/pgrep -x wireplumber >/dev/null 2>&1; then
    /usr/bin/wireplumber >>/tmp/wireplumber.log 2>&1 &
fi

/usr/bin/pkill waybar 2>/dev/null || true
/usr/bin/sleep 0.5
/usr/bin/waybar >>/tmp/waybar.log 2>&1 &

if ! /usr/bin/pgrep -x swaync >/dev/null 2>&1; then
    /usr/bin/swaync >>/tmp/swaync.log 2>&1 &
fi

if [ -x /usr/bin/awww-daemon ]; then
    if ! /usr/bin/pgrep -x awww-daemon >/dev/null 2>&1; then
        /usr/bin/awww-daemon >>/tmp/awww.log 2>&1 &
        /usr/bin/sleep 1
    fi

    if [ -x /usr/bin/awww ] && [ -f "$HOME/Pictures/Wallpapers/gentoo.png" ]; then
        /usr/bin/awww img "$HOME/Pictures/Wallpapers/gentoo.png" >>/tmp/awww.log 2>&1
    fi
fi

if [ -x "$HOME/.config/hypr/scripts/refresh-rate.sh" ]; then
    "$HOME/.config/hypr/scripts/refresh-rate.sh" >>/tmp/refresh-rate.log 2>&1 &
fi
