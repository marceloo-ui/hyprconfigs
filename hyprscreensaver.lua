-- Omarchy-style screensaver
-- Renderer + launcher live in ~/.local/bin/{screensaver,screensaver-run}
-- Logo: ~/.config/screensaver/logo.txt
-- Idle timings: ~/.config/hypr/hypridle.conf

hl.window_rule({
    match = {
        class = "^screensaver$",
    },
    fullscreen = true,
    float = true,
    no_blur = true,
    no_shadow = true,
    opaque = true,
})

-- Super + Ctrl + Esc: toggle screensaver
hl.bind("SUPER + CTRL + ESCAPE", hl.dsp.exec_cmd("~/.local/bin/screensaver toggle"))

-- Start the idle daemon if it is installed
hl.on("hyprland.start", function()
    hl.exec_cmd("command -v hypridle >/dev/null && hypridle")
end)
