-- =========================================
-- HYPRLAND 0.56.2
-- Catppuccin Mocha
-- =========================================

-- ---------- MONITOR ----------

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
})


-- ---------- GENERAL ----------

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 8,
        border_size = 2,
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",

        col = {
            active_border = {
                colors = {
                    "rgba(cba6f7ee)",
                    "rgba(89b4faee)",
                    "rgba(f5c2e7ee)"
                },
                angle = 45,
            },

            inactive_border = "rgba(45475aaa)",
        },
    },


    -- ---------- DECORATION ----------

    decoration = {
        rounding = 12,

        active_opacity = 0.95,
        inactive_opacity = 0.85,
        fullscreen_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 15,
            render_power = 3,
            color = "rgba(00000080)",
        },

        blur = {
            enabled = true,
            size = 6,
            passes = 3,
            vibrancy = 0.15,
            noise = 0.02,
        },
    },


    -- ---------- INPUT ----------

    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
            tap_to_click = true,
        },
    },


    -- ---------- DWINDLE ----------

    dwindle = {
        preserve_split = true,
    },


    -- ---------- MASTER ----------

    master = {
        new_status = "master",
        mfact = 0.55,
    },


    -- ---------- MISC ----------

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0,
    },
})


-- =========================================
-- ANIMATIONS
-- =========================================

hl.config({
    animations = {
        enabled = true,
    },
})


hl.curve("smooth", {
    type = "bezier",
    points = {
        {0.16, 1},
        {0.3, 1},
    },
})


hl.curve("easeOut", {
    type = "bezier",
    points = {
        {0.23, 1},
        {0.32, 1},
    },
})


hl.animation({
    leaf = "global",
    enabled = true,
    speed = 8,
    bezier = "smooth",
})


hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 5,
    bezier = "smooth",
})


hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 5,
    bezier = "easeOut",
    style = "popin 85%",
})


hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 4,
    bezier = "easeOut",
    style = "popin 85%",
})


hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 5,
    bezier = "smooth",
})


hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5,
    bezier = "easeOut",
})


hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5,
    bezier = "easeOut",
    style = "slide",
})


-- =========================================
-- APPLICATIONS
-- =========================================

hl.bind(
    "SUPER + RETURN",
    hl.dsp.exec_cmd("kitty")
)

hl.bind(
    "SUPER + B",
    hl.dsp.exec_cmd("firefox")
)

hl.bind(
    "SUPER + E",
    hl.dsp.exec_cmd("thunar")
)

hl.bind(
    "SUPER + SPACE",
    hl.dsp.exec_cmd("rofi -show drun")
)


-- =========================================
-- WINDOWS
-- =========================================

hl.bind(
    "SUPER + Q",
    hl.dsp.window.close()
)

hl.bind(
    "SUPER + V",
    hl.dsp.window.float({ action = "toggle" })
)

hl.bind(
    "SUPER + F",
    hl.dsp.window.fullscreen()
)

-- =========================================
-- FOCUS
-- =========================================

hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))


-- =========================================
-- MOVE WINDOWS
-- =========================================

hl.bind("SUPER + SHIFT + H",
    hl.dsp.window.move({ direction = "left" })
)

hl.bind("SUPER + SHIFT + L",
    hl.dsp.window.move({ direction = "right" })
)

hl.bind("SUPER + SHIFT + K",
    hl.dsp.window.move({ direction = "up" })
)

hl.bind("SUPER + SHIFT + J",
    hl.dsp.window.move({ direction = "down" })
)







-- =========================================
-- AUDIO
-- =========================================

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
    )
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    )
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    )
)


-- =========================================
-- MEDIA
-- =========================================

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause")
)

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next")
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous")
)


-- =========================================
-- BRIGHTNESS
-- =========================================

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl set 5%+")
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl set 5%-")
)


-- ---------- AUTOSTART ----------

hl.dsp.exec_cmd("bash /home/tony/.config/hypr/scripts/startup.sh")
