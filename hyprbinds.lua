---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Set programs that you use (must be declared before the binds that use them)
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "qs -c isra ipc call launcher toggle"
local browser     = "zen-browser"
local gameoverlay = "qs -c isra ipc call gameoverlay toggle"

-- Example binds, see https://wiki.hypr.land/configuring/core/binds/ for more
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(gameoverlay))
-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Media keys drive israshell's media widget (no playerctl needed)
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("qs -c isra ipc call media next"),        { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("qs -c isra ipc call media togglePlaying"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("qs -c isra ipc call media togglePlaying"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("qs -c isra ipc call media previous"),    { locked = true })
 
---------------------------------------------------------
---- ISRASHELL (Quickshell) -----------------------------
---------------------------------------------------------

-- Start the shell with the compositor.
hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --all")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("/home/etternalize/.local/bin/osu-mpris")
    hl.exec_cmd("qs -c isra")
end)

-- Helper so the binds stay readable.
local function isra(call)
    return hl.dsp.exec_cmd("qs -c isra ipc call " .. call)
end

hl.bind(mainMod .. " + TAB",          isra("overview toggle"))
hl.bind(mainMod .. " + ESCAPE",       isra("powermenu toggle"))
hl.bind(mainMod .. " + SHIFT + ESCAPE", isra("lockscreen lock"))
hl.bind(mainMod .. " + PERIOD",       isra("launcher openWith ':'"))   -- emoji
hl.bind(mainMod .. " + SHIFT + C",    isra("launcher openWith ';'"))   -- clipboard
hl.bind(mainMod .. " + COMMA",        isra("wallpaperpicker toggle"))
hl.bind(mainMod .. " + SHIFT + COMMA", isra("quicksettings toggle"))
hl.bind(mainMod .. " + SHIFT + D",    isra("settings open overview"))

hl.bind(mainMod .. "+ SHIFT + S",      isra("screenshot activate"))
hl.bind(mainMod .. " + PRINT",        isra("screenshot region"))
hl.bind(mainMod .. " + SHIFT + PRINT", isra("screenshot window"))
hl.bind(mainMod .. " + SHIFT + R",    isra("screenshot record"))

hl.bind(mainMod .. " + SHIFT + T",    isra("gamemode toggle"))
hl.bind(mainMod .. " + SHIFT + N",    isra("bedtime toggle"))
